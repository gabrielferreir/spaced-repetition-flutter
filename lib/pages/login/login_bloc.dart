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
  }
}
