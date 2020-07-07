import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:jhipsterfluttersample/generated/l10n.dart';
import 'package:jhipsterfluttersample/shared/bloc/bloc.dart';
import 'package:jhipsterfluttersample/shared/models/user.dart';
import 'package:jhipsterfluttersample/shared/repository/account_repository.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc extends Bloc {
  final _user = BehaviorSubject<User>();

  Stream<User> get userStream => _user.stream;

  final accountRepository = AccountRepository();

  User currentUser;

  MainBloc();

  Future<User> fetchConnectedUser() async {
    if(currentUser == null) {
      currentUser = await accountRepository.getIdentity();
      _user.sink.add(currentUser);
    }
    return currentUser;
  }

  Future<bool> init() async {
    await fetchConnectedUser();
    return await detectLanguage();
  }

  Future<bool> detectLanguage() async {
    bool reload = false;
    if(currentUser.langKey.compareTo(S.current.locale) != 0) {
      S.load(Locale(currentUser.langKey));
      reload = true;
    }
    return reload;
 }

  @override
  void dispose() => () {
   _user.close();
 };
}
