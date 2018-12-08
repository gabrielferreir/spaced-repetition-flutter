import 'package:flutter/material.dart';

class SlideRouterRight extends PageRouteBuilder {
  final Widget widget;

  SlideRouterRight({this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext content,
            Animation<double> animation,
            Animation<double> secondatyAnimation,
            Widget child) {
          return SlideTransition(
            position:
                Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero)
                    .animate(animation),
            child: child,
          );
        });
}
