import 'package:ar_vr/routers/my_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:    Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(MyRouters.productPage);
            // Add navigation or action here
          },
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: const Color(0xFF8f4fff), // Purple button
              borderRadius: BorderRadius.circular(32),
            ),
            child: const Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ),
      ),
      // backgroundColor: const Color(0xFFc2b8f5), // light purple background
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/apple.png',
              height: 350,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 32),
            const Text(
              'Apple Watch SE',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Silver Aluminum Case with Sport Band',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 65),

          ],
        ),
      ),
    );;
  }
}
