import 'package:e_commers/Bloc/cart/cart_bloc.dart';
import 'package:e_commers/Helpers/helpers.dart';
import 'package:e_commers/ui/Views/cart/payment_card_page.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentCreditCart extends StatelessWidget {

  const PaymentCreditCart({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      height: 113,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextFrave(text: 'Payment', fontSize: 19, fontWeight: FontWeight.w600 ),
              GestureDetector(
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) 
                    => ( !state.cardActive! )
                    ? const TextFrave(text: 'Add', color: Colors.blue, fontSize: 18 )
                    : const TextFrave(text: 'Change', color: Colors.blue, fontSize: 18 )
                ),
                onTap: () => Navigator.push(context, routeSlide(page: PaymentCardPage())) 
              )
            ],
          ),
          const Divider(),
          const  SizedBox(height: 5.0),
          BlocBuilder<CartBloc, CartState>(
            builder: (_, state) 
              => ( !state.cardActive! ) 
                ? const TextFrave(text: 'Without Credit Card', fontSize: 18)
                : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  color: Color(0xfff5f5f5),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: SvgPicture.asset('Assets/${state.creditCardFrave!.brand}.svg' )
                      ),
                      const SizedBox(width: 15.0),
                      TextFrave(text: '**** **** **** ${state.creditCardFrave!.cardNumberHidden}', fontSize: 18,)
                    ],
                  ),
                )
          )
        ],
      )
    );
  }
}