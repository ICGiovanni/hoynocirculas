import 'package:flutter/material.dart';
import 'package:hoy_no_circulas/features/main/presentation/screens/screens.dart';
import 'package:hoy_no_circulas/features/shared/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Mi Perfil')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const CustomTextFormField(
                initialValue: 'Alonso Gómez Pérez',
                label: 'Nombre completo',
                keyboardType: TextInputType.emailAddress,
                onChanged: null,
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                initialValue: 'alfonso@gmail.com',
                label: 'Correo electrónico',
                keyboardType: TextInputType.emailAddress,
                onChanged: null,
                errorMessage: null,
              ),
              const SizedBox(height: 20),
              const Text(
                'Tipo de Cuenta',
                style: TextStyle(fontFamily: 'QuicksandBold', fontSize: 20),
              ),
              const Text(
                'Gratuita',
                style: TextStyle(),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: CustomFilledButton(
                  text: 'Editar',
                  buttonColor: Theme.of(context).primaryColor,
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  NavigateToPage.navigateToPage(
                      widget: const ChangePasswordScreen(), context: context);
                },
                child: Text(
                  'Cambiar contraseña >',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'QuicksandBold',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
