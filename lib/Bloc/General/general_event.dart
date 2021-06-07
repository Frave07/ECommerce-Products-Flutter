part of 'general_bloc.dart';

@immutable
abstract class GeneralEvent {}


class OnShowHideMenuHome extends GeneralEvent {
  final bool showMenu;

  OnShowHideMenuHome({this.showMenu});
}