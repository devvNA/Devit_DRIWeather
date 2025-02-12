import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(-4, 8),
                blurRadius: 50,
                spreadRadius: 4,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(2, -3),
                blurRadius: 6,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.25),
                offset: const Offset(-5, 4),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF444E72),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8.0),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20.0,
                color: Color(0xFF444E72),
              ),
            ],
          ).paddingSymmetric(horizontal: 24),
        ),
      ),
    );
  }
}
