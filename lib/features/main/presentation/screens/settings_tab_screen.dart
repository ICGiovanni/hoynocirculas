import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hoy_no_circulas/features/main/presentation/screens/screens.dart';
import 'package:hoy_no_circulas/features/shared/widgets/widgets.dart';
import 'package:hoy_no_circulas/features/vehicule/presentation/screens/screens.dart';

class SettingsTabScreen extends StatelessWidget {
  const SettingsTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle fontBold =
        TextStyle(fontFamily: 'QuicksandBold', fontSize: 19);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ajustes'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'General',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(
                      FontAwesomeIcons.userCheck,
                      color: Colors.grey,
                    ),
                    title: const Text('Mi perfil', style: fontBold),
                    trailing: GestureDetector(
                        onTap: () {
                          NavigateToPage.navigateToPage(
                            widget: const ProfileScreen(),
                            context: context,
                          );
                        },
                        child: const Icon(Icons.arrow_forward_ios)),
                  ),
                  ListTile(
                    leading: const Icon(
                      FontAwesomeIcons.car,
                      color: Colors.grey,
                    ),
                    title: const Text('Mis vehículos', style: fontBold),
                    trailing: GestureDetector(
                        onTap: () {
                          NavigateToPage.navigateToPage(
                              widget: const MyVechiclesScreen(),
                              context: context);
                        },
                        child: const Icon(Icons.arrow_forward_ios)),
                  ),
                  ListTile(
                    leading: const Icon(
                      FontAwesomeIcons.bell,
                      color: Colors.grey,
                    ),
                    title: const Text('Notificaciones', style: fontBold),
                    trailing: GestureDetector(
                        onTap: () {
                          NavigateToPage.navigateToPage(
                              widget: const NotificationsScreen(),
                              context: context);
                        },
                        child: const Icon(Icons.arrow_forward_ios)),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.credit_card,
                      color: Colors.grey,
                      size: 27,
                    ),
                    title: const Text('Métodos de pago', style: fontBold),
                    trailing: GestureDetector(
                        onTap: () {
                          NavigateToPage.navigateToPage(
                            widget: const PaymentsMethodsScreen(),
                            context: context,
                          );
                        },
                        child: const Icon(Icons.arrow_forward_ios)),
                  ),
                  GestureDetector(
                    onTap: () => context.go('/login'),
                    child: const ListTile(
                      leading: Icon(
                        Icons.output,
                        color: Colors.red,
                      ),
                      title: Text('Cerrar sesión', style: fontBold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            NavigateToPage.navigateToPage(
                              widget: const TermsAndConditionsScreen(),
                              context: context,
                            );
                          },
                          child: Text(
                            'Términos y condiciones',
                            style: fontBold.copyWith(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            NavigateToPage.navigateToPage(
                              widget: const NoticeOfPrivacityScreen(),
                              context: context,
                            );
                          },
                          child: Text(
                            'Aviso de privacidad',
                            style: fontBold.copyWith(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
