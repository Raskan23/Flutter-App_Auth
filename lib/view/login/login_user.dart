import 'package:MahiGo_Fix/services/google_sign_in_provider.dart';
import 'package:MahiGo_Fix/view/register/register_user.dart';
import 'package:flutter/material.dart';
import 'otp/otp_login.dart';
import '../login/forgot_password/forgot_password.dart';

class LoginUser extends StatefulWidget {
  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  TextEditingController emailCTR = TextEditingController();
  TextEditingController passCTR = TextEditingController();
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white, // Custom background color for AppBar
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Colors.black), // Custom color for back icon
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Register()),
              );
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.blue, // Custom color for Sign Up text
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              _loginForm(context),
              SizedBox(height: 30.0),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      "Or connect using social account",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 45.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.blue, // Custom color for Google button
                          elevation: 0, // Remove shadow
                        ),
                        onPressed: () {
                          // Handle Google login
                          GoogleSignInProvider.signInWithGoogle(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.g_translate_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              "Login with Google",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue, // Custom border color
                        ),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      margin: EdgeInsets.only(top: 10.0),
                      height: 45.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.white, // Custom background color
                          elevation: 0, // Remove shadow
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PhoneNumberInputPage()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.phone,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              "Connect with Phone number",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
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
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: emailCTR,
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
        SizedBox(height: 20.0),
        TextField(
          controller: passCTR,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
        SizedBox(height: 20.0),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ForgotPasswordPage()), // Navigate to ForgotPasswordPage
            );
          },
          child: Text(
            "Forgot password?",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 25.0),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 45.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _loading ? Colors.grey : Colors.blue,
            ),
            onPressed: () {
              if (_loading) {
                return;
              }
              setState(() => _loading = true);
              if (emailCTR.text.isEmpty) {
                showSnake(context, "Please enter your email.");
                setState(() => _loading = false);
              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(emailCTR.text)) {
                showSnake(context,
                    "Hmm, that doesn’t look like a valid email. Could you check it?");
                setState(() => _loading = false);
              } else if (passCTR.text.isEmpty) {
                showSnake(context, 'Please enter your password.');
                setState(() => _loading = false);
              } else if (passCTR.text.length < 6) {
                showSnake(context,
                    'Your password needs to be at least 6 characters long.');
                setState(() => _loading = false);
              } else {
                GoogleSignInProvider.signInWithEmailAndPassword(
                  context: context,
                  email: emailCTR.text,
                  password: passCTR.text,
                ).then((success) {
                  if (mounted) {
                    setState(() => _loading = false);
                  }
                });
              }
            },
            child: Text(
              "LOG IN",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ),
      ],
    );
  }
}

class PhoneNumberInputPage extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme:
            IconThemeData(color: Colors.black), // Custom color for back icon
        title: Text(
          "Enter Your Mobile Number",
          style: TextStyle(color: Colors.black), // Custom color for title
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Phone Verification",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                SizedBox(
                  width: 80.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "+94",
                      border: OutlineInputBorder(),
                    ),
                    enabled: false, // Disable editing for country code
                  ),
                ),
                SizedBox(width: 15.0),
                Expanded(
                  child: TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      hintText: "Phone number",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.0),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Custom color for the button
                ),
                onPressed: () {
                  // Navigate to OTP verification screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OtpVerification()),
                  );
                },
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
