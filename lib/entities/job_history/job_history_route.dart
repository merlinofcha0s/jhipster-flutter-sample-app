
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/shared/models/entity_arguments.dart';

import 'bloc/job_history_bloc.dart';
import 'job_history_list_screen.dart';
import 'job_history_repository.dart';
import 'job_history_update_screen.dart';
import 'job_history_view_screen.dart';

class JobHistoryRoutes {
  static final list = '/entities/jobHistory-list';
  static final create = '/entities/jobHistory-create';
  static final edit = '/entities/jobHistory-edit';
  static final view = '/entities/jobHistory-view';

  static const listScreenKey = Key('__jobHistoryListScreen__');
  static const createScreenKey = Key('__jobHistoryCreateScreen__');
  static const editScreenKey = Key('__jobHistoryEditScreen__');
  static const viewScreenKey = Key('__jobHistoryViewScreen__');

  static final map = <String, WidgetBuilder>{
    list: (context) {
      return BlocProvider<JobHistoryBloc>(
          create: (context) => JobHistoryBloc(jobHistoryRepository: JobHistoryRepository())
            ..add(InitJobHistoryList()),
          child: JobHistoryListScreen());
    },
    create: (context) {
      return BlocProvider<JobHistoryBloc>(
          create: (context) => JobHistoryBloc(jobHistoryRepository: JobHistoryRepository()),
          child: JobHistoryUpdateScreen());
    },
    edit: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<JobHistoryBloc>(
          create: (context) => JobHistoryBloc(jobHistoryRepository: JobHistoryRepository())
            ..add(LoadJobHistoryByIdForEdit(id: arguments.id)),
          child: JobHistoryUpdateScreen());
    },
    view: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<JobHistoryBloc>(
          create: (context) => JobHistoryBloc(jobHistoryRepository: JobHistoryRepository())
            ..add(LoadJobHistoryByIdForView(id: arguments.id)),
          child: JobHistoryViewScreen());
    },
  };
}
