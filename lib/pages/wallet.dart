
import 'package:flutter/material.dart';

import '../widgets.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
    Map<String, dynamic>? paymentIntent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 10,
              child: Center(
                  child: Text("Wallet",style:AppWidget.headTextFeildStyle(),)),
            ),
            const SizedBox(height: 30,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: const BoxDecoration(color: Color(0xFFF2F2F2)
              ),
              child: Row(
                children: [
                  Image.asset("assets/images/wallet2.png",height: 60,width: 60,fit: BoxFit.cover,),
                  const SizedBox(width: 40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Your Wallet",style: AppWidget.semiBoldTextFeildStyle(),),
                      const SizedBox(height: 5,),
                      Text("\$"+"100",style: AppWidget.boldTextFeildStyle(),),

                    ],
                  )

                ],
              ),
            ),
           const SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.only(left: 20.0),
             child: Text("Add Money",style:AppWidget.boldTextFeildStyle(),),
           ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(width:2,color: const Color(0xFFE9E2E2)),
                    borderRadius: BorderRadius.circular(5),

                  ),
                  child: Text("\$"+"100",style: AppWidget.semiBoldTextFeildStyle(),),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(width:2,color: const Color(0xFFE9E2E2)),
                    borderRadius: BorderRadius.circular(5),

                  ),
                  child: Text("\$"+"500",style: AppWidget.semiBoldTextFeildStyle(),),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(width:2,color: const Color(0xFFE9E2E2)),
                    borderRadius: BorderRadius.circular(5),

                  ),
                  child: Text("\$"+"1000",style: AppWidget.semiBoldTextFeildStyle(),),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(width:2,color: const Color(0xFFE9E2E2)),
                    borderRadius: BorderRadius.circular(5),

                  ),
                  child: Text("\$"+"2000",style: AppWidget.semiBoldTextFeildStyle(),),
                ),

              ],
            ),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0x760094F0),
                borderRadius: BorderRadius.circular(10)
              ),
              child: const Center(child: Text("Add Money",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),),
            )
          ],
        ) ,
      ),
    );
  }
 }

// Future<void> makePayment(String amount)async{
//   try{
//     paymentIntent = await createPaymentIntent(amount,'INR');
//     await Stripe.instance.initPaymentSheet(paymentSheetParameters:SetupPaymentSheetParameters(
//         paymentIntentClientSecret: paymentIntent!['client_secret'],
//         style:ThemeMode.dark,
//         merchantDisplayName:'Rupa'
//
//     )).then((value) => {});
//     displayPaymentSheet(amount);
//
//   }catch(e,s){
//     print('exception:$e$s');
//   }
// }
// displayPaymentSheet(String amount)async{
//   try{
//     await Stripe.instance.presentPaymentSheet().then((value)async{
//       showDialog(context:context,builder:(_)=> const AlertDialog(
//         content:Column(
//           children: [
//
//             Row(
//               children: [
//                 Icon(Icons.check_circle,color: Colors.green,),
//                 Text("Payment successfull"),
//               ],),
//           ],),
//       ) );
//
//       paymentIntent=null;
//     }).onError((error, stackTrace) {
//       print("Error is : ----> $error $stackTrace");
//     });
//   }on StripeException catch(e){
//     print("Error is : ----> $e");
//     showDialog(context: context, builder:(_)=> const AlertDialog(
//       content: Text("Cancelled"),
//     ));
//
//   }catch(e){
//     print('$e');
//   }
// }
// createPaymentIntent(String amount, String currency) async {
//   try{
//     Map<String, dynamic> body={
//       'amount': calculateAmount(amount),
//       'currency': currency,
//       'payment_method_types[]':'card',
//     };
//     var responce = await http.post(
//       Uri.parse('http://api.stripe.com/v1/payment_intents'),
//       headers:{
//         'Authorization':'Bearer $secretKey',
//         'Content-Type': "application/x-www-form-urlencoded"
//
//       },
//       body:body,
//     );
//     print("Payment Intent Body ->>> ${responce.body.toString()}");
//     return jsonDecode(responce.body);
//   }catch(err){
//     print("err changing user: ${err.toString()}");
//
//   }
// }
// calculateAmount(String amount){
//   final calculatedAmount = (int.parse(amount)*100);
//
//   return calculatedAmount.toString();
// }
