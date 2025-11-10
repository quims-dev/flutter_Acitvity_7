



import 'package:flutter_application_6/model/account.dart';
import 'package:flutter_application_6/model/friend.dart';
import 'package:flutter_application_6/model/usercomment.dart';
import 'package:flutter_application_6/model/userpost.dart';

class Userdata{
  List<Userpost> userlist =[
    Userpost(
      userimg: 'assets/Person1.png',
      username: 'John Doe',
      time: '2 hrs ago',
      postcontent: 'Had a great day at the beach1',
      postimg: 'assets/cake1.png',
      numcomments: '24',
      numshare: '5',
      isLiked: false,
    ),

    Userpost(
      userimg: 'assets/Person2.png',
      username: 'Jane Smith',
      time: '3 hrs ago',
      postcontent: 'Lovin the new cafe in town',
      postimg: 'assets/cake2.png',
      numcomments: '24',
      numshare: '5',
      isLiked: false,
    ),

    Userpost(
      userimg: 'assets/Person3.png',
      username: 'Mike Johnson',
      time: '3 hrs ago',
      postcontent: 'just finish 10km in 5 mins',
      postimg: 'assets/cake1.png',
      numcomments: '30',
      numshare: '20',
      isLiked: true,
    ),

    Userpost(
      userimg: 'assets/Person4.png',
      username: 'John Doe',
      time: '10 hrs ago',
      postcontent: 'Had a great day at the beach1',
      postimg: 'assets/cake1.png',
      numcomments: '24',
      numshare: '5',
      isLiked: true,
    ),
  ];
  List<Friend> friendList = [
      Friend(img: 'assets/Person1.png', name: 'Alice'),
      Friend(img: 'assets/Person2.png', name: 'Bob'),
      Friend(img: 'assets/Person3.png', name: 'Charlie'),
      Friend(img: 'assets/Person4.png', name: 'Diane'),
      Friend(img: 'assets/Person5.png', name: 'Ethan'),
      Friend(img: 'assets/Person6.png', name: 'Michael'),
];


  List<Usercomment> commentList = [
    Usercomment(commenterImg: 'assets/Person2.png', 
                commenterName: 'Jane Smith', 
                commenterTime: '6 hrs', 
                commenterContent: 'Wow Beautiful!'),
    Usercomment(commenterImg: 'assets/Person3.png', 
                commenterName: 'Kenneth Vladimir', 
                commenterTime: '2 hrs', 
                commenterContent: 'Wow Beautiful!'),
    Usercomment(commenterImg: 'assets/Person4.png', 
                commenterName: 'Miko Rojo', 
                commenterTime: '8 hrs', 
                commenterContent: 'Wow Beautiful!'),                        

  ];

  Account myUserAccount = Account(name: 'Michael Velez', 
  email: 'Michaelvelez1123@gmail.com', 
  img:'assets/Person2.png', 
  numFollowers: '15', 
  numPost: '350', 
  numFollowing: '150', 
  numFriends: '50');

} 