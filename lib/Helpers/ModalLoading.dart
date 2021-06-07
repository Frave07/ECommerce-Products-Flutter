import 'package:e_commers/Widgets/TextFrave.dart';
import 'package:flutter/material.dart';

void modalLoading( BuildContext context, String message ){

  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.white60,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        content: Container(
          height: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFrave(text: 'Frave Shop', fontSize: 22, color: Color(0xff006cF2), fontWeight: FontWeight.w500),
              SizedBox(height: 20),
              Row(
                children: [
                  CircularProgressIndicator(backgroundColor: Color(0xff006cF2)),
                  SizedBox(width: 10.0),
                  TextFrave(text: message, fontSize: 18),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );

}