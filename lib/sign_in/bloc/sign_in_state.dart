//we are having 3 states here, one is that the error will be shown, another state is for data invalid, and the last will be for the valid data. Two other states are for showing loading or progress bar, and initial state is mandatory.
import 'package:flutter/cupertino.dart';

abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInValidState extends SignInState {}

class ButtonColourState extends SignInState {}

//this state will have data that we are gonna change dynamically in accordance to error.
class SignInErrorState extends SignInState {
  final String errorMessage;
  SignInErrorState(this.errorMessage);
}

class SignInLoadingState extends SignInState {}
