import 'package:e_commers/Bloc/user/user_bloc.dart';
import 'package:e_commers/Helpers/helpers.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';


class DeliveryPage extends StatefulWidget {
  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}


class _DeliveryPageState extends State<DeliveryPage> {

  late TextEditingController _streetAddress; 
  late TextEditingController _referenceController;
  late TextEditingController _zipCodeController;
  final _keyForm = GlobalKey<FormState>();


  getPersonalInformation() async {

    final userBloc = BlocProvider.of<UserBloc>(context).state.user!;    
    _streetAddress = TextEditingController(text: userBloc.address);
    _referenceController = TextEditingController(text: userBloc.reference);
    _zipCodeController = TextEditingController();

    setState(() {});
  }

  @override
  void initState() {
    getPersonalInformation();
    super.initState();
  }

  @override
  void dispose() {
    _streetAddress.dispose();
    _referenceController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context){

    final userBloc = BlocProvider.of<UserBloc>(context);
    final size = MediaQuery.of(context).size;

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if(state is LoadingUserState){
          modalLoading(context, 'Checking...');
        }else if (state is FailureUserState){
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }else if ( state is SetUserState ){
          Navigator.pop(context);
          setState(() {});
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const TextFrave(text: 'Street Address', color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold ),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            splashRadius: 20,
            icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Form(
          key: _keyForm,
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              children: [
                
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) 
                    => state.user != null 
                    ? state.user?.address != '' 
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                          height: 70,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.blue)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextFrave(text: '${state.user!.address}', fontSize: 18,),
                              Icon(Icons.radio_button_checked_rounded, size: 31, color: Colors.blue )
                            ],
                          ),
                      )
                      : const SizedBox()
                    : const SizedBox()
                ),
        
                const SizedBox(height: 10.0),
                TextFormFrave(
                  controller: _streetAddress,
                  hintText: 'Street Address', 
                  prefixIcon: const Icon(Icons.location_city_rounded),
                  validator: RequiredValidator(errorText: 'Street is required'),
                ),
        
                const SizedBox(height: 20.0),
                TextFormFrave(
                  controller: _referenceController,
                  hintText: 'Reference',
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  validator: RequiredValidator(errorText: 'Reference is required'),
                ),
        
                const SizedBox(height: 20.0),
                TextFormFrave(
                  controller: _zipCodeController,
                  hintText: 'Zip code', 
                  prefixIcon: const Icon(Icons.location_searching_rounded),
                ),
        
                const SizedBox(height: 20.0),
                BtnFrave(
                  text: 'Save Address', 
                  height: 55,
                  width: size.width, 
                  fontSize: 19,
                  onPressed: (){
                    if( _keyForm.currentState!.validate() ){
                      userBloc.add( OnUpdateStreetAdressEvent(_streetAddress.text.trim(), _referenceController.text.trim()));
                    }
                  } 
                )
              ],
            ),
        ),
       ),
    );
  }
}