abstract class SignupEvent{
  const SignupEvent();
}

class SignupRequested extends SignupEvent{
  final String username;
  final String email;
  final String password;

  const SignupRequested(this.username,this.email,this.password);
}

