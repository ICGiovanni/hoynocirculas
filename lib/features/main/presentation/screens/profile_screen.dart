import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoy_no_circulas/features/auth/presentation/providers/providers.dart';
import 'package:hoy_no_circulas/features/main/presentation/providers/providers.dart';
import 'package:hoy_no_circulas/features/main/presentation/screens/screens.dart';
import 'package:hoy_no_circulas/features/shared/widgets/widgets.dart';
import 'package:hoy_no_circulas/helpers.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.read(authProvider).user;
    final profileForm = ref.watch(profileFormProvider);

    ref.listen(
      profileFormProvider,
      (previous, next) {
        if (next.errorMessage.isNotEmpty) {
          Helpers.showSnackbar(context, next.errorMessage, false);
        }
        if (next.success) {
          Helpers.showSnackbar(
              context, 'Se han realizado los cambios exitosamente.');
        }

        return;
      },
    );

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
              CustomTextFormField(
                initialValue: '${user?.fullName}',
                label: 'Nombre completo',
                onChanged:
                    ref.read(profileFormProvider.notifier).onFullNameChange,
                errorMessage: profileForm.isFormPosted
                    ? profileForm.fullName.errorMessage
                    : null,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                initialValue: '${user?.email}',
                label: 'Correo electrónico',
                keyboardType: TextInputType.emailAddress,
                onChanged: ref.read(profileFormProvider.notifier).onEmailChange,
                errorMessage: profileForm.isFormPosted
                    ? profileForm.email.errorMessage
                    : null,
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
                height: 50,
                child: CustomFilledButton(
                  text: 'Editar',
                  buttonColor: Theme.of(context).primaryColor,
                  onPressed: profileForm.isPosting
                      ? null
                      : () {
                          FocusScope.of(context).unfocus();
                          ref.read(profileFormProvider.notifier).onFormSubmit();
                        },
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
