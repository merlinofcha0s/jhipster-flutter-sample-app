import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jhipsterfluttersample/environement.dart';
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

  Future<bool> init(String languageCode) async {
    await fetchConnectedUser();
    return await changeLanguage(languageCode);
  }

  Future<bool> changeLanguage(String languageCode) async {
    bool reload = false;
    FlutterSecureStorage storage = new FlutterSecureStorage();
    var locale = await storage.read(key: Constants.langStorageKey);
    if(locale != null) {
      if(currentUser.langKey.compareTo(locale) != 0) {
        S.load(Locale(currentUser.langKey));
        await storage.write(key: Constants.langStorageKey, value: currentUser.langKey);
        reload = true;
      }
    } else {
      await storage.write(key: Constants.langStorageKey, value: languageCode);
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
