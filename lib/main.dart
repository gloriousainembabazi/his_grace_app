import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/home_screen.dart';
import 'auth/auth_screen.dart';
import 'auth/login_screen.dart';
import 'auth/registration_screen.dart';
import 'auth/forgot_password_screen.dart';
import 'auth/verification_screen.dart';

void main() {
  runApp(const HisGraceDrugshopApp());
}

class HisGraceDrugshopApp extends StatelessWidget {
  const HisGraceDrugshopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'His Grace Drugshop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/auth': (context) => const AuthScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/verification': (context) => const VerificationScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}