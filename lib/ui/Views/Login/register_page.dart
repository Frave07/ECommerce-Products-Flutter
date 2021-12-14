import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commers/Bloc/user/user_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:e_commers/Helpers/helpers.dart';
import 'package:e_commers/Helpers/validation_form.dart';
import 'package:e_commers/ui/Views/Login/login_page.dart';
import 'package:e_commers/ui/themes/colors_frave.dart';
import 'package:e_commers/ui/widgets/widgets.dart';


class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  late TextEditingController userController;
  late TextEditingController emailController;
  late TextEditingController passowrdController;
  late TextEditingController passController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    userController = TextEditingController();
    emailController = TextEditingController();
    passowrdController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    clear();
    userController.dispose();
    emailController.dispose();
    passowrdController.dispose();
    passController.dispose();
    super.dispose();
  }

  void clear(){
    userController.clear();
    emailController.clear();
    passowrdController.clear();
    passController.clear();
  }

  @override
  Widget build(BuildContext context) {

    final userBloc = BlocProvider.of<UserBloc>(context);
    final size = MediaQuery.of(context).size;

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if( state is LoadingUserState ){

          modalLoading(context, 'Validating...');
        }
        if( state is SuccessUserState ){
          
          Navigator.of(context).pop();
          modalSuccess(context,'USER CREATED', onPressed: (){
            clear();
            Navigator.pushReplacement(context, routeSlide(page: SignInPage()));
          });
        }
        if( state is FailureUserState ){

          Navigator.of(context).pop();
          errorMessageSnack(context, state.error);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            splashRadius: 20,
            icon: const Icon(Icons.close_rounded, color: Colors.black,),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            TextButton(
              child: const TextFrave(text: 'Log In', fontSize: 17, color: ColorsFrave.primaryColorFrave ),
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
              TextFrave(text: 'Welcome to Frave Shop', fontSize: 24, fontWeight: FontWeight.w600),
              SizedBox(height: 5.0),
              TextFrave(text: 'Create Account', fontSize: 17),
              SizedBox(height: 20.0),
              TextFormFrave(
                hintText: 'Username',
                prefixIcon: Icon(Icons.person),
                controller: userController,
                validator: RequiredValidator(errorText: 'Username is required'),
              ),
              
              SizedBox(height: 15.0),
              TextFormFrave(
                hintText: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(Icons.email_outlined),
                controller: emailController,
                validator: validatedEmail
              ),
              SizedBox(height: 15.0),
              TextFormFrave(
                hintText: 'Password',
                prefixIcon: Icon(Icons.vpn_key_rounded),
                isPassword: true,
                controller: passowrdController,
                validator: passwordValidator,
              ),
              SizedBox(height: 15.0),
              TextFormFrave(
                hintText: 'Repeat Password',
                controller: passController,
                prefixIcon: Icon(Icons.vpn_key_rounded),
                isPassword: true,
                validator: (val) => MatchValidator(errorText: 'Password do not macth ').validateMatch(val!, passowrdController.text)
              ),
              SizedBox(height: 25.0),

              Row(
                children: const [
                  Icon(Icons.check_circle_rounded, color: Color(0xff0C6CF2)),
                  TextFrave(text: ' I Agree to Frave Shop ', fontSize: 15,),
                  TextFrave(text: ' Terms of Use', fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xff0C6CF2)),
                ],
              ),

              SizedBox(height: 25.0),
              BtnFrave(
                text: 'Sign Up',
                width: size.width,
                fontSize: 20,
                onPressed: (){
                  if( _formKey.currentState!.validate() ){
                    userBloc.add( OnAddNewUser( 
                      userController.text.trim(), 
                      emailController.text.trim(), 
                      passowrdController.text.trim()
                    ));
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


