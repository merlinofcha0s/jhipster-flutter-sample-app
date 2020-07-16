import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:jhipsterfluttersample/environment.dart';
import 'package:jhipsterfluttersample/generated/l10n.dart';
import 'package:jhipsterfluttersample/shared/bloc/bloc.dart';
import 'package:jhipsterfluttersample/shared/mixins/validators_mixin.dart';
import 'package:jhipsterfluttersample/shared/models/user.dart';
import 'package:jhipsterfluttersample/shared/repository/account_repository.dart';
import 'package:jhipsterfluttersample/shared/repository/http_utils.dart';
import 'package:rxdart/rxdart.dart';


class SettingsBloc extends Bloc with ValidatorMixin {
  final _firstName = BehaviorSubject<String>();
  final _lastName = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _languageChoose = BehaviorSubject<String>();
  final _languages = BehaviorSubject<Map<String, String>>();
  final _isLoading = BehaviorSubject<bool>();
  final _notificationSaveSettings = BehaviorSubject<String>();

  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  final accountRepository = AccountRepository();

  Stream<String> get firstNameStream => _firstName.stream.transform(validateName);

  Stream<String> get lastNameStream => _lastName.stream.transform(validateName);

  Stream<String> get emailStream => _email.stream.transform(validateEmail);

  Stream<Map<String, String>> get languagesStream => _languages.stream;

  Stream<String> get languageChooseStream => _languageChoose.stream;

  Stream<bool> get isLoadingStream => _isLoading.stream;

  Stream<String> get notificationSaveSettings => _notificationSaveSettings.stream;

  Function(String) get changeFirstname => _firstName.sink.add;

  Function(String) get changeLastname => _lastName.sink.add;

  Function(String) get changeEmail => _email.sink.add;

  Stream<bool> get submitValid => Rx.combineLatest4(firstNameStream,
      lastNameStream, emailStream, languageChooseStream, (f, l, e, lc) => true);

  User currentUser;

  static final String successKey = 'success.settings';
  static final String badrequestKey = 'error.400';

  SettingsBloc() {
    _isLoading.sink.add(false);
    _languages.sink.add(Constants.languages);
  }

  void changeLanguage(String value) {
    _languageChoose.sink.add(value);
  }

  void getIdentity() async {
    currentUser = await accountRepository.getIdentity();
    _firstName.sink.add(currentUser.firstName);
    _lastName.sink.add(currentUser.lastName);
    _email.sink.add(currentUser.email);
    _languageChoose.sink.add(currentUser.langKey);
    emailController.text = currentUser.email;
    lastNameController.text = currentUser.lastName;
    firstNameController.text = currentUser.firstName;

  }

  Future<bool> submit() async {
    bool reload = false;
    _isLoading.sink.add(true);
    currentUser.firstName = _firstName.value;
    currentUser.lastName = _lastName.value;
    currentUser.email = _email.value;

    if(_languageChoose.value.compareTo(currentUser.langKey) != 0){
      currentUser.langKey = _languageChoose.value;
      S.load(Locale(_languageChoose.value));
      reload = true;
    }

    String result = await accountRepository.saveAccount(currentUser);

    if (result.compareTo(HttpUtils.successResult) != 0) {
      _notificationSaveSettings.sink.addError(result);
    } else {
      _notificationSaveSettings.sink.add(successKey);
    }
    _isLoading.sink.add(false);
    return reload;
  }

  @override
  void dispose() => () {
        _firstName.close();
        _lastName.close();
        _email.close();
        _languageChoose.close();
        _languages.close();
        _isLoading.close();
        emailController.dispose();
        firstNameController.dispose();
        lastNameController.dispose();
        _notificationSaveSettings.close();
      };
}
