// OtpVerification.dart
import 'package:flutter/material.dart';
import '../../home  Screen/home_screen.dart';
import '../../botoom bar/bottom_bar.dart';

class OtpVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OTP Verification")),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Enter OTP",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30.0),
            PinCodeTextField(),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text("Verify OTP"),
            ),
          ],
        ),
      ),
    );
  }
}

class PinCodeTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(6, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            width: 40.0,
            height: 50.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: TextField(
                maxLength: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  counterText: '',
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
