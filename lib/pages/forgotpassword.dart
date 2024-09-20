import 'package:delivery_app_with_admin_panel/pages/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController mailcontroller = TextEditingController();

  String email="";
  final _formkey = GlobalKey<FormState>();
  
  resetPassword()async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
        content: Text("Password reset email has been sent",style: TextStyle(fontSize: 18),),))
      );
    }on FirebaseAuthException catch (e){
      if(e.code =="user-not-found"){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No user found for that email",style: TextStyle(fontSize: 18),)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
     body:  Container(
       child: Column(
         children: [
           const SizedBox(height: 70,),
           Container(
             alignment: Alignment.topCenter,
             child: const Text("Password Recovery",style: TextStyle(
               color: Colors.white,
               fontSize: 30,
               fontWeight: FontWeight.bold,
             ),),
           ),
           const SizedBox(height: 10,),
           const Text("Enter your mail",
           style: TextStyle(
             color: Colors.white,
             fontSize: 20,
             fontWeight: FontWeight.bold,
           ),),
           Expanded(
               child: Form(
                 key: _formkey,
                 child: ListView(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                         padding: const EdgeInsets.symmetric(horizontal: 10),
                         decoration: BoxDecoration(
                           border: Border.all(color: Colors.white,width: 2),
                           borderRadius: BorderRadius.circular(30)
                         ),
                         child:  TextFormField(
                           controller: mailcontroller,
                        validator: (value){
                             if(value==null||value.isEmpty){
                               return 'Please Enter Email';
                           }
                             return null;
                           },
                       style: const TextStyle(color: Colors.white),
                           decoration: const InputDecoration(
                             hintText: 'Email',
                             hintStyle: TextStyle(fontSize: 18,color: Colors.white),
                             prefixIcon: Icon(
                               Icons.person,color: Colors.white70,size:30,),
                             border: InputBorder.none
                           ),

                         ),
                       ),
                     ),
                     const SizedBox(height: 40.0,),
                     Container(
               margin: EdgeInsets.symmetric(horizontal: 10),
                       child: GestureDetector(
                         onTap: (){
                           if(_formkey.currentState!.validate()){
                             setState(() {
                               email= mailcontroller.text;
                             });
                             return resetPassword();
                           }
                         },
                         child: Container(
                           width: 140,
                           padding: const EdgeInsets.all(10),
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(10)
                           ),
                           child:const Center(
                             child: Text("Send Email",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                           ) ,
                         ),
                       ),
                     ),
                     const SizedBox(height: 50,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         const Text("Don't have an account?",style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold,color: Colors.white ),),
                         const SizedBox(width: 10.0,),
                         GestureDetector(
                             onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                             },
                             child: const Text("Create",style: TextStyle(color: Colors.amberAccent,fontSize: 20,fontWeight: FontWeight.w500),))
                       ],
                     )
                   ],

                 ),
               )
           ),



         ],
       ),
     )
    );
  }
}
