import 'package:flutter/material.dart';


class CircleFrave extends StatelessWidget {

  final double radius;
  final Color color;
  final Widget child;

  CircleFrave({ 
    this.radius = 60.0, 
    this.color = const Color(0xff006cf2), 
    required this.child 
  });

  @override
  Widget build(BuildContext context){
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
      child: child
    );
  }
}