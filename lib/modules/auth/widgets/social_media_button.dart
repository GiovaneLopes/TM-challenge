import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButton extends StatelessWidget {
  final String image;

  const SocialButton({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50.w),
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(8.w),
        child: Image.asset(
          image,
          width: 24.w,
          height: 24.w,
        ),
      ),
    );
  }
}
