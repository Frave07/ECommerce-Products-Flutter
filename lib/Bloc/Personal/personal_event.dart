part of 'personal_bloc.dart';

@immutable
abstract class PersonalEvent {}


class AddStreetAddress extends PersonalEvent {
  final String address;
  final String reference;

  AddStreetAddress({this.address, this.reference});
}


class GetStreetAddress extends PersonalEvent {
  final String address;
  final String reference;

  GetStreetAddress({this.address, this.reference});
}


class OnSelectStreetAddress extends PersonalEvent {
  final bool delivery;

  OnSelectStreetAddress({this.delivery});
}


class RegisterPersonalInformationEvent extends PersonalEvent {
  final String name;
  final String lastName;
  final String phone;
  final String address;
  final String reference;

  RegisterPersonalInformationEvent({this.name, this.lastName, this.phone, this.address, this.reference});

}