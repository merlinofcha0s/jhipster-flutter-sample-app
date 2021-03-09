
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/shared/models/entity_arguments.dart';

import 'bloc/region_bloc.dart';
import 'region_list_screen.dart';
import 'region_repository.dart';
import 'region_update_screen.dart';
import 'region_view_screen.dart';

class RegionRoutes {
  static final list = '/entities/region-list';
  static final create = '/entities/region-create';
  static final edit = '/entities/region-edit';
  static final view = '/entities/region-view';

  static const listScreenKey = Key('__regionListScreen__');
  static const createScreenKey = Key('__regionCreateScreen__');
  static const editScreenKey = Key('__regionEditScreen__');
  static const viewScreenKey = Key('__regionViewScreen__');

  static final map = <String, WidgetBuilder>{
    list: (context) {
      return BlocProvider<RegionBloc>(
          create: (context) => RegionBloc(regionRepository: RegionRepository())
            ..add(InitRegionList()),
          child: RegionListScreen());
    },
    create: (context) {
      return BlocProvider<RegionBloc>(
          create: (context) => RegionBloc(regionRepository: RegionRepository()),
          child: RegionUpdateScreen());
    },
    edit: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<RegionBloc>(
          create: (context) => RegionBloc(regionRepository: RegionRepository())
            ..add(LoadRegionByIdForEdit(id: arguments.id)),
          child: RegionUpdateScreen());
    },
    view: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<RegionBloc>(
          create: (context) => RegionBloc(regionRepository: RegionRepository())
            ..add(LoadRegionByIdForView(id: arguments.id)),
          child: RegionViewScreen());
    },
  };
}
