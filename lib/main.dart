import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.network(
                "https://cdn.dribbble.com/users/900374/screenshots/5331497/currency_2.gif",
                width: 400.0,
                height: 300.0,
              ),
            ),
            Text(
              "                 Crypto Hunt\n A crypto currency price tracker",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Calibri',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 100, height: 100),
            SizedBox(
                width: 150,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                  },
                  child: Text("Login"),
                  style: TextButton.styleFrom(
                      side: BorderSide(
                    width: 3,
                  )),
                )),
            SizedBox(width: 100, height: 50),
            SizedBox(
              width: 150,
              child: TextButton(
                onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ));
                  },
                child: Text("Register"),
                style: TextButton.styleFrom(
                    side: BorderSide(
                  width: 3,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
