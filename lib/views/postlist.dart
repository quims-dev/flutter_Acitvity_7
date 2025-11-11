import 'package:flutter/material.dart';
import 'package:flutter_application_6/model/userdata.dart';
import 'package:flutter_application_6/model/userpost.dart';
import 'package:flutter_application_6/views/profile.view.dart';

class Postlist extends StatefulWidget {
  const Postlist({super.key, required this.userdata});
  final Userdata userdata;

  @override
  State<Postlist> createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {
  var nametxtStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  gotoPage(BuildContext context, dynamic page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  Widget buttons(Userpost userPost) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: userPost.isLiked ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                userPost.isLiked = !userPost.isLiked;
              });
            },
            icon: const Icon(Icons.thumb_up),
            label: const Text('Like'),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(foregroundColor: Colors.grey),
            onPressed: () {
              gotoPage(context, ProfileView(userPost: userPost));
            },
            icon: const Icon(Icons.message),
            label: const Text('Comment'),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(foregroundColor: Colors.grey),
            onPressed: () {},
            icon: const Icon(Icons.share),
            label: const Text('Share'),
          ),
        ],
      );

  Widget postCount(Userpost userPost) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('${userPost.numcomments} Comments'),
          const SizedBox(width: 20),
          Text('${userPost.numshare} Shares'),
        ],
      );

  Widget postImage(Userpost userPost) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(userPost.postimg),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  Widget postHeader(Userpost userPost) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(userPost.userimg),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userPost.username, style: nametxtStyle),
              Row(
                children: [
                  Text('${userPost.time} -'),
                  const Icon(Icons.people, size: 18),
                ],
              ),
            ],
          ),
        ],
      );

  Widget showPost(Userpost userPost) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          postHeader(userPost),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(userPost.postcontent, style: nametxtStyle),
          ),
          postImage(userPost),
          postCount(userPost),
          const Divider(),
          buttons(userPost),
          const SizedBox(height: 15),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.userdata.userlist.length,
      itemBuilder: (context, index) {
        final userpost = widget.userdata.userlist[index];
        return InkWell(
          onTap: () {
            gotoPage(context, ProfileView(userPost: userpost));
          },
          child: showPost(userpost),
        );
      },
    );
  }
}
