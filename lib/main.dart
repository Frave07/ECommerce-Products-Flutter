import 'package:e_commers/domain/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commers/presentation/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark )
    );
      
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add( CheckLoginEvent() )),
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => GeneralBloc()),
        BlocProvider(create: (context) => ProductBloc()),
        BlocProvider(create: (context) => CategoryBloc()),
        BlocProvider(create: (context) => CartBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commers Products - Fraved',
        initialRoute: 'loadingPage',
        routes: routes,
      ),
    );
  }
}