abstract class SignInEvent {}

//this is a class in which two events will occur, one is changing email and the another is change password.
class SignInTextChangedEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
//creating constructors for both because we are going to use it on sign in screen.
  SignInTextChangedEvent(this.emailValue, this.passwordValue);
}

//this event will trigger on submit button click.
class SignInSubmitEvent extends SignInEvent {
  final String email;
  final String password;
//creating constructors for both because we are going to use it on sign in screen.
  SignInSubmitEvent(this.email, this.password);
}

//this event is triggered for the color change of signin button.
class ButtonChangeEvent extends SignInEvent {
  final String email;
  final String password;
//creating constructors for both because we are going to use it on sign in screen.
  ButtonChangeEvent(this.email, this.password);
}
