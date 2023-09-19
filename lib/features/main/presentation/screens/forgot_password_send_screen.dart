import 'package:flutter/material.dart';

class ForgotPasswordSendScreen extends StatelessWidget {
  const ForgotPasswordSendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              'Correo enviado exitosamente',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            const Text('Checa tu bandeja y haz click en el link para '),
            const Text('para cambiar tu contraseña'),
          ],
        ),
      ),
    );
  }
}
