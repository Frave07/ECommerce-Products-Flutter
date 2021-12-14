part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class OnAddNewUser extends UserEvent {
  final String username;
  final String email;
  final String password;

  OnAddNewUser(this.username, this.email, this.password);
}

class OnGetUserEvent extends UserEvent {}

class OnUpdateProfilePictureEvent extends UserEvent {
  final String pathProfile;

  OnUpdateProfilePictureEvent(this.pathProfile);
}

class OnUpdateInformationUserEvent extends UserEvent {
  final String firstname;
  final String lastname;
  final String number;
  final String street;
  final String reference;

  OnUpdateInformationUserEvent(this.firstname, this.lastname, this.number, this.street, this.reference);
} 

class OnUpdateStreetAdressEvent extends UserEvent {
  final String street;
  final String reference;

  OnUpdateStreetAdressEvent(this.street, this.reference);
} 


