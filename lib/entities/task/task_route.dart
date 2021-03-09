
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/shared/models/entity_arguments.dart';

import 'bloc/task_bloc.dart';
import 'task_list_screen.dart';
import 'task_repository.dart';
import 'task_update_screen.dart';
import 'task_view_screen.dart';

class TaskRoutes {
  static final list = '/entities/task-list';
  static final create = '/entities/task-create';
  static final edit = '/entities/task-edit';
  static final view = '/entities/task-view';

  static const listScreenKey = Key('__taskListScreen__');
  static const createScreenKey = Key('__taskCreateScreen__');
  static const editScreenKey = Key('__taskEditScreen__');
  static const viewScreenKey = Key('__taskViewScreen__');

  static final map = <String, WidgetBuilder>{
    list: (context) {
      return BlocProvider<TaskBloc>(
          create: (context) => TaskBloc(taskRepository: TaskRepository())
            ..add(InitTaskList()),
          child: TaskListScreen());
    },
    create: (context) {
      return BlocProvider<TaskBloc>(
          create: (context) => TaskBloc(taskRepository: TaskRepository()),
          child: TaskUpdateScreen());
    },
    edit: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<TaskBloc>(
          create: (context) => TaskBloc(taskRepository: TaskRepository())
            ..add(LoadTaskByIdForEdit(id: arguments.id)),
          child: TaskUpdateScreen());
    },
    view: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<TaskBloc>(
          create: (context) => TaskBloc(taskRepository: TaskRepository())
            ..add(LoadTaskByIdForView(id: arguments.id)),
          child: TaskViewScreen());
    },
  };
}
