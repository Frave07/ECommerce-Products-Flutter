import 'package:e_commers/ui/themes/colors_frave.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromoCode extends StatelessWidget {

  final double size;
  const PromoCode({Key? key, required this.size}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      width: size,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFrave(text: 'Promo', fontSize: 19,),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont('Roboto', fontSize: 19),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 11.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Color(0xffF5F5F5))),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Container(
                height: 48,
                width: 200,
                decoration: BoxDecoration(
                  color: ColorsFrave.primaryColorFrave,
                  borderRadius: BorderRadius.circular(5.0)
                ),
                child: const Center(
                  child: TextFrave(text: 'Use Code', color: Colors.white, fontSize: 18,)
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}