import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CheckAuthStatusScreen extends StatefulWidget {
  const CheckAuthStatusScreen({Key? key}) : super(key: key);

  @override
  State<CheckAuthStatusScreen> createState() => _CheckAuthStatusScreenState();
}

class _CheckAuthStatusScreenState extends State<CheckAuthStatusScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      context.go('/login');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 215, 114, 140).withOpacity(0.7),
              Colors.orange[500]!.withOpacity(1),
            ],
            stops: const [0.6, 1],
            transform: const GradientRotation(90),
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/splash_logo.png',
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
