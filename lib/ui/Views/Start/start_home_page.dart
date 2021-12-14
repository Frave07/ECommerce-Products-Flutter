import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';


class StartHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context){

    final size = MediaQuery.of(context).size;
    
    return Scaffold(
        backgroundColor: Color(0xff1E4DD8),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('Assets/logo-white.png')
                            )
                          )
                        ),
                        SizedBox(height: 15.0),
                        TextFrave(text: 'FRAVE SHOP', fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                        TextFrave(text: 'All your products in your hands', fontSize: 20, color: Colors.white70),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Container(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        BtnFrave(
                          text: 'Sign Up with Email ID', 
                          colorText: Colors.white,
                          backgroundColor: Color(0xff1C2834), 
                          onPressed: () => Navigator.of(context).pushNamed('signUpPage'), 
                          width: size.width
                        ),
                        SizedBox(height: 15.0),
                        BtnFrave(
                          text: 'Sign Up with Google', 
                          colorText: Colors.black87,
                          fontSize: 19,
                          backgroundColor: Color(0xFFE9EFF9), 
                          width: size.width
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFrave(text: 'Already have an account?', fontSize: 17),
                            TextButton(
                              child: TextFrave(text: 'Sign In', fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                              onPressed: () => Navigator.of(context).pushNamed('signInPage'),
                            ),
                          ],
                        ), 
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}