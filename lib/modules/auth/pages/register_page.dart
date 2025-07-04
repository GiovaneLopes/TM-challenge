import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tm_challenge/modules/auth/bloc/auth_bloc.dart';
import 'package:tm_challenge/modules/shared/resources/colors.dart';
import 'package:tm_challenge/libs/modules/user/models/user_model.dart';
import 'package:tm_challenge/modules/shared/utils/input_validator.dart';
import 'package:tm_challenge/modules/shared/utils/input_formatters.dart';
import 'package:tm_challenge/modules/shared/widgets/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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

  void _register() {
    if (_formKey.currentState!.validate()) {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          'Registrar',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
          bloc: bloc,
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
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
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).primaryColor, // azul
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: state.status == AuthStatus.loading
                            ? const CircularProgressIndicator(
                                color: AppColors.textPrimary)
                            : const Text(
                                'Registrar',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
