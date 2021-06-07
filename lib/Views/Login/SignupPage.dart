import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:e_commers/Bloc/Auth/auth_bloc.dart';
import 'package:e_commers/Helpers/ModalLoading.dart';
import 'package:e_commers/Helpers/ModalSuccess.dart';
import 'package:e_commers/Helpers/ValidatorsForm.dart';
import 'package:e_commers/Widgets/TextFormFrave.dart';
import 'package:e_commers/Widgets/TextFrave.dart';
import 'package:e_commers/Widgets/btnFrave.dart';


class SignUpPage extends StatelessWidget
{

  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passowrdController = TextEditingController();
  final passController  = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context)
  {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {

          if( state is LoadingRegisterState ){

            modalLoading(context, 'Validating...');
          }
          if( state is RegisterSuccess ){
            
            Navigator.of(context).pop();
            modalSuccess(context, 'USER CREATED');
          }
          if( state is FailureRegisterState ){

            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: TextFrave(text: state.error, fontSize: 18,), backgroundColor: Colors.red)
            );
          }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.close_rounded, color: Colors.black,),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            TextButton(
              child: TextFrave(text: 'Log In', fontSize: 18, color: Color(0xff0C6CF2)),
              onPressed: () => Navigator.of(context).pushReplacementNamed('signInPage'),
            ),
            SizedBox(width: 5)
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: BouncingScrollPhysics(),
            children: [
              TextFrave(text: 'Welcome to Frave Shop', fontSize: 23, fontWeight: FontWeight.w600),
              SizedBox(height: 5.0),
              TextFrave(text: 'Create Account', fontSize: 17),
              SizedBox(height: 20.0),
              TextFormFrave(
                hintText: 'Username',
                fontSize: 18,
                prefixIcon: Icons.person_outline_rounded,
                controller: userController,
                validator: RequiredValidator(errorText: 'Username is required'),
              ),
              
              SizedBox(height: 15.0),
              TextFormFrave(
                hintText: 'Email Address',
                type: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
                controller: emailController,
                validator: validatedEmail
              ),
              SizedBox(height: 15.0),
              TextFormFrave(
                hintText: 'Password',
                prefixIcon: Icons.vpn_key_rounded,
                obscureText: true,
                controller: passowrdController,
                validator: passwordValidator,
              ),
              SizedBox(height: 15.0),
              TextFormFrave(
                hintText: 'Repeat Password',
                controller: passController,
                prefixIcon: Icons.vpn_key_rounded,
                obscureText: true,
                validator: (val) => MatchValidator(errorText: 'Password do not macth ').validateMatch(val, passowrdController.text)
              ),
              SizedBox(height: 25.0),

              Row(
                children: [
                  Icon(Icons.check_circle_rounded, color: Color(0xff0C6CF2)),
                  TextFrave(text: ' I Agree to Frave Shop ', fontSize: 15,),
                  TextFrave(text: ' Terms of Use', fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xff0C6CF2)),
                ],
              ),

              SizedBox(height: 25.0),
              BtnFrave(
                text: 'Sign Up',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                height: 60,
                onPressed: (){
                  if( _formKey.currentState.validate() ){
                    authBloc.add( RegisterEvent(
                      username: userController.text, email: emailController.text, password: passowrdController.text) 
                    );
                  }
                },
              )
            ],
          ),
        ),
       ),
    );
  }
}


