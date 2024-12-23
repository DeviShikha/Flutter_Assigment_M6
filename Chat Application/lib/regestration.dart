import 'package:cheatapplication/Signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String? profilePic = "https://cdn-icons-png.flaticon.com/512/3135/3135715.png";
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
 // String? subtitle = "Hello dosto";

  Future<void> registerUser(
      String? username, String? email, String? password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);

      User? user = userCredential.user;

      FirebaseFirestore.instance.collection("Data").doc(user!.uid).set(
          {"email": email, "username": username, "profilePic": profilePic,});

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Signin()));
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Please enter valid data"),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "Enter Your Username",
                label: Text("Username"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Enter Your Email",
                label: Text("Email"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                label: Text("Password"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    registerUser(
                        _usernameController.text.toString(),
                        _emailController.text.toString(),
                        _passwordController.text.toString());
                  });
                },
                child: Text("Submit")),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Signin()));
              },
              child: Text("Click here if already registered"),
            )
          ],
        ),
      ),
    );
  }
}