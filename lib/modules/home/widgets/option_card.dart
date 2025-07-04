import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm_challenge/modules/shared/resources/colors.dart';
import 'package:tm_challenge/modules/shared/utils/app_size_helper.dart';

class OptionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function()? onTap;

  const OptionCard({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeHelper.adaptiveSize(context, 80.w, 0.035),
        height: SizeHelper.adaptiveSize(context, 80.w, 0.35),
        margin: EdgeInsets.only(
            right: SizeHelper.adaptiveSize(context, 6.w, 0.0025)),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(
              SizeHelper.adaptiveSize(context, 8.w, 0.005)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: Colors.greenAccent,
                size: SizeHelper.adaptiveSize(context, 32.w, 0.015)),
            SizedBox(height: SizeHelper.adaptiveSize(context, 4.h, 0.002)),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: SizeHelper.adaptiveSize(context, 12.sp, 0.0045),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
