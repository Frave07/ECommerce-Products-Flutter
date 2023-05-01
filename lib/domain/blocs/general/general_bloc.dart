import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState>{

  GeneralBloc() : super(GeneralInitial()){

    on<OnShowOrHideMenuEvent>(_showHideMenu );

  }


  Future<void> _showHideMenu( OnShowOrHideMenuEvent event, Emitter<GeneralState> emit ) async {

    emit( SetMenuHomeState(menu: event.showMenu) );

  }



}

