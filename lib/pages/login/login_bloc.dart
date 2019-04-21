import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:tg/pages/login/login.dart';
import 'package:tg/repository/user_repository.dart';

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
        final used = await userRepository.checkEmail(email: event.email);
        if (used)
          yield LoginPassInitial();
        else
          yield LoginEmailNotFound();
      } catch (e) {
        yield LoginInitial();
      }
    }
  }
}
