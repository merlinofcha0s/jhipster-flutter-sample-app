
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/shared/models/entity_arguments.dart';

import 'bloc/job_bloc.dart';
import 'job_list_screen.dart';
import 'job_repository.dart';
import 'job_update_screen.dart';
import 'job_view_screen.dart';

class JobRoutes {
  static final list = '/entities/job-list';
  static final create = '/entities/job-create';
  static final edit = '/entities/job-edit';
  static final view = '/entities/job-view';

  static const listScreenKey = Key('__jobListScreen__');
  static const createScreenKey = Key('__jobCreateScreen__');
  static const editScreenKey = Key('__jobEditScreen__');
  static const viewScreenKey = Key('__jobViewScreen__');

  static final map = <String, WidgetBuilder>{
    list: (context) {
      return BlocProvider<JobBloc>(
          create: (context) => JobBloc(jobRepository: JobRepository())
            ..add(InitJobList()),
          child: JobListScreen());
    },
    create: (context) {
      return BlocProvider<JobBloc>(
          create: (context) => JobBloc(jobRepository: JobRepository()),
          child: JobUpdateScreen());
    },
    edit: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<JobBloc>(
          create: (context) => JobBloc(jobRepository: JobRepository())
            ..add(LoadJobByIdForEdit(id: arguments.id)),
          child: JobUpdateScreen());
    },
    view: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<JobBloc>(
          create: (context) => JobBloc(jobRepository: JobRepository())
            ..add(LoadJobByIdForView(id: arguments.id)),
          child: JobViewScreen());
    },
  };
}
