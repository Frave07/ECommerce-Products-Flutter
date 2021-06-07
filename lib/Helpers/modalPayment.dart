import 'package:e_commers/Views/Home/HomePage.dart';
import 'package:e_commers/Widgets/AnimationRoute.dart';
import 'package:e_commers/Widgets/TextFrave.dart';
import 'package:e_commers/Widgets/btnFrave.dart';
import 'package:flutter/material.dart';

void modalPayment( BuildContext context )
{
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.white,
    builder: (context) {
      return AlertDialog(
        elevation: 0,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(Icons.check_circle_rounded, size: 100, color: Colors.green),
            SizedBox(height: 10),
            TextFrave(text: 'Successful Payment', fontSize: 19,),
            SizedBox(height: 20),
            BtnFrave(
              text: 'Continue',
              fontSize: 19,
              onPressed: () => Navigator.of(context).pushReplacement(rutaFrave(page: HomePage(), curved: Curves.easeInOut)),
            )
          ],
        ),
      );
    },
  );

}