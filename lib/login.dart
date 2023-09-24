

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'cryptos.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
final emailController=TextEditingController();
final passwordController=TextEditingController();

@override
void dispose()
{
  emailController.dispose();
  passwordController.dispose();
  
}

class _LoginPageState extends State<LoginPage> {
   
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Login "),
          ),
          body: SingleChildScrollView(
            reverse: true,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 250,
                    height: 100),
                  Image.network(
                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.fio1nXsUCvmMVKmVqHO0cgHaHa%26pid%3DApi&f=1&ipt=82c6d06016b61ad53838a2df45ce85b8187e3de838072dbdd39a5d40aafe80aa&ipo=images",height: 100,width:100,),
                  SizedBox(
                    width: 250,
                    height: 40),
                  SizedBox(
                    width: 250,
                    height: 100,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'User Name'),
                    ),
                  ),
                  //SizedBox(width: 50,height: 50,),
                  SizedBox(
                    width: 250,
                    height: 100,
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Password'),
                    ),
                  ),
                  SizedBox(width: 100, height: 10),
                  SizedBox(
                    width: 150,
                    child: TextButton(
                      onPressed: () {
                         final user=FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim())
                         .then((userCred){final user=userCred.user;Navigator.push(context, MaterialPageRoute(builder: (context)=>Cryptos()));})
                         .catchError(((err){
                          showDialog(context: context, builder: (context)=>AlertDialog(actions: [Center(child: SizedBox(width: 200,height: 200,child: Text("Login Error")))],));}));
                          
                      },
                      child: Text("Login"),
                      style: TextButton.styleFrom(
                          side: BorderSide(
                        width: 3,
                      )),
                    ),
                  )
                ],
              ),
            ),
          ));
  }
}


