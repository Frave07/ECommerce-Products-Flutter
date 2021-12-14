import 'package:bloc/bloc.dart';
import 'package:e_commers/Models/Response/response_user.dart';
import 'package:e_commers/Service/user_services.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  UserBloc() : super(UserInitial()) {

    on<OnAddNewUser>(_addNewUser);
    on<OnGetUserEvent>(_getUser);
    on<OnUpdateProfilePictureEvent>(_updatePictureProfile);
    on<OnUpdateInformationUserEvent>(_updateInformationUser);
    on<OnUpdateStreetAdressEvent>(_updateStreetAddress);
  }


  Future<void> _getUser( OnGetUserEvent event, Emitter<UserState> emit ) async {

    final user = await userServices.getUserById();
    emit( SetUserState(user: user));

  }


  Future<void> _addNewUser( OnAddNewUser event, Emitter<UserState> emit ) async {

    try {

      emit(LoadingUserState());

      final data = await userServices.addNewUser(event.username, event.email, event.password);

      if(data.resp){
        emit( SuccessUserState());
      }else{
        emit(FailureUserState(data.message));
      }
      
    } catch (e) {
      emit( FailureUserState(e.toString()));
    }

  }
  

  Future<void> _updatePictureProfile( OnUpdateProfilePictureEvent event, Emitter<UserState> emit ) async {

    try {

      emit( LoadingUserState());

      final data = await userServices.updatePictureProfile(event.pathProfile);

      if(data.resp){
        final user = await userServices.getUserById();
        emit(SetUserState(user: user));
      }else{
        emit(FailureUserState(data.message));
      }
      
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }

  }


  Future<void> _updateInformationUser( OnUpdateInformationUserEvent event, Emitter<UserState> emit ) async {

    try {

      emit(LoadingUserState());

      final data = await userServices.updateInformationUser(event.firstname, event.lastname, event.number, event.street, event.reference);

      if(data.resp){
        final user = await userServices.getUserById();
        emit( SetUserState(user: user));
      }else{
        emit(FailureUserState(data.message));
      }
      
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }

  }


  Future<void> _updateStreetAddress( OnUpdateStreetAdressEvent event, Emitter<UserState> emit ) async {

    try {

      emit(LoadingUserState());

      final data = await userServices.updateStreetAddress(event.street, event.reference);

      if(data.resp){
        final user = await userServices.getUserById();
        emit( SetUserState(user: user));
      }else{
        emit(FailureUserState(data.message));
      }
      
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }

  }
  




  
}
