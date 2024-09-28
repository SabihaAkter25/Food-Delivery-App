import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';
import 'bottomnav.dart';
import 'login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email = "", password = "", name = "";
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (password != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 20),
            ),
          ),
        );

        // Navigate to BottomNav on successful registration
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNav(name: namecontroller.text)),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.black12,
              content: Text("Password is too weak", style: TextStyle(fontSize: 18)),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.black12,
              content: Text("Account already exists", style: TextStyle(fontSize: 18)),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            // Background gradient
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

            // White container at the bottom part of the screen
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
              child: const Text(""),
            ),

            // The list view for form and sign-up fields
            ListView(

              children: [


                const SizedBox(height: 70), // Add some space below "Foodie"

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () async {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          email = mailcontroller.text;
                          name = namecontroller.text;
                          password = passwordcontroller.text;
                        });
                      }
                    },
                    child: Material(
                      elevation: 30,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // Name input field
                                TextFormField(
                                  controller: namecontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Name';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Name",
                                    hintStyle: AppWidget.boldTextFeildStyle(),
                                    prefixIcon: const Icon(Icons.person),
                                  ),
                                ),
                                const SizedBox(height: 30),

                                // Email input field
                                TextFormField(
                                  controller: mailcontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter E-mail';
                                    }
                                    return null;
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: AppWidget.boldTextFeildStyle(),
                                    prefixIcon: const Icon(Icons.email),
                                  ),
                                ),
                                const SizedBox(height: 30),

                                // Password input field
                                TextFormField(
                                  controller: passwordcontroller,
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
                                const SizedBox(height: 70),

                                // Sign Up button
                                GestureDetector(
                                  onTap: () async {
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {
                                        email = mailcontroller.text;
                                        name = namecontroller.text;
                                        password = passwordcontroller.text;
                                      });
                                    }
                                    registration();
                                  },
                                  child: Material(
                                    elevation: 13,
                                    borderRadius: BorderRadius.circular(29),
                                    child: Container(
                                      height: 50,
                                      width: 200,
                                      color: Colors.black,
                                      child: const Center(
                                        child: Text(
                                          "SIGN UP",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30), // Height below the "SIGN UP" button
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 70),

                // Already have an account? Login link
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                    },
                    child: const Text(
                      "Already have an account? Login",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center, // Ensure text is centered
                    ),
                  ),
                ),


                const SizedBox(height: 20), // Add a bit of space at the bottom
              ],
            ),
          ],
        ),
      ),
    );
  }
}
