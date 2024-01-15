import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/View/home.dart';
import 'package:crypto/View/splash.dart';
import 'package:crypto/components/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscure = true;
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String? email;
  String? password;

  Future<void> login() async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mailController.text,
        password: passController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Splash()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid credentials. Please try again.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: container(context),
      ),
    );
  }

  Widget container(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      physics: ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
      child: Center(
        child: Container(
          padding: EdgeInsets.only(top: wid * 0.3, bottom: wid * 0.04, left: wid * 0.1, right: wid * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 0),
              Text(
                'Join us now',
                style: TextStyle(
                  fontSize: wid * 0.1,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Sign in',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: wid * 0.09,
                  color: Colors.amber,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 40),
              Container(
                width: wid * 0.9,
                height: 50,
                padding: EdgeInsets.only(right: wid * 0.1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
                child: TextFormField(
                  controller: mailController,
                  decoration: InputDecoration(
                    prefixIconColor:  Color(0xffFBC700),
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'Enter E-mail',
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: wid * 0.9,
                height: 50,
                padding: EdgeInsets.only(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                    width: 2,
                    color:  Colors.black,
                  ),
                ),
                child: TextFormField(
                  obscureText: isObscure,
                  controller: passController,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    ),
                    prefixIconColor:Color(0xffFBC700),
                    prefixIcon: Icon(Icons.password),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(height: 30,),
              SizedBox(
                width: wid * 0.8,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    backgroundColor: Color(0xffFBC700),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  onPressed: () async {
                    login();
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: wid * 0.8,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    backgroundColor: Color(0xFF303030),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Text(
                    'Create new account',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
