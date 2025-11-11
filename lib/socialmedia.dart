import 'package:flutter/material.dart';
import 'package:flutter_application_6/model/userdata.dart';
import 'package:flutter_application_6/views/friendlist.dart';
import 'package:flutter_application_6/views/infoheader.dart';
import 'package:flutter_application_6/views/mainheader.dart';
import 'package:flutter_application_6/views/postlist.dart';

class Socialmedia extends StatefulWidget {
  const Socialmedia({super.key});

  @override
  State<Socialmedia> createState() => _SocialmediaState();
}

class _SocialmediaState extends State<Socialmedia> {
  Userdata userdata = Userdata();

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quimbo Activity 6',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true, 
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Mainheader(userdata: userdata),
          Infoheader(userdata: userdata),
          Friendlist(userdata: userdata),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [Text('Posts', style: followTxtStyle)],
            ),
          ),
          const SizedBox(height: 20),
          Postlist(userdata: userdata),
        ],
      ),
    );
  }
}