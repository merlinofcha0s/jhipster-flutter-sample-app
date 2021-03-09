import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/account/login/bloc/login_bloc.dart';
import 'package:jhipsterFlutterSampleApp/account/login/login_repository.dart';
import 'package:jhipsterFlutterSampleApp/account/register/bloc/register_bloc.dart';
import 'package:jhipsterFlutterSampleApp/account/settings/settings_screen.dart';
import 'package:jhipsterFlutterSampleApp/main/bloc/main_bloc.dart';
import 'package:jhipsterFlutterSampleApp/routes.dart';
import 'package:jhipsterFlutterSampleApp/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/account_repository.dart';
import 'package:jhipsterFlutterSampleApp/themes.dart';
import 'account/settings/bloc/settings_bloc.dart';

import 'account/login/login_screen.dart';
import 'account/register/register_screen.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

import 'entities/country/country_route.dart';
import 'entities/department/department_route.dart';
import 'entities/employee/employee_route.dart';
import 'entities/job/job_route.dart';
import 'entities/job_history/job_history_route.dart';
import 'entities/location/location_route.dart';
import 'entities/person/person_route.dart';
import 'entities/region/region_route.dart';
import 'entities/task/task_route.dart';
// jhipster-merlin-needle-import-add - JHipster will add new imports here

class JhipsterFlutterSampleAppApp extends StatelessWidget {
  const JhipsterFlutterSampleAppApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JhipsterFlutterSampleApp app',
      theme: Themes.jhLight,
      routes: {
        JhipsterFlutterSampleAppRoutes.login: (context) {
          return BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(loginRepository: LoginRepository()),
            child: LoginScreen());
        },
        JhipsterFlutterSampleAppRoutes.register: (context) {
          return BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(accountRepository: AccountRepository()),
            child: RegisterScreen());
        },
        JhipsterFlutterSampleAppRoutes.main: (context) {
          return BlocProvider<MainBloc>(
            create: (context) => MainBloc(accountRepository: AccountRepository())
              ..add(Init()),
            child: MainScreen());
        },
      JhipsterFlutterSampleAppRoutes.settings: (context) {
        return BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(accountRepository: AccountRepository())
            ..add(LoadCurrentUser()),
          child: SettingsScreen());
        },
        ...CountryRoutes.map,
        ...DepartmentRoutes.map,
        ...EmployeeRoutes.map,
        ...JobRoutes.map,
        ...JobHistoryRoutes.map,
        ...LocationRoutes.map,
        ...PersonRoutes.map,
        ...RegionRoutes.map,
        ...TaskRoutes.map,
        // jhipster-merlin-needle-route-add - JHipster will add new routes here
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
