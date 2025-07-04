import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm_challenge/modules/auth/bloc/auth_bloc.dart';
import 'package:tm_challenge/modules/shared/resources/colors.dart';
import 'package:tm_challenge/modules/shared/resources/images.dart';
import 'package:tm_challenge/libs/modules/user/bloc/user_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(0),
        ),
      ),
      child: Container(
        color: AppColors.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 16.w, right: 16.w, top: 48.h, bottom: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Olá!',
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                          AppImages.userAvatar,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Modular.get<UserBloc>().state.user?.name ??
                                'Usuário',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                'Minha conta',
                                style: TextStyle(color: AppColors.primary),
                              ),
                              Icon(
                                Icons.arrow_drop_down_rounded,
                                size: 24.w,
                                color: AppColors.textPrimary,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Home/Seguro',
                  style:
                      TextStyle(color: AppColors.textPrimary, fontSize: 12.sp)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Minhas Contratações',
                  style:
                      TextStyle(color: AppColors.textPrimary, fontSize: 12.sp)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Meus Sinistros',
                  style:
                      TextStyle(color: AppColors.textPrimary, fontSize: 12.sp)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Minha Família',
                  style:
                      TextStyle(color: AppColors.textPrimary, fontSize: 12.sp)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Meus Bens',
                  style:
                      TextStyle(color: AppColors.textPrimary, fontSize: 12.sp)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Pagamentos',
                  style:
                      TextStyle(color: AppColors.textPrimary, fontSize: 12.sp)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Coberturas',
                  style:
                      TextStyle(color: AppColors.textPrimary, fontSize: 12.sp)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Validar Boleto',
                  style:
                      TextStyle(color: AppColors.textPrimary, fontSize: 12.sp)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Telefones Importantes',
                  style:
                      TextStyle(color: AppColors.textPrimary, fontSize: 12.sp)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Configurações',
                  style:
                      TextStyle(color: AppColors.textPrimary, fontSize: 12.sp)),
              onTap: () {},
            ),
            GestureDetector(
              onTap: Modular.get<AuthBloc>().signOut,
              child: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Text(
                  'Sair',
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Container(
              padding: EdgeInsets.symmetric(vertical: 22.w),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(AppImages.femaleAvatar),
                  ),
                  Text(
                    'Dúvidas?',
                    style: TextStyle(
                        color: AppColors.textPrimary, fontSize: 10.sp),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Converse com a gente e tire suas dúvidas sobre seguros!',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 10.sp,
                      ),
                      textAlign: TextAlign.center,
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
