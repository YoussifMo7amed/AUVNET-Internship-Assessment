import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

// Custom widget for FadeInDown animation
class CustomFadeInDown extends StatelessWidget {
  const CustomFadeInDown({
    required this.child,
    required this.duration,
    super.key,
  });

  final Widget child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 300), // Delay before animation starts
      duration: Duration(milliseconds: duration), // Duration of the animation
      child: child,
    );
  }
}

// Custom widget for FadeInUp animation
class CustomFadeInUp extends StatelessWidget {
  const CustomFadeInUp({
    required this.child,
    required this.duration,
    super.key,
  });

  final Widget child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 300),
      duration: Duration(milliseconds: duration),
      child: child,
    );
  }
}

// Custom widget for FadeInLeft animation (should be FadeInLeft)
class CustomFadeInLeft extends StatelessWidget {
  const CustomFadeInLeft({
    required this.child,
    required this.duration,
    super.key,
  });

  final Widget child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return FadeInRight( // Correct widget should be FadeInLeft
      delay: const Duration(milliseconds: 300),
      duration: Duration(milliseconds: duration),
      child: child,
    );
  }
}

// Custom widget for FadeInRight animation (should be FadeInRight)
class CustomFadeInRight extends StatelessWidget {
  const CustomFadeInRight({
    required this.child,
    required this.duration,
    super.key,
  });

  final Widget child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft( // Correct widget should be FadeInRight
      delay: const Duration(milliseconds: 300),
      duration: Duration(milliseconds: duration),
      child: child,
    );
  }
}
