import 'package:flutter/material.dart';

import '../widgets.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a =1;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:30,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child:   const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,)
            ),
            const SizedBox(height: 30,),
            Image.asset("assets/images/salad.jpg",
              width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.5,fit:
              BoxFit.fill,),
            const SizedBox(height: 30,),
            Row(

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mediterranean",style: AppWidget.headTextFeildStyle(),),
                    Text("Chickpea Salad",style: AppWidget.boldTextFeildStyle(),)
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    ++a;
                    setState(() {
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(7)),
                    child: const Icon(Icons.add,color: Colors.white,),
                  ),
                ),
                const SizedBox(width: 20,),
                Text(a.toString(),style: AppWidget.boldTextFeildStyle(),),
                const SizedBox(width: 20,),
                GestureDetector(
                  onTap: (){
                    if(a>1) {
                      --a;
                    }
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.remove,color: Colors.white,),
                  ),
                )
              ],),
            const SizedBox(height: 20,),
            Text(" Chickpea Salad!! Fresh veggies, herbs, and a zesty dressing add bold flavor to this chickpea salad recipe. Healthy and satisfying, it's perfect for picnics and lunches!",
              style:AppWidget.lightTextFeildStyle(),maxLines: 4,
            ),
            const SizedBox(height: 20,),
            Row(children: [
              Text("Delivery Time",style: AppWidget.boldTextFeildStyle(),),
              const SizedBox(width: 40,),
              const Icon(Icons.alarm),
              const SizedBox(width: 4,),
              Text("30min",style: AppWidget.boldTextFeildStyle(),),
            ],
            ),
            const Spacer(),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price", style:AppWidget.boldTextFeildStyle(),),
                      Text("\$25", style:AppWidget.headTextFeildStyle(),)
                    ],
                  ),
                  const SizedBox(width: 100,),
                  Container(

                    decoration:  BoxDecoration(color: Colors.black,
                        borderRadius:BorderRadius.circular(15) ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text("Add to cart",style: TextStyle(color: Colors.white,)),
                          const SizedBox(width: 40,),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              decoration: const BoxDecoration(color: Colors.grey),
                              child:const Icon(Icons.shopping_cart_outlined,color: Colors.white,) ,),
                          )
                        ],
                      ),
                    ),
                  )
                ]
            )
          ],
        ),
      ),
    );
  }
}
