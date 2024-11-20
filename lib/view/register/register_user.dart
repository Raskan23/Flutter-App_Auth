import 'package:flutter/material.dart';
import 'package:MahiGo_Fix/view/login/login_user.dart';
import 'package:MahiGo_Fix/services/google_sign_in_provider.dart'; // Make sure to import your provider
import 'package:fluttertoast/fluttertoast.dart'; // Assuming you are using Toast for showSnake

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  bool _isAgreed = false;

  // TextEditingControllers
  final emailCTR = TextEditingController();
  final passCTR = TextEditingController();
  final confirmPassCTR = TextEditingController();
  final firstNameCTR = TextEditingController();
  final lastNameCTR = TextEditingController();
  final phoneCTR = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginUser()),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Center(
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30.0),
              _signupForm(),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Checkbox(
                    value: _isAgreed,
                    onChanged: (value) {
                      setState(() {
                        _isAgreed = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      "By clicking \"Sign Up\" you agree to our terms and conditions as well as our privacy policy.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              SizedBox(
                width: double.infinity,
                height: 45.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _loading ? Colors.grey : Colors.blue,
                  ),
                  onPressed: _isAgreed
                      ? () {
                          if (_loading) {
                            return;
                          }
                          setState(() => _loading = true);
                          if (_formKey.currentState?.validate() ?? false) {
                            GoogleSignInProvider.createWithEmailAndPassword(
                              context: context,
                              email: emailCTR.text,
                              password: passCTR.text,
                            ).then((success) {
                              if (mounted) {
                                setState(() => _loading = false);
                              }
                            });
                          } else {
                            setState(() => _loading = false);
                          }
                        }
                      : null,
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signupForm() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: firstNameCTR,
                decoration: InputDecoration(
                  hintText: "First name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(width: 15.0),
            Expanded(
              child: TextFormField(
                controller: lastNameCTR,
                decoration: InputDecoration(
                  hintText: "Last name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        TextFormField(
          controller: emailCTR,
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Enter a valid email';
            }
            return null;
          },
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
                controller: phoneCTR,
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
        SizedBox(height: 20.0),
        TextFormField(
          controller: passCTR,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(),
          ),
          obscureText: true,
          validator: (value) {
            if (value == null || value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
        SizedBox(height: 20.0),
        TextFormField(
          controller: confirmPassCTR,
          decoration: InputDecoration(
            hintText: "Confirm Password",
            border: OutlineInputBorder(),
          ),
          obscureText: true,
          validator: (value) {
            if (value != passCTR.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ],
    );
  }
}
