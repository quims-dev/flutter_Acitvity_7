import 'package:flutter/material.dart';
import 'package:flutter_application_6/model/userdata.dart';

class Infoheader extends StatelessWidget {
  Infoheader({super.key, required this.userdata});
  final Userdata userdata;

  var followTxtStyle = const TextStyle(
    fontSize:20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text('Followers'), Text('Following'), Text('Post')],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(userdata.myUserAccount.numFollowers, style: followTxtStyle,),
            Text(userdata.myUserAccount.numFollowers, style: followTxtStyle,),
            Text(userdata.myUserAccount.numFollowers, style: followTxtStyle,),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(color: Colors.grey),
       ],
      );
    } 
  }