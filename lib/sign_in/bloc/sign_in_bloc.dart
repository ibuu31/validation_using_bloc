import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validation_using_bloc/sign_in/bloc/sign_in_event.dart';
import 'package:validation_using_bloc/sign_in/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      //validator will pass a bool function, returning true or false according to condition.
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState('Please enter proper email'));
      } else if (event.passwordValue.length < 7) {
        emit(SignInErrorState('Enter a valid password'));
      } else if (EmailValidator.validate(event.emailValue)) {
        //when both the values are valid.
        emit(SignInValidState());
      }
    });
    on<SignInSubmitEvent>((event, emit) {
      if (event.password is SignInValidState) {
        emit(SignInLoadingState());
      }
    });
    on<ButtonChangeEvent>((event, emit) {
      if (EmailValidator.validate(event.email) && event.password.length > 6) {
        //when both the values are valid.
        emit(ButtonColourState());
      }
    });
  }
}
