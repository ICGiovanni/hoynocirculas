import 'package:flutter/material.dart';
import 'package:hoy_no_circulas/features/main/presentation/screens/screens.dart';
import 'package:hoy_no_circulas/features/shared/widgets/widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Recuperar contraseña'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingresa tu correo',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            const Text('Con el que te registraste, te enviaremos un correo '),
            const Text('para cambiar tu contraseña'),
            const SizedBox(height: 20),
            const CustomTextFormField(
              label: 'Correo electrónico',
              keyboardType: TextInputType.emailAddress,
              onChanged: null,
              errorMessage: null,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomFilledButton(
                text: 'Enviar correo',
                buttonColor: textStyle.primaryColor,
                onPressed: false
                    ? null
                    : () {
                        FocusScope.of(context).unfocus();
                        // ref
                        //     .read(loginFormProvider.notifier)
                        //     .onFormSubmit();

                        NavigateToPage.navigateToPage(
                            widget: const ForgotPasswordSendScreen(),
                            context: context);
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
