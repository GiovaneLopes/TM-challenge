import 'package:flutter/material.dart';
import 'package:universal_html/controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm_challenge/modules/shared/resources/colors.dart';
import 'package:tm_challenge/modules/shared/resources/images.dart';
import 'package:tm_challenge/libs/modules/user/bloc/user_bloc.dart';
import 'package:tm_challenge/modules/home/widgets/option_card.dart';
import 'package:tm_challenge/modules/home/widgets/custom_app_bar.dart';
import 'package:tm_challenge/modules/shared/utils/app_size_helper.dart';
import 'package:tm_challenge/modules/shared/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WindowController();
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.all(SizeHelper.adaptiveSize(context, 16.w, 0.008)),
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
                    height: SizeHelper.adaptiveSize(context, 42.w, 0.025),
                    width: SizeHelper.adaptiveSize(context, 42.w, 0.025),
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                        AppImages.userAvatar,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: SizeHelper.adaptiveSize(context, 12.w, 0.007)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bem-vindo',
                        style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize:
                                SizeHelper.adaptiveSize(context, 14.sp, 0.004)),
                      ),
                      Text(
                        Modular.get<UserBloc>().state.user?.name ?? 'Usuário',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize:
                              SizeHelper.adaptiveSize(context, 18.sp, 0.008),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: SizeHelper.adaptiveSize(context, 18.w, 0.007),
                top: SizeHelper.adaptiveSize(context, 18.h, 0.007),
                bottom: SizeHelper.adaptiveSize(context, 18.w, 0.007),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cotar e Contratar',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeHelper.adaptiveSize(context, 24.sp, 0.008),
                    ),
                  ),
                  SizedBox(
                    height: SizeHelper.adaptiveSize(context, 80.w, 0.035),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        OptionCard(
                          icon: Icons.directions_car,
                          label: 'Automóvel',
                          onTap: () {
                            if (Theme.of(context).platform ==
                                    TargetPlatform.android ||
                                Theme.of(context).platform ==
                                    TargetPlatform.iOS) {
                              Modular.to.pushNamed('auto');
                            } else {
                              controller.window.open(
                                  'https://www.tokiomarine.com.br/', '_blank');
                            }
                          },
                        ),
                        const OptionCard(icon: Icons.home, label: 'Residência'),
                        const OptionCard(icon: Icons.favorite, label: 'Vida'),
                        const OptionCard(
                            icon: Icons.healing, label: 'Acidentes\nPessoais'),
                        const OptionCard(icon: Icons.motorcycle, label: 'Moto'),
                        const OptionCard(
                            icon: Icons.business_outlined, label: 'Empresa'),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.only(
                        right: SizeHelper.adaptiveSize(context, 18.w, 0.01)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Minha Família',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                SizeHelper.adaptiveSize(context, 24.sp, 0.008),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  SizeHelper.adaptiveSize(context, 24.h, 0.03)),
                          decoration: BoxDecoration(
                            color: AppColors.cardBackground,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.add_circle_outline,
                                  color: AppColors.textPrimary,
                                  size: SizeHelper.adaptiveSize(
                                      context, 50.w, 0.015)),
                              SizedBox(
                                  height: SizeHelper.adaptiveSize(
                                      context, 12.h, 0.002)),
                              Text(
                                'Adicione aqui membros da sua família e compartilhe os seguros com eles.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: SizeHelper.adaptiveSize(
                                      context, 14.sp, 0.0045),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Contratados',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                SizeHelper.adaptiveSize(context, 24.sp, 0.008),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  SizeHelper.adaptiveSize(context, 24.h, 0.03)),
                          decoration: BoxDecoration(
                            color: AppColors.cardBackground,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.sentiment_dissatisfied,
                                  color: AppColors.textPrimary,
                                  size: SizeHelper.adaptiveSize(
                                      context, 58.w, 0.015)),
                              SizedBox(
                                  height: SizeHelper.adaptiveSize(
                                      context, 8.h, 0.001)),
                              Text(
                                'Você ainda não possui seguros contratados.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: SizeHelper.adaptiveSize(
                                      context, 14.sp, 0.0045),
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
