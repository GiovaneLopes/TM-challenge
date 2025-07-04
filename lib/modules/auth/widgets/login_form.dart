import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm_challenge/modules/auth/bloc/auth_bloc.dart';
import 'package:tm_challenge/modules/shared/resources/colors.dart';
import 'package:tm_challenge/libs/modules/user/models/login_data.dart';
import 'package:tm_challenge/modules/shared/utils/app_size_helper.dart';
import 'package:tm_challenge/modules/shared/utils/input_validator.dart';
import 'package:tm_challenge/modules/shared/utils/input_formatters.dart';
import 'package:tm_challenge/modules/shared/widgets/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

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
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeHelper.adaptiveSize(context, 16.w, 0.007),
          ),
          child: Form(
            key: formKey,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Column(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Checkbox(
                                value: state.isRememberMe,
                                onChanged: bloc.rememberMeChanged,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.w),
                                ),
                                side: BorderSide(
                                  color: AppColors.textPrimary,
                                  width: SizeHelper.adaptiveSize(
                                      context, 2.w, 0.0006),
                                ),
                                activeColor: AppColors.primary,
                              ),
                              Text(
                                'Lembrar Sempre',
                                style: TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: SizeHelper.adaptiveSize(
                                      context, 10.sp, 0.005),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Esqueceu a senha?',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: SizeHelper.adaptiveSize(
                                  context, 10.sp, 0.006),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeHelper.adaptiveSize(context, 8.h, 0.017),
                    ),
                  ],
                ),
                Positioned(
                  bottom: -45.h,
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
                        width: SizeHelper.adaptiveSize(context, 64.w, 0.028),
                        height: SizeHelper.adaptiveSize(context, 64.h, 0.028),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.cardBackground,
                            width:
                                SizeHelper.adaptiveSize(context, 6.w, 0.0025),
                          ),
                          gradient: const LinearGradient(
                            colors: [
                              AppColors.primary,
                              AppColors.primary,
                              AppColors.secondary
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Center(
                          child: Modular.get<AuthBloc>().state.status ==
                                  AuthStatus.loading
                              ? const CircularProgressIndicator(
                                  color: AppColors.textPrimary)
                              : Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.textPrimary,
                                  size: SizeHelper.adaptiveSize(
                                      context, 32.w, 0.01),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
