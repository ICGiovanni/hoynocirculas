import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hoy_no_circulas/features/auth/presentation/providers/providers.dart';
import 'package:hoy_no_circulas/features/main/presentation/screens/forgot_password_screen.dart';
import 'package:hoy_no_circulas/features/shared/shared.dart';
import 'package:hoy_no_circulas/features/shared/widgets/widgets.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context);
    final loginForm = ref.watch(loginFormProvider);

    void showSnackbar(BuildContext context, String errorMessage) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage)));
    }

    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;
      showSnackbar(context, next.errorMessage);
    });

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 45),
              const Logo(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(31, 179, 178, 178)
                              .withOpacity(0.1),
                          blurRadius: 4.0,
                          offset: const Offset(0.0, 1.0),
                          spreadRadius: 5.5,
                        )
                      ]),
                  child: Column(
                    children: [
                      Text(
                        "Iniciar Sesión",
                        style: textStyle.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        label: 'Correo electrónico',
                        keyboardType: TextInputType.emailAddress,
                        onChanged:
                            ref.read(loginFormProvider.notifier).onEmailChange,
                        errorMessage: loginForm.isFormPosted
                            ? loginForm.email.errorMessage
                            : null,
                      ),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        label: 'Contraseña',
                        onFieldSubmitted: (_) =>
                            ref.read(loginFormProvider.notifier).onFormSubmit(),
                        obscureText: true,
                        onChanged: ref
                            .read(loginFormProvider.notifier)
                            .onPasswordChange,
                        errorMessage: loginForm.isFormPosted
                            ? loginForm.password.errorMessage
                            : null,
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            NavigateToPage.navigateToPage(
                                widget: const ForgotPasswordScreen(),
                                context: context);
                          },
                          child: const Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(
                              fontFamily: 'QuicksandBold',
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: CustomFilledButton(
                          text: 'Iniciar sesión',
                          buttonColor: textStyle.primaryColor,
                          onPressed: loginForm.isPosting
                              ? null
                              : () {
                                  FocusScope.of(context).unfocus();
                                  // ref
                                  //     .read(loginFormProvider.notifier)
                                  //     .onFormSubmit();

                                  context.go('/');
                                },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text('O continua con', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 110,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.google,
                      size: 20,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 110,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.apple,
                      size: 27,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 110,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.facebook,
                      size: 25,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              TextButton(
                  onPressed: () => context.push('/register'),
                  child: const Text(
                    'Crear una cuenta',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'QuicksandBold',
                      decoration: TextDecoration.underline,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
