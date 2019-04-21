import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:tg/pages/login/login.dart';
import 'package:tg/repository/user_repository.dart';
import 'package:tg/core/exceptions.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;

  LoginBloc({userRepository})
      : this.userRepository = userRepository ?? UserRepository();

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginRestartState) {
      yield LoginInitial();
    }

    if (event is LoginCheckEmail) {
      yield LoginLoading();
      try {
        final user = await userRepository.checkEmail(email: event.email);
        yield LoginPassInitial(email: user.email, name: user.name);
      } on NotFoundException {
        yield LoginEmailNotFound();
      } catch (e) {
        yield LoginInitial();
      }
    }

    if (event is LoginSingin) {
      yield LoginPassLoading(name: event.name, email: event.email);
      try {
        await userRepository.singin(email: event.email, pass: event.pass);
        yield LoginSuccessful();
      } on NotFoundException {
        yield LoginPassInvalid(name: event.name, email: event.email);
      } catch (e) {}
    }
  }
}
