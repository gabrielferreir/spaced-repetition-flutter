import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:tg/pages/authentication/authentication.dart';
import 'package:tg/repository/user_repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required UserRepository this.userRepository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {

    if(event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken)
        yield AuthenticationAuthenticated();
      else
        yield AuthenticationUnauthenticated();
    }

  }

}
