import 'package:e_commers/Widgets/TextFrave.dart';
import 'package:flutter/material.dart';

void modalSuccess( BuildContext context, String title )
{
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
        content: Container(
          height: 275,
          child: Column(
            children: [
              TextFrave(text: title, fontSize: 20, fontWeight: FontWeight.bold),
              SizedBox(height: 20),
              Icon(Icons.check_circle_outline_outlined, size: 180, color: Colors.green),
              TextButton(
                child: TextFrave(text: 'Done', fontSize: 20,),
                onPressed: () => Navigator.of(context).pushReplacementNamed('signInPage')
              )
            ],
          ),
        ),
      );
    },
  );

}