import 'package:cheatapplication/Dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  User? user;
  ProfileScreen({super.key, this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();

  Future<void> getUserRecord() async {

    var document = await FirebaseFirestore.instance
        .collection("Data")
        .doc(widget.user!.uid)
        .get();

    setState(() {
      _usernameController.text = document["username"];
      _emailController.text = document["email"];
      print("-------------------->>>>${document["username"]}");
    });
  }

  Future<void> fetchUpdate() async {
    var document = await FirebaseFirestore.instance
        .collection("Data")
        .doc(widget.user!.uid)
        .update({"username": _usernameController.text.toString()});
        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(user: widget.user),));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserRecord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: "Email",
                  label: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                  hintText: "Name",
                  label: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 10,
            ),
            // TextField(
            //   obscureText: true,
            //   controller: _passwordController,
            //   decoration: InputDecoration(
            //       hintText: "password",
            //       label: Icon(Icons.password),
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10))),
            // ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {
              fetchUpdate();
            }, child: Text("Update"))
          ],
        ),
      ),
    );
  }
}
