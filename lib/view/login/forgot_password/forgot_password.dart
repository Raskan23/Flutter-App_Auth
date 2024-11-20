import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Forgot Password",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot your password?",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              "Enter your email address below and we'll send you a link to reset your password.",
              style: TextStyle(fontSize: 16.0, color: Colors.black54),
            ),
            SizedBox(height: 30.0),
            TextField(
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              height: 45.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  // Add your password reset logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Password reset link sent!"),
                    ),
                  );
                },
                child: Text(
                  "SEND RESET LINK",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back to Login",
                style: TextStyle(color: Colors.blue, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// //Firebase Password Reset Logic
// onPressed: () async {
//   try {
//     await FirebaseAuth.instance
//         .sendPasswordResetEmail(email: emailController.text);
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Password reset link sent!")),
//     );
//     Navigator.pop(context);
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Error: ${e.message}")),
//     );
//   }
// },

