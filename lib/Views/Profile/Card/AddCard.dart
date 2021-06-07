import 'package:e_commers/Widgets/TextFrave.dart';
import 'package:flutter/material.dart';


class AddCreditCardPage extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextFrave(text: 'Add Cards', color: Color(0xff0C6CF2), fontWeight: FontWeight.w600),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Color(0xff0C6CF2)),
          onPressed: () => Navigator.of(context).pop(),
        )
      ),
      body: Center(
         child: Text('Hola Frave Developer'),
      ),
     );
  }
}