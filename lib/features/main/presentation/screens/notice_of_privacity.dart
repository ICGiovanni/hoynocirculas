import 'package:flutter/material.dart';
import 'package:hoy_no_circulas/features/shared/shared.dart';

const String privacity = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Phasellus aliquam, purus at tristique mattis, nulla tortor consequat ligula, 
non fringilla diam massa sit amet justo. Sed finibus, sapien vel malesuada 
tincidunt, quam velit consectetur augue, nec maximus dui quam eu ante. 
Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere 
cubilia curae; Donec laoreet, nisl nec consectetur tincidunt, 
lorem ante tincidunt nulla, sed auctor mauris dolor in augue.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Phasellus aliquam, purus at tristique mattis, nulla tortor consequat ligula, 
non fringilla diam massa sit amet justo. Sed finibus, sapien vel malesuada 
tincidunt, quam velit consectetur augue, nec maximus dui quam eu ante. 
Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere 
cubilia curae; Donec laoreet, nisl nec consectetur tincidunt, 
lorem ante tincidunt nulla, sed auctor mauris dolor in augue.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Phasellus aliquam, purus at tristique mattis, nulla tortor consequat ligula, 
non fringilla diam massa sit amet justo. Sed finibus, sapien vel malesuada 
tincidunt, quam velit consectetur augue, nec maximus dui quam eu ante. 
Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere 
cubilia curae; Donec laoreet, nisl nec consectetur tincidunt, 
lorem ante tincidunt nulla, sed auctor mauris dolor in augue.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Phasellus aliquam, purus at tristique mattis, nulla tortor consequat ligula, 
non fringilla diam massa sit amet justo. Sed finibus, sapien vel malesuada 
tincidunt, quam velit consectetur augue, nec maximus dui quam eu ante. 
Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere 
cubilia curae; Donec laoreet, nisl nec consectetur tincidunt, 
lorem ante tincidunt nulla, sed auctor mauris dolor in augue.
    ''';

class NoticeOfPrivacityScreen extends StatelessWidget {
  const NoticeOfPrivacityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aviso de privacidad'),
        centerTitle: true,
      ),
      body: const Scrollbar(
        thickness: 10.0,
        thumbVisibility: true,
        radius: Radius.circular(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Logo(),
                  Text(
                    textAlign: TextAlign.justify,
                    privacity,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
