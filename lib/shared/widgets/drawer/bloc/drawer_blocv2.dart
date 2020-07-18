import 'dart:async';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';
import 'package:jhipsterfluttersample/account/login/login_repository.dart';
import 'package:jhipsterfluttersample/account/settings/bloc/settings_models.dart';
import 'package:jhipsterfluttersample/generated/l10n.dart';
import 'package:jhipsterfluttersample/shared/models/user.dart';
import 'package:jhipsterfluttersample/shared/repository/account_repository.dart';
import 'package:jhipsterfluttersample/shared/repository/http_utils.dart';

part 'drawer_events.dart';
part 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  final LoginRepository _loginRepository;

  DrawerBloc({@required LoginRepository loginRepository}) : assert(loginRepository != null),
        _loginRepository = loginRepository, super(const DrawerState());

  @override
  void onTransition(Transition<DrawerEvent, DrawerState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<DrawerState> mapEventToState(DrawerEvent event) async* {
    if (event is Logout) {
       yield* onLogout(event);
    }
  }

  Stream<DrawerState> onLogout(Logout event) async* {
    await _loginRepository.logout();
    yield state.copyWith(isLogout: true);
  }
}
