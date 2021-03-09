
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/shared/models/entity_arguments.dart';

import 'bloc/person_bloc.dart';
import 'person_list_screen.dart';
import 'person_repository.dart';
import 'person_update_screen.dart';
import 'person_view_screen.dart';

class PersonRoutes {
  static final list = '/entities/person-list';
  static final create = '/entities/person-create';
  static final edit = '/entities/person-edit';
  static final view = '/entities/person-view';

  static const listScreenKey = Key('__personListScreen__');
  static const createScreenKey = Key('__personCreateScreen__');
  static const editScreenKey = Key('__personEditScreen__');
  static const viewScreenKey = Key('__personViewScreen__');

  static final map = <String, WidgetBuilder>{
    list: (context) {
      return BlocProvider<PersonBloc>(
          create: (context) => PersonBloc(personRepository: PersonRepository())
            ..add(InitPersonList()),
          child: PersonListScreen());
    },
    create: (context) {
      return BlocProvider<PersonBloc>(
          create: (context) => PersonBloc(personRepository: PersonRepository()),
          child: PersonUpdateScreen());
    },
    edit: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<PersonBloc>(
          create: (context) => PersonBloc(personRepository: PersonRepository())
            ..add(LoadPersonByIdForEdit(id: arguments.id)),
          child: PersonUpdateScreen());
    },
    view: (context) {
      EntityArguments arguments = ModalRoute.of(context).settings.arguments;
      return BlocProvider<PersonBloc>(
          create: (context) => PersonBloc(personRepository: PersonRepository())
            ..add(LoadPersonByIdForView(id: arguments.id)),
          child: PersonViewScreen());
    },
  };
}
