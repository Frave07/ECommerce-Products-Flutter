import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {

  final Size size;

  DividerLine({ Key? key, required this.size  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 65.0, right: 25.0),
      child: Container(
        height: 1,
        width: size.width,
        color: Colors.grey[300],
      ),
    );
  }
}