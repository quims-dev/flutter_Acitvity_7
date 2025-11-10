import 'package:flutter/material.dart';
import 'package:flutter_application_6/model/usercomment.dart';
import 'package:flutter_application_6/model/userdata.dart';
import 'package:flutter_application_6/model/userpost.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key, required this.userPost});

  final Userpost userPost;
  final Userdata userData = Userdata();

  var nametxtStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  var boldtxtStyle = const TextStyle(fontWeight: FontWeight.bold);

  var boldtxtStyle1 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  Widget commentBtn (Usercomment userComment) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(userComment.commenterTime),
        const SizedBox(width: 15),
        const Text('Like'),
        const SizedBox(width: 15),
        const Text('Reply'),
      ],
    ),
  );

  Widget commentDesc (Usercomment userComment) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(userComment.commenterName, style: boldtxtStyle,),
        const SizedBox(height: 5),
        Row(children: [Text(userComment.commenterContent)]),
      ],
    ),
    );

    Widget commentSpace (Usercomment userComment) => Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(35, 158, 158, 158),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: commentDesc(userComment),
    );

    Widget commenterPic (Usercomment userComment) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CircleAvatar(
        backgroundImage: AssetImage(userComment.commenterImg),
        radius: 20,
      ),
    );


    Widget usercommenterline (Userpost userPost, Usercomment userComment) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        commenterPic(userComment),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [commentSpace(userComment), commentBtn(userComment)],
        )
      ],
    );

    Widget userpostdetails (Usercomment userComment) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        usercommenterline(userPost, userComment)
      ],
    );

    Widget commenters(Userpost userPost) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Divider(color: Colors.grey),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(children: [Text(userPost.numshare, style: boldtxtStyle,)],),
        ),
        const SizedBox(height: 15),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text('All comments', style: boldtxtStyle1),
            const Icon(Icons.arrow_drop_down),
          ],
        ))
      ],
    );

    Widget buttons(Userpost userPost) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Divider(
          color: Colors.grey,
        ),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: userPost.isLiked ? Colors.grey :Colors.blue,
              ),
              onPressed: () {},
              icon: const Icon(Icons.thumb_up, size: 20),
              label: const Text('Like'),
              ),
              TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey ,
              ),
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble, size: 20),
              label: const Text('comment'),
              ),
              TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey ,
              ),
              onPressed: () {},
              icon: const Icon(Icons.share, size: 20),
              label: const Text('Share'),
              ),
          ],
        ),
        ),
      ],
    );

      Widget userline(Userpost userPost) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage(userPost.userimg),
              radius: 20,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userPost.username, style: nametxtStyle,),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Text(userPost.time),
                  const Text('.'),
                  const Icon(Icons.group, size: 15, color: Colors.grey),
                ],
              ),
            ],
          ),
        ],
      );

      Widget postimage (Userpost userPost) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [Text(userPost.postcontent)]),
              const SizedBox(height: 15),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  userPost.postimg,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ), 
        );


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(onPressed: (){Navigator.pop(context);},
        icon:const Icon(Icons.arrow_back, color: Colors.grey),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          userline(userPost),
          postimage(userPost),
          buttons(userPost),
          commenters(userPost),
          ...userData.commentList.map((userComment) => userpostdetails(userComment)),
        ],
      ),
    );
  }
}