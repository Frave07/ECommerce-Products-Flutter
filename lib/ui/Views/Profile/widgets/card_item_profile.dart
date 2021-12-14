import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardItemProfile extends StatelessWidget {
  
  final String text;
  final VoidCallback onPressed;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final IconData icon;

  CardItemProfile({ 
    required this.text, 
    required this.onPressed, 
    required this.borderRadius, 
    required this.backgroundColor, 
    required this.icon 
  });
  
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return 
      Container(
        height: 60,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius
        ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          elevation: 0.0,
          margin: EdgeInsets.all(0.0),
          child: InkWell(
            borderRadius: borderRadius,
            onTap: onPressed,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Icon(icon, color: Colors.white,),
                    ),
                    SizedBox(width: 10.0),
                    TextFrave(text: text, fontSize: 18,),
                  ],
                ),
              )
            ),
          ),
        ),
      );
  }
}