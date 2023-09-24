import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'cryptos.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}
final emailController= TextEditingController();
final passwordController= TextEditingController();
class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
            child: Column(
          children: [
            Image.network(
              "https://i.pinimg.com/564x/68/3c/96/683c969bf2e29f76fb4789b6958327ff.jpg",
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 250,
              height: 100,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'User Name'),
              ),
            ),
            SizedBox(
              width: 250,
              height: 100,
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
              ),
            ),
            SizedBox(
              width: 250,
              height: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password'),
              ),
            ),
            SizedBox(width: 100, height: 10),
            SizedBox(
              width: 150,
              child: TextButton(
                onPressed: () {
                         final user=FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim())
                         .then((userCred){final user=userCred.user;Navigator.push(context, MaterialPageRoute(builder: (context)=>Cryptos()));})
                         .catchError(((err){
                          showDialog(context: context, builder: (context)=>AlertDialog(actions: [Center(child: SizedBox(width: 200,height: 200,child: Text("Login Error")))],));}));
                          
                      },
                child: Text("Register"),
                style: TextButton.styleFrom(
                    side: BorderSide(
                  width: 3,
                )),
              ),
            )
          ],
        )),
      ),
    );
  }
}

