import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commers/Models/Card/CreditCardFrave.dart';
import 'package:e_commers/Service/StripeService.dart';
import 'package:meta/meta.dart';
import 'package:stripe_payment/stripe_payment.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  
  CartBloc() : super(CartState());

  @override
  Stream<CartState> mapEventToState( CartEvent event ) async* {
    

      if( event is OnSelectCard ){

          yield state.copyWith(
            cardActive: true,
            creditCardFrave: event.creditCardFrave
          );

      } else if ( event is OnMakePayment ){

        try {

          yield LoadingPaymentState();

          final mesAnio = event.creditCardFrave.expiracyDate.split('/');

          final resp = await stripeService.payWithCardExists(
            amount: event.amount,
            currency: state.currency,
            creditCard: CreditCard(
              number: event.creditCardFrave.cardNumber,
              expMonth: int.parse(mesAnio[0]),
              expYear: int.parse(mesAnio[1]),
            )
          );

          if( resp.ok ){
            yield SuccessPaymentState();
          } else {
            yield FailurePaymentState(err: resp.msg );
          }

          
        } catch (e) {
          yield FailurePaymentState(err: e.toString());
        }

      }
  }
}
