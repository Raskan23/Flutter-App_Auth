import 'package:MahiGo_Fix/view/home%20%20Screen/home_screen.dart';
import 'package:MahiGo_Fix/view/unauth/unauth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:MahiGo_Fix/utils/Common/app_button.dart';
import 'package:MahiGo_Fix/utils/Common/app_space.dart';
import 'package:MahiGo_Fix/utils/Common/custom_text.dart';
import 'package:MahiGo_Fix/utils/constant/app_string.dart';
import 'package:MahiGo_Fix/custom/half_circle_custom.dart';
import 'package:MahiGo_Fix/view/login/login_user.dart';
//import 'package:MahiGo_Fix/view/unauth/unauth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    updateAppbar();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.1, end: 2.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainSplashScreen()),
      );
    });
  }

  void updateAppbar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Image.network(
            'https://www.mahincha.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fl.53d77ea3.png&w=256&q=75',
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}

class MainSplashScreen extends StatelessWidget {
  const MainSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          splashImage(context),
          AppSpace(height: 15.h),
          splashDetails(),
          const Spacer(),
          getStartedButton(context),
          AppSpace(height: 36.h),
        ],
      ),
    );
  }

  Widget splashImage(BuildContext context) {
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 629.h,
        child: Image.asset('assets/images/splash.png', fit: BoxFit.cover),
      ),
    );
  }

  Widget splashDetails() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: CustomText(
            text: AppText.appMotive,
            textAlign: TextAlign.center,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        AppSpace(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: CustomText(
            text: AppText.appDescription,
            textAlign: TextAlign.center,
            fontSize: 16.sp,
            textColor: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget getStartedButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (FirebaseAuth.instance.currentUser != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UnAuth()),
          );
        }
      },
      child: const AppButton(
        buttonText: 'Get Started',
      ),
    );
  }
}
