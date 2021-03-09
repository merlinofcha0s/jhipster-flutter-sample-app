import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/task/bloc/task_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/task/task_model.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/loading_indicator_widget.dart';
import 'task_route.dart';

class TaskViewScreen extends StatelessWidget {
  TaskViewScreen({Key key}) : super(key: TaskRoutes.createScreenKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:Text(S.of(context).pageEntitiesTaskViewTitle),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: BlocBuilder<TaskBloc, TaskState>(
              buildWhen: (previous, current) => previous.loadedTask != current.loadedTask,
              builder: (context, state) {
                return Visibility(
                  visible: state.taskStatusUI == TaskStatusUI.done,
                  replacement: LoadingIndicator(),
                  child: Column(children: <Widget>[
                    taskCard(state.loadedTask, context)
                  ]),
                );
              }
            ),
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, TaskRoutes.create),
          child: Icon(Icons.add, color: Theme.of(context).iconTheme.color,),
          backgroundColor: Theme.of(context).primaryColor,
        )
    );
  }

  Widget taskCard(Task task, BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Id : ' + task.id.toString(), style: Theme.of(context).textTheme.bodyText1,),
                Text('Title : ' + task.title.toString(), style: Theme.of(context).textTheme.bodyText1,),
                Text('Description : ' + task.description.toString(), style: Theme.of(context).textTheme.bodyText1,),
          ],
        ),
      ),
    );
  }
}
