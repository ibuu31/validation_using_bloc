import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validation_using_bloc/sign_in/bloc/sign_in_bloc.dart';
import 'package:validation_using_bloc/sign_in/bloc/sign_in_event.dart';
import 'package:validation_using_bloc/sign_in/bloc/sign_in_state.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text('Sign in with email'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  // onChanged: (val) {
                  //   BlocProvider.of<SignInBloc>(context).add(ButtonChangeEvent(
                  //       emailController.text, passwordController.text));
                  // },
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                TextField(
                  controller: passwordController,
                  onChanged: (val) {
                    BlocProvider.of<SignInBloc>(context).add(ButtonChangeEvent(
                        emailController.text, passwordController.text));
                  },
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<SignInBloc, SignInState>(
                    builder: (BuildContext context, state) {
                  return MaterialButton(
                    color:
                        state is ButtonColourState ? Colors.blue : Colors.grey,
                    onPressed: () {
                      BlocProvider.of<SignInBloc>(context).add(
                          SignInTextChangedEvent(
                              emailController.text, passwordController.text));
                      BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmitEvent(
                              emailController.text, passwordController.text));
                    },
                    child: const Text('Sign In'),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (BuildContext context, state) {
                    if (state is SignInErrorState) {
                      return Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red),
                      );
                    } else if (state is SignInValidState) {
                      return const Text(
                        'SignIn Successful',
                        style: TextStyle(color: Colors.green),
                      );
                    } else {
                      return Container();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
