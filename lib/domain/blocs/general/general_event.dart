part of 'general_bloc.dart';

@immutable
abstract class GeneralEvent {}


class OnShowOrHideMenuEvent extends GeneralEvent {
  final bool showMenu;

  OnShowOrHideMenuEvent({required this.showMenu});
}