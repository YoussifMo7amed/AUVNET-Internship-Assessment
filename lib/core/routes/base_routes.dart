import 'package:flutter/material.dart';

/// Custom PageRouteBuilder to handle page transitions
class BaseRoute extends PageRouteBuilder<dynamic> {
  BaseRoute({required this.page})
      : super(
          // Page builder that defines the primary content of the route
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              Stack(children: [page]),
          // Transition builder that defines the transition animation
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget widget,
          ) {
            const begin = 0.0;
            const end = 1.0;
            final tween = Tween(begin: begin, end: end);
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.linearToEaseOut,
            );

            return ScaleTransition(
              scale: tween.animate(curvedAnimation),
              child: widget,
            );
          },
        );

  // The page to be displayed
  final Widget page;
}
