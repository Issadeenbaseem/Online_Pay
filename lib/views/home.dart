import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Razorpay _razorpay;
  TextEditingController textEditingController = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _razorpay = new Razorpay();

    TextEditingController textEditingController = new TextEditingController();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerERRORFailure);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _razorpay.clear();
  }

  void openCheckout(){
    var option ={
      "key" : "rzp_test_GlxG8BKVyjTRNR" ,
      "amount" : textEditingController.text,
      "name" : "Boc Payment App ",
      "description" : "Payment for  the random product SE:Baseem_Issadeen",
      "prefill" : {
        "contact" :"0768860812",
        "email" : "issadeenbaseem95@gmail.com"
      },

      "external" :{
        "wallets" : ["paytm"]
      }
    };

    try{
      _razorpay.open(option);

    }catch(e){
      print(e.toString());
    }

  }

  void handlerPaymentSuccess (){
  print("Payment Successfull");
  }
  void handlerERRORFailure(){
    print("Payment Error");

  }

  void handlerExternalWallet(){
    print(" ExternalWallet");

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pay pal Pay"),
      ),
      body: Column(
        children: [
          TextField(
           controller: textEditingController,
            decoration: InputDecoration(
              hintText: "Amount to Pay"
            ),

          ),
          SizedBox(height: 12,),
          RaisedButton(
            color: Colors.blue,
            child: Text(" Pay Now ", style: TextStyle(
              color: Colors.white
            ),),
            onPressed: (){
              openCheckout();
            },
          )
        ],
      ),
    );
  }
}
