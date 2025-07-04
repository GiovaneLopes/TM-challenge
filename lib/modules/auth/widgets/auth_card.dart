import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm_challenge/modules/auth/widgets/login_form.dart';
import 'package:tm_challenge/modules/shared/resources/colors.dart';
import 'package:tm_challenge/modules/auth/widgets/register_form.dart';
import 'package:tm_challenge/modules/shared/utils/app_size_helper.dart';

class AuthCard extends StatefulWidget {
  const AuthCard({super.key});

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: SizeHelper.adaptiveSize(context, 350.w, 0.16),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeHelper.adaptiveSize(context, 22.w, 0.007)),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.cardBackground,
              child: Padding(
                padding: EdgeInsets.all(
                    SizeHelper.adaptiveSize(context, 18.w, 0.0018)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TabBar(
                            indicatorColor: AppColors.primary,
                            controller: _tabController,
                            indicatorPadding: EdgeInsets.zero,
                            labelColor: AppColors.primary,
                            unselectedLabelColor: AppColors.textPrimary,
                            padding: EdgeInsets.zero,
                            dividerColor: Colors.transparent,
                            labelPadding: EdgeInsets.zero,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeHelper.adaptiveSize(
                                  context, 14.sp, 0.006),
                            ),
                            tabs: [
                              SizedBox(
                                width: SizeHelper.adaptiveSize(
                                    context, 56.w, 0.02),
                                child: const Tab(
                                  child: Text(
                                    'Entrar',
                                  ),
                                ),
                              ),
                              const Tab(
                                iconMargin: EdgeInsets.zero,
                                child: Text(
                                  'Cadastrar',
                                ),
                              ),
                            ],
                            onTap: (value) =>
                                setState(() => _tabController.index = value),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 28.h),
                    _tabController.index == 0
                        ? const LoginForm()
                        : const RegisterForm()
                  ],
                ),
              ),
            ),
          ),
        ),
        // Positioned(
        //   bottom: -30.h,
        //   child: Center(
        //     child: GestureDetector(
        //       onTap: () {
        //         // if (formKey.currentState?.validate() ?? false) {
        //         //   bloc.signIn(
        //         //     LoginData(
        //         //       cpf: cpfController.text,
        //         //       password: passwordController.text,
        //         //     ),
        //         //   );
        //         // }
        //       },
        //       child: Container(
        //         width: SizeHelper.adaptiveSize(context, 64.w, 0.028),
        //         height: SizeHelper.adaptiveSize(context, 64.h, 0.028),
        //         decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           border: Border.all(
        //             color: AppColors.cardBackground,
        //             width: SizeHelper.adaptiveSize(context, 6.w, 0.0025),
        //           ),
        //           gradient: const LinearGradient(
        //             colors: [
        //               AppColors.primary,
        //               AppColors.primary,
        //               AppColors.secondary
        //             ],
        //             begin: Alignment.topCenter,
        //             end: Alignment.bottomCenter,
        //           ),
        //         ),
        //         child: Center(
        //           child: Modular.get<AuthBloc>().state.status ==
        //                   AuthStatus.loading
        //               ? const CircularProgressIndicator(
        //                   color: AppColors.textPrimary)
        //               : Icon(
        //                   Icons.arrow_forward,
        //                   color: AppColors.textPrimary,
        //                   size: SizeHelper.adaptiveSize(context, 32.w, 0.01),
        //                 ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
