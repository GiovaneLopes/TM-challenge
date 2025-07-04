import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm_challenge/modules/auth/bloc/auth_bloc.dart';
import 'package:tm_challenge/modules/shared/resources/colors.dart';
import 'package:tm_challenge/modules/shared/resources/images.dart';
import 'package:tm_challenge/libs/modules/user/bloc/user_bloc.dart';
import 'package:tm_challenge/modules/shared/utils/app_size_helper.dart';

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
                  left: SizeHelper.adaptiveSize(context, 16.w, 0.0025),
                  right: SizeHelper.adaptiveSize(context, 16.w, 0.0025),
                  top: SizeHelper.adaptiveSize(context, 48.h, 0.0075),
                  bottom: SizeHelper.adaptiveSize(context, 12.h, 0.002)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Olá!',
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                  SizedBox(height: SizeHelper.adaptiveSize(context, 8.h, 0.01)),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                          AppImages.userAvatar,
                        ),
                      ),
                      SizedBox(
                          width: SizeHelper.adaptiveSize(context, 8.w, 0.001)),
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
                              fontSize: SizeHelper.adaptiveSize(
                                  context, 16.sp, 0.0045),
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
                                size: SizeHelper.adaptiveSize(
                                    context, 24.w, 0.006),
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
              title: Text(
                'Home/Seguro',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: SizeHelper.adaptiveSize(context, 12.sp, 0.0045),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Minhas Contratações',
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize:
                          SizeHelper.adaptiveSize(context, 12.sp, 0.0045))),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Meus Sinistros',
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize:
                          SizeHelper.adaptiveSize(context, 12.sp, 0.0045))),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Minha Família',
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize:
                          SizeHelper.adaptiveSize(context, 12.sp, 0.0045))),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Meus Bens',
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize:
                          SizeHelper.adaptiveSize(context, 12.sp, 0.0045))),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Pagamentos',
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize:
                          SizeHelper.adaptiveSize(context, 12.sp, 0.0045))),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Coberturas',
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize:
                          SizeHelper.adaptiveSize(context, 12.sp, 0.0045))),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Validar Boleto',
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize:
                          SizeHelper.adaptiveSize(context, 12.sp, 0.0045))),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Telefones Importantes',
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize:
                          SizeHelper.adaptiveSize(context, 12.sp, 0.0045))),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.primary),
              title: Text('Configurações',
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize:
                          SizeHelper.adaptiveSize(context, 12.sp, 0.0045))),
              onTap: () {},
            ),
            GestureDetector(
              onTap: Modular.get<AuthBloc>().signOut,
              child: Padding(
                padding: EdgeInsets.only(
                    left: SizeHelper.adaptiveSize(context, 16.w, 0.008)),
                child: Text(
                  'Sair',
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: SizeHelper.adaptiveSize(context, 12.sp, 0.0045),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizeHelper.isMobile(context)
                ? const Expanded(child: SizedBox())
                : SizedBox(
                    height: 24.h,
                  ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: SizeHelper.adaptiveSize(context, 22.w, 0.008)),
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
                        color: AppColors.textPrimary,
                        fontSize:
                            SizeHelper.adaptiveSize(context, 10.sp, 0.0045)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            SizeHelper.adaptiveSize(context, 16.w, 0.008)),
                    child: Text(
                      'Converse com a gente e tire suas dúvidas sobre seguros!',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize:
                            SizeHelper.adaptiveSize(context, 10.sp, 0.0045),
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
