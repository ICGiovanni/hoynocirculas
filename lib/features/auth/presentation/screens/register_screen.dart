import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hoy_no_circulas/features/auth/presentation/providers/providers.dart';
import 'package:hoy_no_circulas/features/auth/presentation/providers/register_form_provider.dart';
import 'package:hoy_no_circulas/features/shared/shared.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends ConsumerState<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> checkBox = ValueNotifier<bool>(false);

    final textStyle = Theme.of(context);
    final registerForm = ref.watch(registerFormProvider);

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Crear una cuenta",
                        style: textStyle.textTheme.titleMedium,
                      ),
                      const Text(
                          "Enter details to register and start using your account."),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        label: 'Nombre completo',
                        keyboardType: TextInputType.emailAddress,
                        onChanged: ref
                            .read(registerFormProvider.notifier)
                            .onFullNameChange,
                        errorMessage: registerForm.isFormPosted
                            ? registerForm.fullName.errorMessage
                            : null,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        label: 'Correo electrónico',
                        keyboardType: TextInputType.emailAddress,
                        onChanged: ref
                            .read(registerFormProvider.notifier)
                            .onEmailChange,
                        errorMessage: registerForm.isFormPosted
                            ? registerForm.email.errorMessage
                            : null,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        label: 'Crear ontraseña',
                        obscureText: true,
                        onChanged: ref
                            .read(registerFormProvider.notifier)
                            .onPasswordChange,
                        errorMessage: registerForm.isFormPosted
                            ? registerForm.password.errorMessage
                            : null,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        label: 'Confirmar contraseña',
                        obscureText: true,
                        onFieldSubmitted: (_) => ref
                            .read(registerFormProvider.notifier)
                            .onFormSubmit(),
                        onChanged: ref
                            .read(registerFormProvider.notifier)
                            .onConfirmPasswordChange,
                        errorMessage: registerForm.isFormPosted
                            ? registerForm.confirmPassword.errorMessage
                            : null,
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ValueListenableBuilder(
                                valueListenable: checkBox,
                                builder: (context, value, child) {
                                  return Checkbox(
                                    value: checkBox.value,
                                    onChanged: (bool? value) {
                                      checkBox.value = value!;
                                    },
                                  );
                                },
                              ),
                              const Text(
                                'Acepto los terminos del servicio y aviso de privacidad',
                                style: TextStyle(
                                  fontFamily: 'QuicksandBold',
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: CustomFilledButton(
                          text: 'Crear cuenta',
                          buttonColor: textStyle.primaryColor,
                          onPressed: registerForm.isPosting
                              ? null
                              : () {
                                  FocusScope.of(context).unfocus();
                                  ref
                                      .read(registerFormProvider.notifier)
                                      .onFormSubmit();
                                },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text('O registrate con', style: TextStyle(fontSize: 18)),
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
                  onPressed: () => context.push('/login'),
                  child: const Text(
                    'Inicia sesion con tu cuenta aquí',
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
