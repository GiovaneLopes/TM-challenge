import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm_challenge/modules/shared/resources/colors.dart';
import 'package:tm_challenge/modules/shared/resources/images.dart';
import 'package:tm_challenge/modules/shared/utils/app_size_helper.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.logoColor,
                width: SizeHelper.adaptiveSize(context, 200.w, 0.06)),
            SizedBox(
              width: SizeHelper.adaptiveSize(context, 24.w, 0.008),
              height: SizeHelper.adaptiveSize(context, 24.w, 0.008),
              child: const CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
