import 'package:flutter/material.dart';

import 'package:hoy_no_circulas/features/shared/widgets/widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar contraseña'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 45),
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
                      "Ingresa tu nueva contraseña",
                      style: textStyle.textTheme.titleMedium!.copyWith(
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const CustomTextFormField(
                      label: 'Contraseña',
                      onFieldSubmitted: null,
                      obscureText: true,
                      onChanged: null,
                      errorMessage: null,
                    ),
                    const SizedBox(height: 30),
                    const CustomTextFormField(
                      label: 'Confirmar Contraseña',
                      onFieldSubmitted: null,
                      obscureText: true,
                      onChanged: null,
                      errorMessage: null,
                    ),
                    const SizedBox(height: 30),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: CustomFilledButton(
                        text: 'Cambiar',
                        buttonColor: textStyle.primaryColor,
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
