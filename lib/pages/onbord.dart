import 'package:delivery_app_with_admin_panel/pages/signUp.dart';
import 'package:flutter/material.dart';

import '../content_model.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}


class _OnboardState extends State<Onboard> {

  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index){
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_,i){
                    return  Padding(padding: EdgeInsets.all(8),
                        child:Column(
                          children: [
                            Image.asset(contents[i].image,
                              height: 480,
                              width: MediaQuery.of(context).size.width/1.5,
                              fit: BoxFit.fill,),
                            const SizedBox(height: 60),
                            Text(contents[i].title, style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:23),),
                            const SizedBox(height: 40),
                            Text(contents[i].description, style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:17),),
                            const SizedBox(height: 20),

                          ],
                        ));
                  }
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                      (index) => buildDot(index, context, ), // Change color to white
                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                if(currentIndex==contents.length-1){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpPage()));
                }
                _controller.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                ),
                height: 50,
                margin: const EdgeInsets.all(40),
                width: double.infinity,
                child: const Center(child: Text("Next",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),

              ),
            )
          ],
        )
    );
  }
  Container buildDot(int index, BuildContext context, ){
    return Container(
      height: 10,
      width: currentIndex == index? 18:7,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(borderRadius:BorderRadius.circular(6) ,color: Colors.white54),
    );

  }
}
