import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm_challenge/modules/auth/bloc/auth_bloc.dart';
import 'package:tm_challenge/modules/auth/widgets/login_form.dart';
import 'package:tm_challenge/modules/shared/resources/colors.dart';
import 'package:tm_challenge/modules/shared/resources/images.dart';
import 'package:tm_challenge/modules/auth/widgets/social_media_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key}) {
    Modular.get<AuthBloc>().getCachedData();
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 320.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.primary,
                    AppColors.secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImages.logoWhite,
                          width: 120.w,
                        ),
                        Text(
                          'Bem vindo!',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Aqui você gerencia seus seguros e de seus familiares em poucos cliques!',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
                  const LoginForm(),
                  SizedBox(height: 12.h),
                  Column(
                    children: [
                      SizedBox(height: 32.h),
                      Image.asset(
                        AppImages.logoColor,
                        width: 100.w,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Acesse através das redes sociais',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SocialButton(
                            image: AppImages.googleLogo,
                          ),
                          SizedBox(width: 24.w),
                          const SocialButton(
                            image: AppImages.facebookLogo,
                          ),
                          SizedBox(width: 24.w),
                          const SocialButton(
                            image: AppImages.twitterLogo,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
