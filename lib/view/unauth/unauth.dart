import 'package:MahiGo_Fix/services/google_sign_in_provider.dart';
import 'package:flutter/material.dart';
import '../login/login_user.dart'; // Importing the Login page
import '../register/register_user.dart'; // Importing the Register page

class UnAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://www.southernadvantagedoor.com/wp-content/uploads/2024/06/GettyImages-669377442-6x6-1.jpg"), // Online placeholder image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              height: 200.0,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.blue, // Custom color for LOGIN button
                          ),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            // Navigate to login route
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginUser(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 40.0),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .green, // Custom color for REGISTER button
                          ),
                          child: Text(
                            "REGISTER",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            // Navigate to register route
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    Register(), // Navigate to Register page
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Colors.grey, // Custom divider color
                        ),
                      ),
                      Container(
                        child: Text(
                          "Or connect with social",
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey, // Custom divider color
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      GoogleSignInProvider.signInWithGoogle(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      height: 45.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.blue), // Custom border color
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons
                                .g_translate, // Flutter default icon for Google
                            color: Colors.blue, // Custom icon color
                          ),
                          Expanded(
                            child: Text(
                              "Login with Google",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blue, // Custom text color
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
