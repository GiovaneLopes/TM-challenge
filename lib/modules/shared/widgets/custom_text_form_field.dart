import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm_challenge/modules/shared/resources/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String hintText;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.validator,
    this.labelText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.hintText = 'Digite aqui',
    this.onChanged,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        inputFormatters: inputFormatters,
        style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textPrimary, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(50.r)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textPrimary, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(50.r)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textPrimary, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(50.r)),
          ),
          filled: true,
          fillColor: Colors.transparent,
          hintText: hintText,
          labelStyle: const TextStyle(color: AppColors.textPrimary),
          hintStyle: const TextStyle(
            color: AppColors.textPrimary,
          ),
          alignLabelWithHint: true,
          contentPadding:
              EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          labelText: labelText,
        ),
      ),
    );
  }
}
