import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle fontBold =
        TextStyle(fontFamily: 'QuicksandBold', fontSize: 15);

    final double widthC = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Container(
                width: widthC,
                child: Text('Permitir notificaciones',
                    style: fontBold.copyWith(fontSize: 20))),
            trailing: GestureDetector(
              onTap: () {},
              child: Container(
                width: widthC / 3,
                child: SwitchListTile(
                  activeColor: Theme.of(context).primaryColor,
                  value: true,
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
          ListTile(
            title: Container(
                width: widthC,
                child: Text('Avisame cuando no circulo', style: fontBold)),
            trailing: GestureDetector(
              onTap: () {},
              child: Container(
                width: widthC / 3,
                child: SwitchListTile(
                  activeColor: Theme.of(context).primaryColor,
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
          ListTile(
            title: Container(
                width: widthC,
                child:
                    Text('Recordatorios para verificación', style: fontBold)),
            trailing: GestureDetector(
              onTap: () {},
              child: Container(
                width: widthC / 3,
                child: SwitchListTile(
                  activeColor: Theme.of(context).primaryColor,
                  value: true,
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
          ListTile(
            title: Container(
                width: widthC,
                child: Text('Recordatorios de la Tenencia', style: fontBold)),
            trailing: GestureDetector(
              onTap: () {},
              child: Container(
                width: widthC / 3,
                child: SwitchListTile(
                  activeColor: Theme.of(context).primaryColor,
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
          ListTile(
            title: Container(
              width: widthC,
              child: Text('Avísame cuando entro a una zona donde no circulo',
                  style: fontBold),
            ),
            trailing: GestureDetector(
              onTap: () {},
              child: Container(
                width: widthC / 3,
                child: SwitchListTile(
                  activeColor: Theme.of(context).primaryColor,
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
