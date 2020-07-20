import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterfluttersample/account/login/bloc/login_bloc.dart';
import 'package:jhipsterfluttersample/account/login/login_repository.dart';
import 'package:jhipsterfluttersample/account/register/bloc/register_bloc.dart';
import 'package:jhipsterfluttersample/account/settings/settings_screen.dart';
import 'package:jhipsterfluttersample/entities/employee/bloc/employee_bloc.dart';
import 'package:jhipsterfluttersample/entities/employee/employee_list_screen.dart';
import 'package:jhipsterfluttersample/entities/employee/employee_repository.dart';
import 'package:jhipsterfluttersample/main/bloc/main_bloc.dart';
import 'package:jhipsterfluttersample/routes.dart';
import 'package:jhipsterfluttersample/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jhipsterfluttersample/shared/repository/account_repository.dart';
import 'package:jhipsterfluttersample/themes.dart';
import 'account/settings/bloc/settings_bloc.dart';
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
              create: (context) => LoginBloc(loginRepository: LoginRepository()),
              child: LoginScreen()
          );
        },
        JhipsterfluttersampleRoutes.register: (context) {
          return BlocProvider<RegisterBloc>(
              create: (context) => RegisterBloc(accountRepository: AccountRepository()),
              child: RegisterScreen());
        },
        JhipsterfluttersampleRoutes.main: (context) {
          return BlocProvider<MainBloc>(
              create: (context) => MainBloc(accountRepository: AccountRepository())
                ..add(Init()),
              child: MainScreen());
        },
        JhipsterfluttersampleRoutes.settings: (context) {
          return BlocProvider<SettingsBloc>(
              create: (context) => SettingsBloc(accountRepository: AccountRepository())
                ..add(LoadCurrentUser()),
              child: SettingsScreen());
        },
        JhipsterfluttersampleRoutes.entitiesEmployeeList: (context) {
          return BlocProvider<EmployeeBloc>(
              create: (context) => EmployeeBloc(employeeRepository: EmployeeRepository())
                ..add(InitList()),
              child: EmployeeListScreen());
        },     },
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
