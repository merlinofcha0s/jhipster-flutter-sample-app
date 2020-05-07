import 'package:JhipsterAppSample/main/main_bloc.dart';
import 'package:JhipsterAppSample/main/main_screen.dart';
import 'package:JhipsterAppSample/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'account/login/login_bloc.dart';
import 'account/login/login_screen.dart';
import 'account/register/register_bloc.dart';
import 'account/register/register_screen.dart';
import 'generated/l10n.dart';
import 'shared/bloc/bloc_provider.dart';

class JhipsterSampleApp extends StatelessWidget {
  const JhipsterSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jhipster flutter app',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        JhipsterSampleRoutes.login: (context) {
          return BlocProvider<LoginBloc>(bloc: LoginBloc(), child: LoginScreen());
        },
        JhipsterSampleRoutes.register: (context) {
          return BlocProvider<RegisterBloc>(
              bloc: RegisterBloc(), child: RegisterScreen());
        },
        JhipsterSampleRoutes.main: (context) {
          return BlocProvider<MainBloc>(
              bloc: MainBloc(), child: MainScreen());
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
