import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalmButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const CalmButton({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          color: Color(0xFF8E9AAF),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(label,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
