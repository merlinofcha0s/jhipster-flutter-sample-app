import 'dart:async';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';
import 'package:jhipsterfluttersample/account/settings/bloc/settings_models.dart';
import 'package:jhipsterfluttersample/generated/l10n.dart';
import 'package:jhipsterfluttersample/shared/models/user.dart';
import 'package:jhipsterfluttersample/shared/repository/account_repository.dart';
import 'package:jhipsterfluttersample/shared/repository/http_utils.dart';

part 'settings_events.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AccountRepository _accountRepository;
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  SettingsBloc({@required AccountRepository accountRepository}) : assert(accountRepository != null),
        _accountRepository = accountRepository, super(const SettingsState());

  static final String loginExistKey = 'error.userexists';
  static final String emailExistKey = 'error.emailexists';
  static final String successKey = 'success.settings';

  @override
  void onTransition(Transition<SettingsEvent, SettingsState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is FirstnameChanged) {
       yield* onFirstnameChange(event);
    } else if (event is LastnameChanged) {
      yield* onLastnameChange(event);
    } else if (event is EmailChanged) {
      yield* onEmailChange(event);
    } else if (event is LanguageChanged) {
      yield* onLanguageChange(event);
    } else if (event is FormSubmitted) {
      yield* onSubmit();
    } else if (event is LoadCurrentUser) {
      yield* onLoadCurrentUser();
    }
  }

  Stream<SettingsState> onSubmit() async* {
    if (state.formStatus.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      SettingsAction action = SettingsAction.none;
      try {
        if(state.language.compareTo(state.currentUser.langKey) != 0) {
          User newCurrentUser = User(state.currentUser.login, state.currentUser.email,
              state.currentUser.password, state.language, state.firstname.value, state.lastname.value);
          yield state.copyWith(currentUser: newCurrentUser);
          S.load(Locale(state.language));
          action = SettingsAction.reloadForLanguage;
        }

        String result = await _accountRepository.saveAccount(state.currentUser);

        if (result.compareTo(HttpUtils.successResult) != 0) {
          yield state.copyWith(status: FormzStatus.submissionFailure,
              generalErrorKey: result);
        } else {
          yield state.copyWith(status: FormzStatus.submissionSuccess,
              action: action);
        }
      } catch (e) {
        yield state.copyWith(status: FormzStatus.submissionFailure,
            generalErrorKey: HttpUtils.errorServerKey);
      }
    }
  }

  Stream<SettingsState> onLanguageChange(LanguageChanged event) async* {
    yield state.copyWith(
      language: event.language,
      status: Formz.validate([state.firstname, state.lastname, state.email]),
    );
  }

  Stream<SettingsState> onEmailChange(EmailChanged event) async* {
    final email = EmailInput.dirty(event.email);
    yield state.copyWith(
      email: email,
      status: Formz.validate([state.firstname, email, state.lastname]),
    );
  }

  Stream<SettingsState> onLastnameChange(LastnameChanged event) async* {
    final lastname = LastnameInput.dirty(event.lastname);
    yield state.copyWith(
      lastname: lastname,
      status: Formz.validate([state.firstname, lastname, state.email]),
    );
  }

  Stream<SettingsState> onFirstnameChange(FirstnameChanged event) async* {
     final firstname = FirstnameInput.dirty(event.firstname);
     yield state.copyWith(
       firstname: firstname,
       status: Formz.validate([firstname, state.lastname, state.email]),
    );
  }

  Stream<SettingsState> onLoadCurrentUser() async* {
    User currentUser = await _accountRepository.getIdentity();
    yield state.copyWith(
        firstname: currentUser.firstName != null ? FirstnameInput.dirty(currentUser.firstName) : FirstnameInput.dirty(''),
        lastname: currentUser.lastName != null ? LastnameInput.dirty(currentUser.lastName) : LastnameInput.dirty(''),
        email:  currentUser.email != null ? EmailInput.dirty(currentUser.email) : EmailInput.pure(),
        currentUser: currentUser);
    emailController.text = currentUser.email;
    lastNameController.text = currentUser.lastName;
    firstNameController.text = currentUser.firstName;
  }

  @override
  Future<void> close() {
    emailController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
    return super.close();
  }
}
