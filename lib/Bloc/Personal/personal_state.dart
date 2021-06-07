part of 'personal_bloc.dart';

@immutable
class PersonalState {

  final String address;
  final String reference;
  final bool delivery;

  PersonalState({
    this.address = '', 
    this.reference,
    this.delivery   = false
  });

  PersonalState copyWith({ String address, String reference, bool delivery })
    => PersonalState(
      address: address ?? this.address,
      reference: reference ?? this.reference,
      delivery: delivery   ?? this.delivery
    );
  

}



class LoadingPersonalState extends PersonalState {}

class SuccessRegisterPersona extends PersonalState {}

class FailureState extends PersonalState {
  final String error;

  FailureState({this.error});
}
