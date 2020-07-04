import 'package:jhipsterfluttersample/account/settings/settings_bloc.dart';
import 'package:jhipsterfluttersample/account/settings/settings_screen.dart';
import 'package:jhipsterfluttersample/routes.dart';
import 'package:jhipsterfluttersample/shared/bloc/bloc_provider.dart';
import 'package:jhipsterfluttersample/main/main_bloc.dart';
import 'package:jhipsterfluttersample/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

import 'account/login/login_bloc.dart';
import 'account/login/login_screen.dart';
import 'account/register/register_bloc.dart';
import 'account/register/register_screen.dart';

class JhipsterfluttersampleApp extends StatelessWidget {
  const JhipsterfluttersampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jhipster flutter app',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        JhipsterfluttersampleRoutes.login: (context) {
          return BlocProvider<LoginBloc>(bloc: LoginBloc(), child: LoginScreen());
        },
        JhipsterfluttersampleRoutes.register: (context) {
          return BlocProvider<RegisterBloc>(
              bloc: RegisterBloc(), child: RegisterScreen());
        },
        JhipsterfluttersampleRoutes.main: (context) {
          return BlocProvider<MainBloc>(
              bloc: MainBloc(), child: MainScreen());
        },
        JhipsterfluttersampleRoutes.settings: (context) {
          return BlocProvider<SettingsBloc>(
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
