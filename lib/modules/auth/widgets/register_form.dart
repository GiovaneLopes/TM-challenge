import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm_challenge/modules/auth/bloc/auth_bloc.dart';
import 'package:tm_challenge/modules/shared/resources/colors.dart';
import 'package:tm_challenge/libs/modules/user/models/user_model.dart';
import 'package:tm_challenge/modules/shared/utils/app_size_helper.dart';
import 'package:tm_challenge/modules/shared/utils/input_validator.dart';
import 'package:tm_challenge/modules/shared/utils/input_formatters.dart';
import 'package:tm_challenge/modules/shared/widgets/custom_text_form_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final bloc = Modular.get<AuthBloc>();
  final _formKey = GlobalKey<FormState>();
  final cpfController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    cpfController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: bloc,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeHelper.adaptiveSize(context, 16.w, 0.007),
          ),
          child: Form(
            key: _formKey,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    CustomTextFormField(
                      controller: cpfController,
                      hintText: 'CPF',
                      inputFormatters: InputFormatters.cpf,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe o CPF';
                        }
                        // Adicione validação de CPF se necessário
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: nameController,
                      hintText: 'Nome Completo',
                      validator: InputValidator.validateName,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: InputValidator.validateEmail,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'Senha',
                      obscureText: true,
                      validator: InputValidator.validatePassword,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      hintText: 'Confirmar Senha',
                      obscureText: true,
                      validator: (value) =>
                          InputValidator.validateConfirmPassword(
                              value, passwordController.text),
                      controller: confirmPasswordController,
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
                Positioned(
                  bottom: -45.h,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          bloc.register(
                            UserModel(
                              id: cpfController.text,
                              name: nameController.text,
                              email: emailController.text,
                              cpf: cpfController.text,
                            ),
                            passwordController.text,
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
