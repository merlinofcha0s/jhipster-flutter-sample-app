
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/shared/models/entity_arguments.dart';

import 'bloc/department_bloc.dart';
import 'department_list_screen.dart';
import 'department_repository.dart';
import 'department_update_screen.dart';
import 'department_view_screen.dart';

class DepartmentRoutes {
  static final list = '/entities/department-list';
  static final create = '/entities/department-create';
  static final edit = '/entities/department-edit';
  static final view = '/entities/department-view';

  static const listScreenKey = Key('__departmentListScreen__');
  static const createScreenKey = Key('__departmentCreateScreen__');
  static const editScreenKey = Key('__departmentEditScreen__');
  static const viewScreenKey = Key('__departmentViewScreen__');

  static final map = <String, WidgetBuilder>{
    list: (context) {
      return BlocProvider<DepartmentBloc>(
          create: (context) => DepartmentBloc(departmentRepository: DepartmentRepository())
            ..add(InitDepartmentList()),
          child: DepartmentListScreen());
    },
    create: (context) {
      return BlocProvider<DepartmentBloc>(
          create: (context) => DepartmentBloc(departmentRepository: DepartmentRepository()),
          child: DepartmentUpdateScreen());
    },
    edit: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<DepartmentBloc>(
          create: (context) => DepartmentBloc(departmentRepository: DepartmentRepository())
            ..add(LoadDepartmentByIdForEdit(id: arguments.id)),
          child: DepartmentUpdateScreen());
    },
    view: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<DepartmentBloc>(
          create: (context) => DepartmentBloc(departmentRepository: DepartmentRepository())
            ..add(LoadDepartmentByIdForView(id: arguments.id)),
          child: DepartmentViewScreen());
    },
  };
}
