import 'package:e_commers/ui/themes/colors_frave.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';


class AddCreditCardPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const TextFrave(text: 'Add Cards', color: ColorsFrave.primaryColorFrave, fontWeight: FontWeight.w600),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          splashRadius: 20,
          icon: const Icon(Icons.arrow_back_ios_rounded, color: ColorsFrave.primaryColorFrave),
          onPressed: () => Navigator.of(context).pop(),
        )
      ),
      body: Center(
         child: const Text('Hola Frave Developer'),
      ),
     );
  }
}