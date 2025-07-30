import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), _goHome);
  }

  void _goHome() {
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/register');
  }

  void _skipDelay() {
    _timer?.cancel();
    _goHome();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _skipDelay, // tap di mana aja
      child: Scaffold(
        backgroundColor: CColor.bgColor,
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'CLEVERSE',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'NicoMoji',
                      color: CColor.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'smart with cleverse',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
