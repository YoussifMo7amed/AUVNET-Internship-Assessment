import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CustomAddToCartButton extends StatelessWidget {
  const CustomAddToCartButton({required this.size, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.add_circle_outline_sharp,
        color: context.color.textColor,
        size: size,
      ),
    );
  }
}
