import 'package:animate_do/animate_do.dart';
import 'package:e_commers/Widgets/TextFrave.dart';
import 'package:flutter/material.dart';

void modalAddCartSuccess( BuildContext context, String image ){

  showDialog(
    context: context,
    barrierColor: Colors.white60,
    builder: (context) {
      return BounceInDown(
        child: AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          content: Container(
            height: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFrave(text: 'Frave Shop', fontSize: 22, color: Color(0xff006cF2), fontWeight: FontWeight.w500),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network('http://192.168.1.16:7070/' + image, height: 80.0,),
                    SizedBox(width: 10.0),
                    BounceInLeft(child: Icon(Icons.check_circle_outlined, color: Colors.green, size: 80 )),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );

}