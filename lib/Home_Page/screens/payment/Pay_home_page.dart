import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register/Home_Page/screens/payment/payment_controller.dart';

class PayHomePage extends StatefulWidget {
  const PayHomePage({Key? key}) : super(key: key);
  @override
  _PayHomePageState createState() => _PayHomePageState();
}

class _PayHomePageState extends State<PayHomePage> {
  final myControllerTname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(PaymentController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation'),
        //back button disabled
        //automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: myControllerTname,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Amount in MYR',
            ),
          ),
          InkWell(
            onTap: () {
              controller.makePayment(
                  amount: myControllerTname.text, currency: 'MYR');
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Make Donation',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}