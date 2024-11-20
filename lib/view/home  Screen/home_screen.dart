import 'package:MahiGo_Fix/services/google_sign_in_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:qr_code_scanner/qr_code_scanner.dart'; // Updated import
import 'package:MahiGo_Fix/utils/Common/app_space.dart';
import 'package:MahiGo_Fix/utils/Common/custom_text.dart';
import 'package:MahiGo_Fix/utils/constant/app_color.dart';
import 'package:MahiGo_Fix/utils/constant/app_image.dart';
import 'package:MahiGo_Fix/view/home%20%20Screen/app_banner.dart';
import 'package:MahiGo_Fix/view/home%20%20Screen/nearest_worker_container.dart';
import 'package:MahiGo_Fix/view/home%20%20Screen/work_categories.dart';
import 'package:MahiGo_Fix/view/home%20%20Screen/work_categories_model.dart';
import 'package:MahiGo_Fix/view/details%20Screen/service_details_screen.dart';

import '../../utils/constant/app_string.dart';
import '../botoom bar/bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i = 0;
  int service = 0;
  final TextEditingController _searchController = TextEditingController();
  late stt.SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _startListening() async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(onResult: (result) {
          setState(() {
            _searchController.text = result.recognizedWords;
          });
        });
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void _scanQRCode() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const QRViewExample(), // Updated widget
      ),
    );

    if (result != null && result is String) {
      // Changed expected type
      setState(() {
        _searchController.text = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: AppColor.appColor,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            AppSpace(height: 16.h),
            appBar(),
            searchBar(),
            slider(),
            SizedBox(height: 10.h),
            dotIndicator(),
            AppSpace(height: 16.h),
            categoriesText(),
            serviceCategories(),
            nearestLaundryText(),
            servicesInfoList(),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  GoogleSignInProvider.signOut(context);
                },
                icon: Icon(Icons.logout),
              ),
              CustomText(
                textColor: AppColor.appFont,
                fontWeight: FontWeight.w400,
                fontSize: 20.sp,
                textAlign: TextAlign.start,
                text: 'Hello,',
              ),
              const Spacer(),
              Image.asset(AppImages.bell, height: 24.h),
            ],
          ),
          Row(
            children: [
              Image.asset(AppImages.location, height: 16.h),
              SizedBox(width: 8.h),
              CustomText(
                textColor: AppColor.appFont,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                textAlign: TextAlign.start,
                text: AppText.currentLocation,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          TextField(
            controller: _searchController,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search for a service...',
              hintStyle: TextStyle(color: Colors.grey[400]),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.h),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 10.0),
                child: Icon(
                  Icons.search,
                  size: 24.h,
                  color: AppColor.appFont,
                ),
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      _isListening ? Icons.mic : Icons.mic_none,
                      color: _isListening ? Colors.red : Colors.grey,
                    ),
                    onPressed: _startListening,
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.qrcode),
                    onPressed: _scanQRCode,
                  ),
                ],
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                  color: Colors.blue.withOpacity(0.3),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dotIndicator() {
    return DotsIndicator(
      dotsCount: 5,
      position: i,
      decorator: DotsDecorator(
        size: Size.square(8.0.h),
        activeSize: Size(8.0, 8.0.h),
        color: const Color(0xFFEAEAEA),
        spacing: EdgeInsets.symmetric(horizontal: 4.h),
        activeColor: AppColor.appBannerColor,
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r)),
      ),
    );
  }

  Widget categoriesText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: AppText.categories,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w700,
            textColor: AppColor.appFont,
            fontSize: 20.sp,
          ),
          CustomText(
            text: AppText.view,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w400,
            textColor: Colors.grey,
            fontSize: 14.sp,
          ),
        ],
      ),
    );
  }

  Widget serviceCategories() {
    return SizedBox(
      height: 117.h,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.h),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Categories(
                image: categoriesModel[index].image,
                type: categoriesModel[index].name,
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 24.h,
              ),
          itemCount: categoriesModel.length),
    );
  }

  Widget nearestLaundryText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: AppText.nearestLaundry,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w700,
            textColor: AppColor.appFont,
            fontSize: 20.sp,
          ),
          CustomText(
            text: AppText.view,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w400,
            textColor: Colors.grey,
            fontSize: 14.sp,
          ),
        ],
      ),
    );
  }

  Widget servicesInfoList() {
    return SizedBox(
      height: 454.h,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
          separatorBuilder: (context, index) => AppSpace(
                height: 16.h,
              ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServiceDetailsScreen(
                        servicesDetails: servicesDetails[index],
                      ),
                    ));
              },
              child: NearestServices(
                image: servicesDetails[index].image,
                title: servicesDetails[index].title,
                far: servicesDetails[index].placeFar,
                rating: servicesDetails[index].rating,
                price: servicesDetails[index].rate,
              ),
            );
          },
          itemCount: servicesDetails.length),
    );
  }

  Widget slider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: 160.0.h,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 8,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              i = index;
            });
          },
        ),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return const AppBanner();
        },
      ),
    );
  }
}

// New QR scanner widget
class QRViewExample extends StatelessWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
      ),
      body: QRView(
        key: GlobalKey(debugLabel: 'QR'),
        onQRViewCreated: (controller) {
          controller.scannedDataStream.listen((scanData) {
            Navigator.pop(context, scanData.code); // Return scanned data
          });
        },
      ),
    );
  }
}
