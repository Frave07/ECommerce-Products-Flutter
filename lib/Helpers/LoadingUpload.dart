import 'package:e_commers/Widgets/TextFrave.dart';
import 'package:flutter/material.dart';

void loadinUploadFile(BuildContext context){

  showDialog(
    context: context,
    barrierColor: Colors.white54,
    builder: (context) {
       
       return AlertDialog(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
         title: TextFrave(text: 'Uploading Image', color: Color(0xff0C6CF2),),
         content: Container(
           height: 200,
           width: 350,
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(15.0)
           ),
           child: TweenAnimationBuilder(
             tween: Tween(begin: 0.0, end: 1.0),
             duration: Duration(seconds: 3),
             builder: (context, value, child) {
               int percent = ( value * 100 ).ceil();
               return Container(
                 width: 230,
                 height: 230,
                //  color: Colors.yellow,
                 child: Stack(
                   children: [
                     Align(
                       alignment: Alignment.center,
                       child: ShaderMask(
                         shaderCallback: (rect){
                           return SweepGradient(
                             startAngle: 0.0,
                             endAngle: 3.14 * 2,
                             stops: [ value, value ],
                             center: Alignment.center,
                             colors: [ Color(0xff0C6CF2), Colors.transparent ] 
                           ).createShader(rect);
                         },
                         child: Container(
                           height: 230,
                           width: 230,
                           decoration: BoxDecoration(
                             color: Color(0xff0C6CF2),
                             shape: BoxShape.circle
                           ),
                         ),
                       ),
                     ),
                     Align(
                       alignment: Alignment.center,
                       child: Container(
                         height: 160,
                         width: 160,
                         decoration: BoxDecoration(
                           color: Colors.white, shape: BoxShape.circle
                         ),
                         child: Center(child: TextFrave(text: '$percent %', fontSize: 40,)),
                       ),
                     )
                   ],
                 ),
               );
             },
           ),
         ),
       );

     },
  );


}