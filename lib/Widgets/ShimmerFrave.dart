import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerFrave extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Color(0xFFF7F7F7),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}