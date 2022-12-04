import 'package:car_company/screens/app_router.dart';
import 'package:car_company/utils/app_colors.dart';
import 'package:car_company/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    onNextPage();
  }

  onNextPage() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RoutName.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_FF5C00,
      body: Center(
        child: SizedBox(
          width: 168.w,
          height: 146.h,
          child: Padding(
            padding: const EdgeInsets.only(left: 20).r,
            child: Image.asset(AppImages.imageSplash),
          ),
        ),
      ),
    );
  }
}
