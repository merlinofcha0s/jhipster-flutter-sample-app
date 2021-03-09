
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/shared/models/entity_arguments.dart';

import 'bloc/location_bloc.dart';
import 'location_list_screen.dart';
import 'location_repository.dart';
import 'location_update_screen.dart';
import 'location_view_screen.dart';

class LocationRoutes {
  static final list = '/entities/location-list';
  static final create = '/entities/location-create';
  static final edit = '/entities/location-edit';
  static final view = '/entities/location-view';

  static const listScreenKey = Key('__locationListScreen__');
  static const createScreenKey = Key('__locationCreateScreen__');
  static const editScreenKey = Key('__locationEditScreen__');
  static const viewScreenKey = Key('__locationViewScreen__');

  static final map = <String, WidgetBuilder>{
    list: (context) {
      return BlocProvider<LocationBloc>(
          create: (context) => LocationBloc(locationRepository: LocationRepository())
            ..add(InitLocationList()),
          child: LocationListScreen());
    },
    create: (context) {
      return BlocProvider<LocationBloc>(
          create: (context) => LocationBloc(locationRepository: LocationRepository()),
          child: LocationUpdateScreen());
    },
    edit: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<LocationBloc>(
          create: (context) => LocationBloc(locationRepository: LocationRepository())
            ..add(LoadLocationByIdForEdit(id: arguments.id)),
          child: LocationUpdateScreen());
    },
    view: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<LocationBloc>(
          create: (context) => LocationBloc(locationRepository: LocationRepository())
            ..add(LoadLocationByIdForView(id: arguments.id)),
          child: LocationViewScreen());
    },
  };
}
