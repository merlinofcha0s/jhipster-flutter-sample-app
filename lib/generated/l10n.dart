// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `en`
  String get locale {
    return Intl.message(
      'en',
      name: 'locale',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get pageLoginBar {
    return Intl.message(
      'Login',
      name: 'pageLoginBar',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Jhipster flutter app`
  String get pageLoginTitle {
    return Intl.message(
      'Welcome to Jhipster flutter app',
      name: 'pageLoginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get pageLoginLoginButton {
    return Intl.message(
      'Sign in',
      name: 'pageLoginLoginButton',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get pageLoginRegisterButton {
    return Intl.message(
      'Register',
      name: 'pageLoginRegisterButton',
      desc: '',
      args: [],
    );
  }

  /// `Problem when authenticate, verify your credential`
  String get pageLoginErrorAuthentication {
    return Intl.message(
      'Problem when authenticate, verify your credential',
      name: 'pageLoginErrorAuthentication',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get pageRegisterTitle {
    return Intl.message(
      'Register',
      name: 'pageRegisterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get pageRegisterFormLogin {
    return Intl.message(
      'Login',
      name: 'pageRegisterFormLogin',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get pageRegisterFormEmail {
    return Intl.message(
      'Email',
      name: 'pageRegisterFormEmail',
      desc: '',
      args: [],
    );
  }

  /// `you@example.com`
  String get pageRegisterFormEmailHint {
    return Intl.message(
      'you@example.com',
      name: 'pageRegisterFormEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get pageRegisterFormPassword {
    return Intl.message(
      'Password',
      name: 'pageRegisterFormPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get pageRegisterFormConfirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'pageRegisterFormConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `I accept the terms of use`
  String get pageRegisterFormTermsConditions {
    return Intl.message(
      'I accept the terms of use',
      name: 'pageRegisterFormTermsConditions',
      desc: '',
      args: [],
    );
  }

  /// `Please accept the terms and conditions`
  String get pageRegisterFormTermsConditionsNotChecked {
    return Intl.message(
      'Please accept the terms and conditions',
      name: 'pageRegisterFormTermsConditionsNotChecked',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get pageRegisterFormSubmit {
    return Intl.message(
      'Sign up',
      name: 'pageRegisterFormSubmit',
      desc: '',
      args: [],
    );
  }

  /// `Email already exist`
  String get pageRegisterErrorMailExist {
    return Intl.message(
      'Email already exist',
      name: 'pageRegisterErrorMailExist',
      desc: '',
      args: [],
    );
  }

  /// `Login already taken`
  String get pageRegisterErrorLoginExist {
    return Intl.message(
      'Login already taken',
      name: 'pageRegisterErrorLoginExist',
      desc: '',
      args: [],
    );
  }

  /// `The passwords are not identical`
  String get pageRegisterErrorPasswordNotIdentical {
    return Intl.message(
      'The passwords are not identical',
      name: 'pageRegisterErrorPasswordNotIdentical',
      desc: '',
      args: [],
    );
  }

  /// `Register success`
  String get pageRegisterSuccessAltImg {
    return Intl.message(
      'Register success',
      name: 'pageRegisterSuccessAltImg',
      desc: '',
      args: [],
    );
  }

  /// `Congratulation`
  String get pageRegisterSuccess {
    return Intl.message(
      'Congratulation',
      name: 'pageRegisterSuccess',
      desc: '',
      args: [],
    );
  }

  /// `You have successfuly registered`
  String get pageRegisterSuccessSub {
    return Intl.message(
      'You have successfuly registered',
      name: 'pageRegisterSuccessSub',
      desc: '',
      args: [],
    );
  }

  /// `Your profile`
  String get pageMainProfileButton {
    return Intl.message(
      'Your profile',
      name: 'pageMainProfileButton',
      desc: '',
      args: [],
    );
  }

  /// `Event`
  String get pageMainEventButton {
    return Intl.message(
      'Event',
      name: 'pageMainEventButton',
      desc: '',
      args: [],
    );
  }

  /// `Open pack`
  String get pageMainOpenPackButton {
    return Intl.message(
      'Open pack',
      name: 'pageMainOpenPackButton',
      desc: '',
      args: [],
    );
  }

  /// `Packs`
  String get pageMainNumberPackOpen {
    return Intl.message(
      'Packs',
      name: 'pageMainNumberPackOpen',
      desc: '',
      args: [],
    );
  }

  /// `Marketplace`
  String get pageMainMarketButton {
    return Intl.message(
      'Marketplace',
      name: 'pageMainMarketButton',
      desc: '',
      args: [],
    );
  }

  /// `Main page`
  String get pageMainTitle {
    return Intl.message(
      'Main page',
      name: 'pageMainTitle',
      desc: '',
      args: [],
    );
  }

  /// `Current user : {login}`
  String pageMainCurrentUser(Object login) {
    return Intl.message(
      'Current user : $login',
      name: 'pageMainCurrentUser',
      desc: '',
      args: [login],
    );
  }

  /// `Welcome to your Jhipster flutter app`
  String get pageMainWelcome {
    return Intl.message(
      'Welcome to your Jhipster flutter app',
      name: 'pageMainWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get drawerSettingsTitle {
    return Intl.message(
      'Settings',
      name: 'drawerSettingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get drawerLogoutTitle {
    return Intl.message(
      'Sign out',
      name: 'drawerLogoutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get drawerMenuTitle {
    return Intl.message(
      'Menu',
      name: 'drawerMenuTitle',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get drawerMenuMain {
    return Intl.message(
      'Home',
      name: 'drawerMenuMain',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get pageSettingsTitle {
    return Intl.message(
      'Settings',
      name: 'pageSettingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Firstname`
  String get pageSettingsFormFirstname {
    return Intl.message(
      'Firstname',
      name: 'pageSettingsFormFirstname',
      desc: '',
      args: [],
    );
  }

  /// `Lastname`
  String get pageSettingsFormLastname {
    return Intl.message(
      'Lastname',
      name: 'pageSettingsFormLastname',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get pageSettingsFormEmail {
    return Intl.message(
      'Email',
      name: 'pageSettingsFormEmail',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get pageSettingsFormLanguages {
    return Intl.message(
      'Languages',
      name: 'pageSettingsFormLanguages',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get pageSettingsFormSave {
    return Intl.message(
      'Save',
      name: 'pageSettingsFormSave',
      desc: '',
      args: [],
    );
  }

  /// `Settings saved !`
  String get pageSettingsSave {
    return Intl.message(
      'Settings saved !',
      name: 'pageSettingsSave',
      desc: '',
      args: [],
    );
  }

  /// `Something wrong happened with the received data`
  String get genericErrorBadRequest {
    return Intl.message(
      'Something wrong happened with the received data',
      name: 'genericErrorBadRequest',
      desc: '',
      args: [],
    );
  }

  /// `Something wrong when calling the server, please try again`
  String get genericErrorServer {
    return Intl.message(
      'Something wrong when calling the server, please try again',
      name: 'genericErrorServer',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}