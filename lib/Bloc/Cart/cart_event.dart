part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}


class OnSelectCard extends CartEvent {
  final CreditCardFrave creditCardFrave;

  OnSelectCard({this.creditCardFrave});
}


class OnCancelCart extends CartEvent {}


class OnMakePayment extends CartEvent {
  final String amount;
  final CreditCardFrave creditCardFrave;

  OnMakePayment({this.amount, this.creditCardFrave });
}