import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commers/Controller/PersonalController.dart';
import 'package:meta/meta.dart';

part 'personal_event.dart';
part 'personal_state.dart';

class PersonalBloc extends Bloc<PersonalEvent, PersonalState> 
{
  PersonalBloc() : super(PersonalState());

  @override
  Stream<PersonalState> mapEventToState( PersonalEvent event ) async* {


      if( event is RegisterPersonalInformationEvent ){

          try {

            yield LoadingPersonalState();

            final resp = await personalController.registerPersonalInformation(
              name: event.name,
              last: event.lastName,
              phone: event.phone,
              address: event.address,
              reference: event.reference
            );

            await Future.delayed(Duration(milliseconds: 300));

            if( resp.resp ){

              yield SuccessRegisterPersona();

              yield state.copyWith(
                address: event.address,
                reference: event.reference
              );


            } else {

              yield FailureState(error: resp.msj );
            }

            
          } catch (e) {
            yield FailureState(error: e.toString());
          }

      
      } else if ( event is AddStreetAddress ) {

          try {

              yield LoadingPersonalState();

              final resp = await personalController.addStreetAddress(
                address: event.address,
                reference: event.reference
              );

              await Future.delayed(Duration(milliseconds: 100));

              if( resp.resp ) {

                yield SuccessRegisterPersona();

                yield state.copyWith(
                  address: event.address,
                  reference: event.reference
                );


              } else {
                yield FailureState(error: resp.msj);
              }


          } catch (e) {
            yield FailureState(error: e.toString());
          }

      
      } else if ( event is GetStreetAddress  ){

          yield state.copyWith(
            address: event.address,
            reference: event.reference
          );
      }

  }


}
