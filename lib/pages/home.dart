import 'package:flutter/material.dart';

import '../widgets.dart';
import 'details.dart';

class Home extends StatefulWidget {
  final String name;
  const Home({super.key,required this.name});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool icecream = false, pizza = false, salad = false, burger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hi ${widget.name}!!",
                  style:AppWidget.boldTextFeildStyle(),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                )
              ],
            ),
            const SizedBox(height:30,),

            Text("Delicious Food",style:AppWidget.headTextFeildStyle(),
            ),
            const SizedBox(height:5,),

            Text("Discover and get great foods",style:AppWidget.lightTextFeildStyle(),
            ),
            const SizedBox(height:30,),
            ShowItem(),
            const SizedBox(height:30,),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>const Details()));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/salad.jpg",
                                height: 150,width: 150,),
                              Text("Veggie Taco Hash",
                                style: AppWidget.semiBoldTextFeildStyle(),),
                              const SizedBox(height: 5,),
                              Text("Fresh and Healthy",
                                style: AppWidget.lightTextFeildStyle(),),
                              const SizedBox(height: 5,),
                              Text("\$25",
                                style: AppWidget.semiBoldTextFeildStyle(),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.all(4),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/salad.jpg",
                              height: 150,width: 150,),
                            Text("Mix veg salad",
                              style: AppWidget.semiBoldTextFeildStyle(),),
                            const SizedBox(height: 5,),
                            Text("Spicy with onion",
                              style: AppWidget.lightTextFeildStyle(),),
                            const SizedBox(height: 5,),
                            Text("\$28",
                              style: AppWidget.semiBoldTextFeildStyle(),),
                          ],
                        ),
                      ),
                    ),
                  )


                ],
              ),
            ),

            const SizedBox(height: 20),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: Row(
                  children: [
                    Image.asset("assets/images/salad.jpg",
                      height: 120,
                      width: 120,),

                    const SizedBox(height: 40),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text("Italian Chopped Chicken Salad",style: AppWidget.headTextFeildStyle() ,),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text("Honey Goot cheese",style: AppWidget.lightTextFeildStyle() ,),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text("\$24",style: AppWidget.semiBoldTextFeildStyle() ,),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text("Italian Chopped Chicken Salad",style: AppWidget.headTextFeildStyle() ,),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text("Honey Goot cheese",style: AppWidget.lightTextFeildStyle() ,),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text("\$24",style: AppWidget.semiBoldTextFeildStyle() ,),
                          )
                        ],),
                    )
                  ]
              ),
            )

          ],
        ),
      ),


    );
  }

  Widget  ShowItem(){
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          const SizedBox(height:5,),
          GestureDetector(
            onTap: (){
              icecream = true;
              pizza = false;
              salad = false;
              burger = false;
              setState(() {

              });
            } ,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(5),
              child: Container(
                decoration: BoxDecoration( color: icecream? Colors.black:Colors.white,borderRadius: BorderRadius.circular(8)),
                height: 60,
                width: 60,
                child: Image.asset("assets/images/ice-cream-icon-png-10.png",color: icecream? Colors.white:Colors.black,),
              ),
            ),
          ),
          const SizedBox(height:5,),
          GestureDetector(
            onTap: (){
              salad = true;
              icecream = false;
              pizza = false;
              burger = false;
              setState(() {

              });
            } ,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(5),
              child: Container(
                decoration: BoxDecoration( color: salad? Colors.black:Colors.white,borderRadius: BorderRadius.circular(8)),
                height: 60,
                width: 60,
                child: Image.asset("assets/images/salad2.png",color: salad? Colors.white:Colors.black,),
              ),
            ),
          ),
          const SizedBox(height:5,),
          GestureDetector(
            onTap: (){
              icecream = false;
              pizza = true;
              salad = false;
              burger = false;
              setState(() {

              });
            } ,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(5),
              child: Container(
                decoration: BoxDecoration( color: pizza? Colors.black:Colors.white,borderRadius: BorderRadius.circular(8)),
                height: 60,
                width: 60,
                child: Image.asset("assets/images/pizza 2.png",color: pizza? Colors.white:Colors.black,),
              ),
            ),
          ),
          const SizedBox(height:5,),
          GestureDetector(
            onTap: (){
              icecream =false ;
              pizza = false;
              salad = false;
              burger = true;
              setState(() {
              });
            } ,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(5),
              child: Container(
                decoration: BoxDecoration( color: burger? Colors.black:Colors.white,borderRadius: BorderRadius.circular(8)),
                height: 60,
                width: 60,
                child: Image.asset("assets/images/Untitled design.png",color: burger? Colors.white:Colors.black,),
              ),
            ),
          ),
          const SizedBox(height:5,),
        ]
    );
  }

}
