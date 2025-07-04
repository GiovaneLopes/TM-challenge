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
    final isMobile = MediaQuery.of(context).size.width < 700;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      borderRadius: BorderRadius.circular(50.w),
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(isMobile ? 8.w : width * 0.0015),
        child: Image.asset(
          image,
          width: isMobile ? 24.w : width * 0.015,
          height: isMobile ? 24.w : width * 0.015,
        ),
      ),
    );
  }
}
