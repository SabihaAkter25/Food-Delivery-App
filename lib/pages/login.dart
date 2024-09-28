import 'package:delivery_app_with_admin_panel/pages/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';
import 'bottomnav.dart';
import 'forgotpassword.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "", password = "";
  final _formkey = GlobalKey<FormState>();
  TextEditingController useremailcontroller = TextEditingController();
  TextEditingController userpasswordcontroller = TextEditingController();

  // Assuming you have a login form where the user enters their name, email, and password.
  userLogin(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: useremailcontroller.text, password: userpasswordcontroller.text);

      // After successful login, navigate to BottomNav or Home without calling setState
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNav(name: '')),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == 'user-not-found') {
        errorMessage = "No User Found For This Email";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Wrong Password";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errorMessage,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        // Wrap the whole content with ListView
        children: [

          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black45,
                      Colors.black,
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
                height: MediaQuery.of(context).size.height / 5.3,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: const SizedBox.shrink(),
              ),
              Column(
                children: [
                  const SizedBox(height: 150),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Material(
                      elevation: 30,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: MediaQuery.of(context).size.height / 2.3,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextFormField(
                                  controller: useremailcontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter An Email';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: AppWidget.boldTextFeildStyle(),
                                    prefixIcon: const Icon(Icons.email),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                TextFormField(
                                  controller: userpasswordcontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Password';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: AppWidget.boldTextFeildStyle(),
                                    prefixIcon: const Icon(Icons.password),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ForgotPassword()),
                                    );
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: AppWidget.boldTextFeildStyle(),
                                  ),
                                ),
                                const SizedBox(height: 70),
                                GestureDetector(
                                  onTap: () {
                                    if (_formkey.currentState!.validate()) {
                                      userLogin(context); // Call userLogin after validation
                                    }
                                  },
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20),
                                    elevation: 20,
                                    child: Container(
                                      height: 30,
                                      width: 200,
                                      color: Colors.black,
                                      child: const Center(
                                        child: Text(
                                          "LOGIN",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                      );
                    },
                    child: const Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
