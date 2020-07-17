part of 'settings_bloc.dart';

enum SettingsAction {none, reloadForLanguage}

class SettingsState extends Equatable {
  final FirstnameInput firstname;
  final LastnameInput lastname;
  final EmailInput email;
  final String language;
  final FormzStatus formStatus;
  final SettingsAction action;
  final String generalErrorKey;
  final User currentUser;

  const SettingsState({
    this.firstname = const FirstnameInput.pure(),
    this.lastname = const LastnameInput.pure(),
    this.email = const EmailInput.pure(),
    this.language = 'en',
    this.action = SettingsAction.none,
    this.formStatus = FormzStatus.pure,
    this.generalErrorKey = HttpUtils.generalNoErrorKey,
    this.currentUser = const User('', '', '', '', '', '')
  });

  SettingsState copyWith({
    FirstnameInput firstname,
    LastnameInput lastname,
    EmailInput email,
    String language,
    FormzStatus status,
    String generalErrorKey,
    SettingsAction action,
    User currentUser
  }) {
    return SettingsState(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      language: language ?? this.language,
      formStatus: status ?? this.formStatus,
      generalErrorKey: generalErrorKey ?? this.generalErrorKey,
      action: action ?? this.action,
      currentUser: currentUser ?? this.currentUser
    );
  }

  @override
  List<Object> get props => [firstname, lastname, email, language, formStatus, generalErrorKey];

  @override
  bool get stringify => true;
}
