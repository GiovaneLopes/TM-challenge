import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm_challenge/modules/shared/resources/colors.dart';
import 'package:tm_challenge/modules/shared/resources/images.dart';
import 'package:tm_challenge/libs/modules/user/bloc/user_bloc.dart';
import 'package:tm_challenge/modules/home/widgets/option_card.dart';
import 'package:tm_challenge/modules/home/widgets/custom_app_bar.dart';
import 'package:tm_challenge/modules/shared/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    Color.fromARGB(255, 255, 239, 161)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 42.w,
                    width: 42.w,
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                        AppImages.userAvatar,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bem-vindo',
                        style: TextStyle(
                            color: AppColors.textPrimary, fontSize: 14),
                      ),
                      Text(
                        Modular.get<UserBloc>().state.user?.name ?? 'Usuário',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18.w, top: 18.h, bottom: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cotar e Contratar',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(
                    height: 72.w,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        OptionCard(
                          icon: Icons.directions_car,
                          label: 'Automóvel',
                          onTap: () => Modular.to.pushNamed('auto'),
                        ),
                        const OptionCard(icon: Icons.home, label: 'Residência'),
                        const OptionCard(icon: Icons.favorite, label: 'Vida'),
                        const OptionCard(
                            icon: Icons.healing, label: 'Acidentes\nPessoais'),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.only(right: 18.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Minha Família',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 24.h),
                          decoration: BoxDecoration(
                            color: AppColors.cardBackground,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.add_circle_outline,
                                  color: AppColors.textPrimary, size: 50.w),
                              SizedBox(height: 12.h),
                              Text(
                                'Adicione aqui membros da sua família e compartilhe os seguros com eles.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),
                        // Contratados
                        Text(
                          'Contratados',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 24.h),
                          decoration: BoxDecoration(
                            color: AppColors.cardBackground,
                            borderRadius: BorderRadius.circular(16.w),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.sentiment_dissatisfied,
                                  color: AppColors.textPrimary, size: 58.w),
                              SizedBox(height: 8.h),
                              Text(
                                'Você ainda não possui seguros contratados.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
