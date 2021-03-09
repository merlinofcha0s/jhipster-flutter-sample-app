
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/shared/models/entity_arguments.dart';

import 'bloc/country_bloc.dart';
import 'country_list_screen.dart';
import 'country_repository.dart';
import 'country_update_screen.dart';
import 'country_view_screen.dart';

class CountryRoutes {
  static final list = '/entities/country-list';
  static final create = '/entities/country-create';
  static final edit = '/entities/country-edit';
  static final view = '/entities/country-view';

  static const listScreenKey = Key('__countryListScreen__');
  static const createScreenKey = Key('__countryCreateScreen__');
  static const editScreenKey = Key('__countryEditScreen__');
  static const viewScreenKey = Key('__countryViewScreen__');

  static final map = <String, WidgetBuilder>{
    list: (context) {
      return BlocProvider<CountryBloc>(
          create: (context) => CountryBloc(countryRepository: CountryRepository())
            ..add(InitCountryList()),
          child: CountryListScreen());
    },
    create: (context) {
      return BlocProvider<CountryBloc>(
          create: (context) => CountryBloc(countryRepository: CountryRepository()),
          child: CountryUpdateScreen());
    },
    edit: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<CountryBloc>(
          create: (context) => CountryBloc(countryRepository: CountryRepository())
            ..add(LoadCountryByIdForEdit(id: arguments.id)),
          child: CountryUpdateScreen());
    },
    view: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<CountryBloc>(
          create: (context) => CountryBloc(countryRepository: CountryRepository())
            ..add(LoadCountryByIdForView(id: arguments.id)),
          child: CountryViewScreen());
    },
  };
}
