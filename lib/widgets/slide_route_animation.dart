import 'package:flutter/material.dart';

class SlideRouteAnimation extends PageRouteBuilder {
  final Widget page; 
  SlideRouteAnimation({required this.page}) : super(
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => page, 
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      const begin = Offset(1, 0);
      const end = Offset.zero;
      const curve = Curves.easeOutCirc;

      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

      return SlideTransition(position: tween.animate(curvedAnimation), child: child);
    }
  );
}