part of 'general_bloc.dart';

@immutable
class GeneralState {

  final bool showMenuHome;

  GeneralState({
    this.showMenuHome = true
  });


  GeneralState copyWith({ bool showMenuHome })
    => GeneralState(
      showMenuHome: showMenuHome ?? this.showMenuHome
    );
  
}

