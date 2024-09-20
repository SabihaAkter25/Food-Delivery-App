
import 'package:delivery_app_with_admin_panel/pages/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';
import 'bottomnav.dart';
import 'forgotpassword.dart';

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

  TextEditingController nameController = TextEditingController(); // Add a TextEditingController for the name

// Assuming you have a login form where the user enters their name, email, and password.

  userLogin(BuildContext context) async {
    String name = nameController.text;  // Capture the user's name from the input field

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      // Ensure name is passed when navigating to BottomNav
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNav(name:nameController.text)), // Pass the name here
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "No User Found For This Email",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Wrong Password by User",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ));
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black45,
                      Colors.black
                    ]),

              ),
            ),


            Container(
              margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/3 ),
              height: MediaQuery.of(context).size.height/5.3,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Text(""),
            ),
            Container(
              child: Column(
                children: [
                  const SizedBox(height: 150),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Material(
                      elevation: 30,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: MediaQuery.of(context).size.height / 2.3,
                        width: MediaQuery.of(context).size.width,
                        decoration:  BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child:  Align(
                          alignment: Alignment.topCenter,
                          child: Form(
                            key:_formkey,
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
                                  validator: (value){
                                    if(value==null||value.isEmpty){
                                      return 'Please Enter An Email';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(hintText:"Email", hintStyle: AppWidget.boldTextFeildStyle(),prefixIcon: const Icon(Icons.email)),
                                ),
                                const SizedBox(height: 30),
                                TextFormField(
                                  controller: userpasswordcontroller,
                                  validator: (value){
                                    if(value==null||value.isEmpty){
                                      return 'Please Enter Password';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(hintText:"Password", hintStyle: AppWidget.boldTextFeildStyle(),prefixIcon: Icon(Icons.password)),
                                ),
                                const SizedBox(height: 30,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>ForgotPassword()));
                                  },
                                    child: Text("Forgot Password?",style: AppWidget.boldTextFeildStyle(),)),
                                const SizedBox(height: 70,),

                                GestureDetector(
                                  onTap: () {
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {
                                        email = useremailcontroller.text;
                                        password = userpasswordcontroller.text;
                                      });
                                      userLogin(context); // Call userLogin function after validation
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
                  const SizedBox(height: 70,),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> SignUpPage()));
                      },
                      child: const Text("Dont have an account? Sign Up",style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold ),))
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
