import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:formz/formz.dart';
import 'package:jhipsterfluttersample/account/login/bloc/login_models.dart';
import 'package:jhipsterfluttersample/account/login/bloc/login_state.dart';
import 'package:jhipsterfluttersample/account/login/bloc/login_events.dart';
import 'package:jhipsterfluttersample/account/login/login_repository.dart';
import 'package:jhipsterfluttersample/shared/models/user_jwt.dart';
import 'package:jhipsterfluttersample/shared/repository/http_utils.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;

  LoginBloc({@required LoginRepository loginRepository}) : assert(loginRepository != null),
        _loginRepository = loginRepository, super(const LoginState());

  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginChanged) {
      final login = LoginInput.dirty(event.login);
      yield state.copyWith(
        login: login,
        status: Formz.validate([login, state.password]),
      );
    } else if (event is PasswordChanged) {
      final password = PasswordInput.dirty(event.password);
      yield state.copyWith(
        password: password,
        status: Formz.validate([state.login, password]),
      );
    } else if (event is FormSubmitted) {
      if (state.status.isValidated) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        UserJWT userJWT = UserJWT(state.login.value, state.password.value);
        var token = await _loginRepository.authenticate(userJWT);
        if (token.idToken != null) {
          FlutterSecureStorage storage = new FlutterSecureStorage();
          await storage.delete(key: HttpUtils.keyForJWTToken);
          await storage.write(key: HttpUtils.keyForJWTToken, value: token.idToken);
          yield state.copyWith(status: FormzStatus.submissionSuccess);
        } else {
          yield state.copyWith(status: FormzStatus.submissionFailure,
              generalErrorKey: LoginState.authenticationFailKey);
        }
      }
    }
  }
}
