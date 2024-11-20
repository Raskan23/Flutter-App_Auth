// import 'package:flutter/material.dart';
// import '../otp/otp_login.dart'; // Replace with the actual import path for your OTP screen

// class PhoneNumberInputPage extends StatelessWidget {
//   final TextEditingController _phoneController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         iconTheme:
//             IconThemeData(color: Colors.black), // Custom color for back icon
//         title: Text(
//           "Enter Phone Number",
//           style: TextStyle(color: Colors.black), // Custom color for title
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Phone Verification",
//               style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20.0),
//             Row(
//               children: [
//                 SizedBox(
//                   width: 80.0,
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       hintText: "+94",
//                       border: OutlineInputBorder(),
//                     ),
//                     enabled: false, // Disable editing for country code
//                   ),
//                 ),
//                 SizedBox(width: 15.0),
//                 Expanded(
//                   child: TextFormField(
//                     controller: _phoneController,
//                     decoration: InputDecoration(
//                       hintText: "Phone number",
//                       border: OutlineInputBorder(),
//                     ),
//                     keyboardType: TextInputType.phone,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your phone number';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 25.0),
//             Container(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Custom color for the button
//                 ),
//                 onPressed: () {
//                   // Navigate to OTP screen when submitted
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => OtpVerification()),
//                   );
//                 },
//                 child: Text(
//                   "Submit",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
