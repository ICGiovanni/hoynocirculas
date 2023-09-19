import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoy_no_circulas/features/auth/presentation/providers/auth_provider.dart';

import 'package:hoy_no_circulas/features/shared/widgets/widgets.dart';

class SideMenu extends ConsumerStatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends ConsumerState<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final textStyles = Theme.of(context).textTheme;
    final userProvider = ref.watch(authProvider);

    return SizedBox(
      child: NavigationDrawer(
          elevation: 1,
          selectedIndex: navDrawerIndex,
          onDestinationSelected: (value) {
            setState(() {
              navDrawerIndex = value;
            });

            // final menuItem = appMenuItems[value];
            // context.push( menuItem.link );
            widget.scaffoldKey.currentState?.closeDrawer();
          },
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, hasNotch ? 0 : 20, 16, 0),
              child: Text('Hola,', style: textStyles.titleMedium),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 16, 10),
              child: Row(
                children: [
                  Text(
                    userProvider.user!.fullName,
                    style: textStyles.titleSmall,
                  ),
                  const Spacer(flex: 2),
                  CircleAvatar(
                    radius: 30,
                    child: !true
                        ? Icon(
                            Icons.supervised_user_circle_sharp,
                            size: 60,
                            color: Colors.grey[400],
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.network(
                                'https://jfdesousa.vercel.app/images/yo.png'),
                          ),
                  )
                ],
              ),
            ),
            const NavigationDrawerDestination(
              icon: Icon(Icons.taxi_alert_rounded),
              label: Text('Solicitar taxi'),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
              child: Divider(),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
              child: Text('Otras opciones'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomFilledButton(
                  onPressed: () {
                    ref.read(authProvider.notifier).logOut();
                  },
                  text: 'Cerrar sesión'),
            ),
          ]),
    );
  }
}
