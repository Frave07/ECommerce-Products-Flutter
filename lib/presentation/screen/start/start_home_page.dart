import 'package:e_commers/presentation/components/widgets.dart';
import 'package:flutter/material.dart';

class StartHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context){

    final size = MediaQuery.of(context).size;
    
    return Scaffold(
        backgroundColor: Color(0xff1E4DD8),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 70,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(120),
                            child: Image.asset('assets/fraved_logo.png')
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        const TextFrave(
                          text: 'Fraved Shop', 
                          isTitle: true,
                          fontSize: 32, 
                          fontWeight: FontWeight.bold, 
                          color: Colors.white
                        ),
                        const TextFrave(
                          text: 'All your products in your hands', 
                          fontSize: 20, 
                          isTitle: true,
                          color: Colors.white70
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Container(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        BtnFrave(
                          text: 'Sign in with email', 
                          isTitle: true,
                          height: 55,
                          fontSize: 18,
                          border: 60,
                          fontWeight: FontWeight.w600,
                          colorText: Colors.white,
                          backgroundColor: Color(0xff1C2834), 
                          onPressed: () => Navigator.of(context).pushNamed('signInPage'), 
                          width: size.width
                        ),
                        const SizedBox(height: 15.0),
                        BtnFrave(
                          text: 'Sign in with Google', 
                          colorText: Colors.black87,
                          fontSize: 18,
                          border: 60,
                          isTitle: true,
                          fontWeight: FontWeight.w600,
                          backgroundColor: Color(0xFFE9EFF9), 
                          width: size.width
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFrave(
                              text: 'Don\'t have an account?', 
                              fontSize: 17,
                              color: Colors.white70,
                            ),
                            TextButton(
                              child: TextFrave(text: 'Sign up', fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                              onPressed: () => Navigator.of(context).pushNamed('signUpPage'),
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