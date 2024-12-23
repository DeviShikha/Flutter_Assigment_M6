// import 'package:cheatapplication/Dashboard.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class NavigationScreen extends StatefulWidget {
//   const NavigationScreen({super.key});

//   @override
//   State<NavigationScreen> createState() => _NavigationScreenState();
// }

// class _NavigationScreenState extends State<NavigationScreen> {
//   int selectScreen = 0;

//   List<Widget> mywidget = [
//   // Dashboard(user: ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//          bottomNavigationBar: BottomNavigationBar(
//           showSelectedLabels: true,
//          // unselectedFontSize: Colors.white,
//          type: BottomNavigationBarType.fixed,
//          selectedItemColor: Colors.red,
//          currentIndex: selectScreen,
//          onTap: (value) {
//            setState(() {
//              selectScreen = value;
//            });
//          },
//           items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home),label: "Chat"),
//           BottomNavigationBarItem(icon: Icon(Icons.person),label: "Person"),
//           BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting"),
//          ]),
//         // body: mywidget[selectScreen],
//     );
//   }
// }