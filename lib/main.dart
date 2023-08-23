import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validation_using_bloc/sign_in/bloc/sign_in_bloc.dart';
import 'package:validation_using_bloc/sign_in/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //by providing bloc provider, we can say that this sign in bloc will be available in sign in screen.
      home: BlocProvider(
          create: (BuildContext context) => SignInBloc(),
          child: SignInScreen()),
    );
  }
}
