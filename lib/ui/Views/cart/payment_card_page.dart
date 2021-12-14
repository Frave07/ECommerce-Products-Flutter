import 'package:e_commers/Bloc/cart/cart_bloc.dart';
import 'package:e_commers/Models/Card/CreditCardFrave.dart';
import 'package:e_commers/ui/themes/colors_frave.dart';
import 'package:flutter/material.dart';
import 'package:e_commers/Data/ListCard.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PaymentCardPage extends StatelessWidget {
 
  const PaymentCardPage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context){

    final cartBloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const TextFrave(text: 'Payment', color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          splashRadius: 20,
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: (){},
            child: TextFrave(text: 'Add Card', color: ColorsFrave.primaryColorFrave, fontSize: 17),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          itemCount: cards.length,
          itemBuilder: (_, i) {
            
            final CreditCardFrave card = cards[i];

            return BlocBuilder<CartBloc, CartState>(
              builder: (context, state) 
                => GestureDetector(
                onTap: () => cartBloc.add( OnSelectCardEvent(card) ),
                child: Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  padding: EdgeInsets.all(10.0),
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: state.creditCardFrave == null 
                        ? Colors.black
                        : state.creditCardFrave!.cvv == card.cvv ? Colors.blue : Colors.black
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: SvgPicture.asset('Assets/${card.brand}.svg')
                      ),
                      Container(
                        child: TextFrave(text: '**** **** **** ${card.cardNumberHidden}')
                      ),
                      Container(
                        child: state.creditCardFrave == null 
                        ? Icon(Icons.radio_button_off_rounded, size: 31)
                        : state.creditCardFrave!.cvv == card.cvv 
                          ? Icon(Icons.radio_button_checked_rounded, size: 31, color: Colors.blue,)
                          : Icon(Icons.radio_button_off_rounded, size: 31)
                      )
                    ],
                  ),
                ),
              ),
            );
          } ,
        ),
     );
  }
}