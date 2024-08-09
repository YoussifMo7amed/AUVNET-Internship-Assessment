import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CustomAddToCartIcon extends StatelessWidget {
  const CustomAddToCartIcon(
      {required this.size, super.key, required this.onTap});

  final double size;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.add_circle_outline_sharp,
        color: context.color.textColor,
        size: size,
      ),
    );
  }
}
