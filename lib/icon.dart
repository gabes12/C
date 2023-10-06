import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;

  const IconWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.orange,
          width: 2.0,
        ),
      ),
      child: Icon(icon, color: Colors.white, size: 40),
    );
  }
}
