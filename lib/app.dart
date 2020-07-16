import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterfluttersample/account/login/bloc/login_bloc.dart';
import 'package:jhipsterfluttersample/account/login/login_repository.dart';
import 'package:jhipsterfluttersample/account/register/bloc/register_bloc.dart';
import 'package:jhipsterfluttersample/account/settings/settings_bloc.dart';
import 'package:jhipsterfluttersample/account/settings/settings_screen.dart';
import 'package:jhipsterfluttersample/routes.dart';
import 'package:jhipsterfluttersample/shared/bloc/bloc_provider_legacy.dart';
import 'package:jhipsterfluttersample/main/main_bloc.dart';
import 'package:jhipsterfluttersample/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jhipsterfluttersample/shared/repository/account_repository.dart';
import 'package:jhipsterfluttersample/themes.dart';
import 'generated/l10n.dart';

import 'account/login/login_screen.dart';
import 'account/register/register_screen.dart';

class JhipsterfluttersampleApp extends StatelessWidget {
  const JhipsterfluttersampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jhipster flutter app',
      theme: Themes.jhLight,
      routes: {
        JhipsterfluttersampleRoutes.login: (context) {
          return BlocProvider<LoginBloc>(
               create: (context) => LoginBloc(loginRepository: LoginRepository()), child: LoginScreen()
          );
        },
        JhipsterfluttersampleRoutes.register: (context) {
          return BlocProvider<RegisterBloc>(
              create: (context) => RegisterBloc(accountRepository: AccountRepository()), child: RegisterScreen());
        },
        JhipsterfluttersampleRoutes.main: (context) {
          return BlocProviderLegacy<MainBloc>(
              bloc: MainBloc(), child: MainScreen());
        },
        JhipsterfluttersampleRoutes.settings: (context) {
          return BlocProviderLegacy<SettingsBloc>(
              bloc: SettingsBloc(), child: SettingsScreen());
        },
      },
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales
    );
  }


}
