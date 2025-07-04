import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm_challenge/modules/auth/bloc/auth_bloc.dart';
import 'package:tm_challenge/modules/shared/resources/colors.dart';
import 'package:tm_challenge/libs/modules/user/models/login_data.dart';
import 'package:tm_challenge/modules/shared/utils/input_validator.dart';
import 'package:tm_challenge/modules/shared/utils/input_formatters.dart';
import 'package:tm_challenge/modules/shared/widgets/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<AuthBloc>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController cpfController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: bloc,
      builder: (context, state) {
        if (state.authCachedData != null) {
          cpfController.text = state.authCachedData?.cpf ?? '';
          passwordController.text = state.authCachedData?.password ?? '';
        }
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.cardBackground,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.w),
                  child: Form(
                    key: formKey,
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
                                indicatorPadding: EdgeInsets.zero,
                                labelColor: AppColors.primary,
                                unselectedLabelColor: AppColors.textPrimary,
                                padding: EdgeInsets.zero,
                                dividerColor: Colors.transparent,
                                labelPadding: EdgeInsets.zero,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                                tabs: [
                                  SizedBox(
                                    width: 56.w,
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
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 28.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            children: [
                              CustomTextFormField(
                                hintText: 'CPF',
                                controller: cpfController,
                                inputFormatters: InputFormatters.cpf,
                                onChanged: (value) {
                                  cpfController.text = value;
                                },
                                keyboardType: TextInputType.number,
                                validator: InputValidator.validateCPF,
                              ),
                              SizedBox(height: 8.h),
                              CustomTextFormField(
                                hintText: 'Senha',
                                obscureText: true,
                                controller: passwordController,
                                onChanged: (value) {
                                  passwordController.text = value;
                                },
                                validator: InputValidator.validatePassword,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: state.isRememberMe,
                                    onChanged: bloc.rememberMeChanged,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.w),
                                    ),
                                    side: BorderSide(
                                      color: AppColors.textPrimary,
                                      width: 2.w,
                                    ),
                                    activeColor: AppColors.primary,
                                  ),
                                  Text(
                                    'Lembrar Sempre',
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {
                                      final emailController =
                                          TextEditingController();
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title:
                                                const Text('Recuperar Senha'),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text(
                                                  'Digite o email cadastrado para redefinir sua senha.',
                                                ),
                                                CustomTextFormField(
                                                  controller: emailController,
                                                  hintText: 'Email',
                                                ),
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: Modular.to.pop,
                                                child: const Text('Enviar'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Esqueceu a senha?',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -30.h,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      bloc.signIn(
                        LoginData(
                          cpf: cpfController.text,
                          password: passwordController.text,
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 64.w,
                    height: 64.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: AppColors.background, width: 6.w),
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.primary,
                          AppColors.primary,
                          AppColors.secondary
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: state.status == AuthStatus.loading
                          ? const CircularProgressIndicator(
                              color: AppColors.textPrimary)
                          : Icon(
                              Icons.arrow_forward,
                              color: AppColors.textPrimary,
                              size: 32.w,
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
