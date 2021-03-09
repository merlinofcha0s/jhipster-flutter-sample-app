
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/shared/models/entity_arguments.dart';

import 'bloc/employee_bloc.dart';
import 'employee_list_screen.dart';
import 'employee_repository.dart';
import 'employee_update_screen.dart';
import 'employee_view_screen.dart';

class EmployeeRoutes {
  static final list = '/entities/employee-list';
  static final create = '/entities/employee-create';
  static final edit = '/entities/employee-edit';
  static final view = '/entities/employee-view';

  static const listScreenKey = Key('__employeeListScreen__');
  static const createScreenKey = Key('__employeeCreateScreen__');
  static const editScreenKey = Key('__employeeEditScreen__');
  static const viewScreenKey = Key('__employeeViewScreen__');

  static final map = <String, WidgetBuilder>{
    list: (context) {
      return BlocProvider<EmployeeBloc>(
          create: (context) => EmployeeBloc(employeeRepository: EmployeeRepository())
            ..add(InitEmployeeList()),
          child: EmployeeListScreen());
    },
    create: (context) {
      return BlocProvider<EmployeeBloc>(
          create: (context) => EmployeeBloc(employeeRepository: EmployeeRepository()),
          child: EmployeeUpdateScreen());
    },
    edit: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<EmployeeBloc>(
          create: (context) => EmployeeBloc(employeeRepository: EmployeeRepository())
            ..add(LoadEmployeeByIdForEdit(id: arguments.id)),
          child: EmployeeUpdateScreen());
    },
    view: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<EmployeeBloc>(
          create: (context) => EmployeeBloc(employeeRepository: EmployeeRepository())
            ..add(LoadEmployeeByIdForView(id: arguments.id)),
          child: EmployeeViewScreen());
    },
  };
}
