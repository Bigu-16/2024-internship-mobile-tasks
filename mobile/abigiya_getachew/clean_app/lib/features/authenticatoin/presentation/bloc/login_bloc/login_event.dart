abstract class LoginEvent{
  const LoginEvent();
}

class LoginRequested extends LoginEvent{
  final String email;
  final String password;

  const LoginRequested(this.email,this.password);
}
