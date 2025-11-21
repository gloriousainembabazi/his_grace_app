import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double size;
  final bool withBackground;
  
  const LogoWidget({
    super.key,
    this.size = 100,
    this.withBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    // Try to load the real business logo
    try {
      return Image.asset(
        'assets/logo2.jpg',
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          // Fallback to icon if logo file is not found
          return _buildFallbackLogo();
        },
      );
    } catch (e) {
      // Fallback to icon if any error occurs
      return _buildFallbackLogo();
    }
  }

  Widget _buildFallbackLogo() {
    return Container(
      width: size,
      height: size,
      decoration: withBackground ? BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ) : null,
      child: Icon(
        Icons.medical_services,
        size: size * 0.6,
        color: Colors.blue,
      ),
    );
  }
}