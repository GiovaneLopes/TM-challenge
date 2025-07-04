import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm_challenge/modules/auth/bloc/auth_bloc.dart';
import 'package:tm_challenge/modules/auth/widgets/auth_card.dart';
import 'package:tm_challenge/modules/shared/resources/colors.dart';
import 'package:tm_challenge/modules/shared/resources/images.dart';
import 'package:tm_challenge/modules/shared/utils/app_size_helper.dart';
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
            Column(
              children: [
                Expanded(
                  child: Container(
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
                ),
                Expanded(child: SizedBox(height: 480.h)),
              ],
            ),
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: SizeHelper.isMobile(context) ? 350.w : 1000),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32.w),
                          child: Column(
                            crossAxisAlignment: SizeHelper.isMobile(context)
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.logoWhite,
                                width: SizeHelper.adaptiveSize(
                                    context, 120.w, 0.06),
                              ),
                              Text(
                                'Bem vindo!',
                                style: TextStyle(
                                  fontSize: SizeHelper.adaptiveSize(
                                      context, 16.sp, 0.008),
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'Aqui você gerencia seus seguros e de seus familiares em poucos cliques!',
                                textAlign: SizeHelper.isMobile(context)
                                    ? TextAlign.start
                                    : TextAlign.center,
                                style: TextStyle(
                                  fontSize: SizeHelper.adaptiveSize(
                                      context, 11.sp, 0.006),
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height:
                                SizeHelper.adaptiveSize(context, 32.h, 0.06)),
                        const AuthCard(),
                        Column(
                          children: [
                            SizedBox(
                                height: SizeHelper.adaptiveSize(
                                    context, 32.h, 0.05)),
                            Image.asset(
                              AppImages.logoColor,
                              width:
                                  SizeHelper.adaptiveSize(context, 100.w, 0.05),
                            ),
                            SizedBox(
                                height: SizeHelper.adaptiveSize(
                                    context, 8.h, 0.01)),
                            Text(
                              'Acesse através das redes sociais',
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: SizeHelper.adaptiveSize(
                                    context, 12.sp, 0.006),
                              ),
                            ),
                            SizedBox(
                              height:
                                  SizeHelper.adaptiveSize(context, 16.h, 0.015),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SocialButton(
                                  image: AppImages.googleLogo,
                                ),
                                SizedBox(
                                  width: SizeHelper.adaptiveSize(
                                      context, 24.w, 0.006),
                                ),
                                const SocialButton(
                                  image: AppImages.facebookLogo,
                                ),
                                SizedBox(
                                  width: SizeHelper.adaptiveSize(
                                      context, 24.w, 0.006),
                                ),
                                const SocialButton(
                                  image: AppImages.twitterLogo,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                            height:
                                SizeHelper.adaptiveSize(context, 32.h, 0.15)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
