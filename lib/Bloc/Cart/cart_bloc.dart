import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commers/Models/Card/CreditCardFrave.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  
  CartBloc() : super(CartInitial()){

    on<OnSelectCardEvent>(_selectCard);
    on<OnMakePaymentEvent>(_makePayment);

  }


  Future<void> _selectCard( OnSelectCardEvent event, Emitter<CartState> emit ) async {

    emit( SetActiveCardState(active: true, creditCard: event.creditCardFrave) );

  }


  Future<void> _makePayment( OnMakePaymentEvent event, Emitter<CartState> emit ) async {

    try {

      emit(LoadingPaymentState());

      // final mesAnio = event.creditCardFrave.expiracyDate.split('/');

      // final resp = await stripeService.payWithCardExists(
      //   amount: event.amount,
      //   currency: state.currency,
      //   creditCard: CreditCard(
      //     number: event.creditCardFrave.cardNumber,
      //     expMonth: int.parse(mesAnio[0]),
      //     expYear: int.parse(mesAnio[1]),
      //   )
      // );

      // if( resp.ok ){
      //   emit(SuccessPaymentState());
      // } else {
      //   emit(FailurePaymentState(resp.msg));
      // }
      
    } catch (e) {
      emit(FailurePaymentState(e.toString()));
    }

  }


}
