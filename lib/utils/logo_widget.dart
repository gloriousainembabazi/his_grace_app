import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double size;
  final bool withBackground;
  final Color backgroundColor;
  final Color iconColor;

  const LogoWidget({
    super.key,
    this.size = 80,
    this.withBackground = true,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    // If you have a real logo image, use this:
    return _buildImageLogo();
    
    // If you don't have an image yet, use this temporary icon:
    // return _buildIconLogo();
  }

  Widget _buildImageLogo() {
    return Container(
      width: size,
      height: size,
      decoration: withBackground
          ? BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            )
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/logo.png', // Your logo path
          fit: BoxFit.contain,
          // If image fails to load, show fallback icon
          errorBuilder: (context, error, stackTrace) {
            return _buildIconLogo();
          },
        ),
      ),
    );
  }

  Widget _buildIconLogo() {
    return Container(
      width: size,
      height: size,
      decoration: withBackground
          ? BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            )
          : null,
      child: Icon(
        Icons.medical_services,
        size: size * 0.6,
        color: iconColor,
      ),
    );
  }
}