import 'package:flutter/material.dart';
import 'package:flutter_application_6/model/usercomment.dart';
import 'package:flutter_application_6/model/userdata.dart';
import 'package:flutter_application_6/model/userpost.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.userPost});
  final Userpost userPost;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final Userdata userData = Userdata();
  final TextEditingController commentController = TextEditingController();
  final TextEditingController replyController = TextEditingController();

  Usercomment? replyingTo;

  // ✅ Add new comment
  void addComment() {
    if (commentController.text.trim().isEmpty) return;

    setState(() {
      userData.commentList.add(
        Usercomment(
          commenterImg: 'assets/Person1.png',
          commenterName: 'You',
          commenterTime: 'Just now',
          commenterContent: commentController.text.trim(),
        ),
      );
    });

    commentController.clear();
  }

  // ✅ Add reply to comment
  void addReply(Usercomment parentComment) {
    if (replyController.text.trim().isEmpty) return;

    setState(() {
      final parentIndex = userData.commentList.indexOf(parentComment);
      if (parentIndex == -1) return;

      final newReply = Usercomment(
        commenterImg: 'assets/Person1.png',
        commenterName: 'You',
        commenterTime: 'Just now',
        commenterContent: replyController.text.trim(),
      );

      final updatedParent = parentComment.copyWith(
        replies: [...parentComment.replies, newReply],
      );

      userData.commentList[parentIndex] = updatedParent;
    });

    replyController.clear();
    replyingTo = null;
  }

  // ✅ Like/unlike toggle
  void toggleLike(Usercomment comment) {
    setState(() {
      comment.isLiked = !comment.isLiked;
      comment.isLiked ? comment.numLikes++ : comment.numLikes--;
    });
  }

  // ✅ Reply builder
  Widget buildReply(Usercomment reply) {
    return Padding(
      padding: const EdgeInsets.only(left: 60.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 15, backgroundImage: AssetImage(reply.commenterImg)),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(reply.commenterName, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(reply.commenterContent),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(reply.commenterTime, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => toggleLike(reply),
                        child: Row(
                          children: [
                            Icon(Icons.thumb_up, size: 14, color: reply.isLiked ? Colors.blue : Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              reply.numLikes.toString(),
                              style: TextStyle(fontSize: 12, color: reply.isLiked ? Colors.blue : Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Comment builder
  Widget buildComment(Usercomment comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(radius: 20, backgroundImage: AssetImage(comment.commenterImg)),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(comment.commenterName, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text(comment.commenterContent),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(comment.commenterTime, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => toggleLike(comment),
                            child: Row(
                              children: [
                                Icon(Icons.thumb_up, size: 16, color: comment.isLiked ? Colors.blue : Colors.grey),
                                const SizedBox(width: 3),
                                Text(
                                  comment.numLikes.toString(),
                                  style: TextStyle(color: comment.isLiked ? Colors.blue : Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                replyingTo = (replyingTo == comment) ? null : comment;
                              });
                            },
                            child: const Text(
                              'Reply',
                              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          if (comment.replies.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: comment.replies.map(buildReply).toList(),
            ),

          if (replyingTo == comment)
            Padding(
              padding: const EdgeInsets.only(left: 60.0, right: 8.0, bottom: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: replyController,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Replying to ${comment.commenterName}...',
                        border: const OutlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.blue),
                    onPressed: () => addReply(comment),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // ✅ Buttons under the post (moved here)
  Widget postButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            onPressed: () {
              setState(() {
                widget.userPost.isLiked = !widget.userPost.isLiked;
              });
            },
            icon: Icon(Icons.thumb_up, color: widget.userPost.isLiked ? Colors.blue : Colors.grey),
            label: const Text('Like'),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.comment, color: Colors.grey),
            label: const Text('Comment'),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.share, color: Colors.grey),
            label: const Text('Share'),
          ),
        ],
      ),
    );
  }

  // ✅ Build the screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // ✅ POST HEADER
                ListTile(
                  leading: CircleAvatar(backgroundImage: AssetImage(widget.userPost.userimg)),
                  title: Text(widget.userPost.username, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(widget.userPost.time),
                ),
                // ✅ POST CONTENT
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(widget.userPost.postcontent),
                ),
                Image.asset(widget.userPost.postimg),

                // ✅ BUTTONS moved here (below post)
                const Divider(),
                postButtons(),
                const Divider(),

                // ✅ COMMENTS SECTION
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Comments', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                ...userData.commentList.map(buildComment),
                const SizedBox(height: 80),
              ],
            ),
          ),

          // ✅ COMMENT INPUT FIELD (still at the bottom)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            color: Colors.grey.shade100,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: commentController,
                    decoration: const InputDecoration(
                      hintText: 'Write a comment...',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: addComment,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
