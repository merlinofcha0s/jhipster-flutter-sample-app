import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/account/login/login_repository.dart';
import 'package:jhipsterFlutterSampleApp/entities/task/bloc/task_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/task/task_model.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/drawer/bloc/drawer_bloc.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/drawer/drawer_widget.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/loading_indicator_widget.dart';
import 'package:jhipsterFlutterSampleApp/shared/models/entity_arguments.dart';
import 'task_route.dart';

class TaskListScreen extends StatelessWidget {
    TaskListScreen({Key key}) : super(key: TaskRoutes.listScreenKey);
    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  BlocListener<TaskBloc, TaskState>(
      listener: (context, state) {
        if(state.deleteStatus == TaskDeleteStatus.ok) {
          Navigator.of(context).pop();
          scaffoldKey.currentState.showSnackBar(new SnackBar(
              content: new Text(S.of(context).pageEntitiesTaskDeleteOk)
          ));
        }
      },
      child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
    title:Text(S.of(context).pageEntitiesTaskListTitle),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: BlocBuilder<TaskBloc, TaskState>(
              buildWhen: (previous, current) => previous.tasks != current.tasks,
              builder: (context, state) {
                return Visibility(
                  visible: state.taskStatusUI == TaskStatusUI.done,
                  replacement: LoadingIndicator(),
                  child: Column(children: <Widget>[
                    for (Task task in state.tasks) taskCard(task, context)
                  ]),
                );
              }
            ),
          ),
        drawer: BlocProvider<DrawerBloc>(
            create: (context) => DrawerBloc(loginRepository: LoginRepository()),
            child: JhipsterFlutterSampleAppDrawer()),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, TaskRoutes.create),
          child: Icon(Icons.add, color: Theme.of(context).iconTheme.color,),
          backgroundColor: Theme.of(context).primaryColor,
        )
      ),
    );
  }

  Widget taskCard(Task task, BuildContext context) {
    TaskBloc taskBloc = BlocProvider.of<TaskBloc>(context);
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 60.0,
                color: Theme.of(context).primaryColor,
              ),
                  title: Text('Title : ${task.title.toString()}'),
                  subtitle: Text('Description : ${task.description.toString()}'),
              trailing: DropdownButton(
                  icon: Icon(Icons.more_vert),
                  onChanged: (String newValue) {
                    switch (newValue) {
                      case "Edit":
                        Navigator.pushNamed(
                            context, TaskRoutes.edit,
                            arguments: EntityArguments(task.id));
                        break;
                      case "Delete":
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return deleteDialog(
                              taskBloc, context, task.id);
                          },
                        );
                    }
                  },
                  items: [
                    DropdownMenuItem<String>(
                      value: 'Edit',
                      child: Text('Edit'),
                    ),
                    DropdownMenuItem<String>(
                        value: 'Delete', child: Text('Delete'))
                  ]),
              selected: false,
              onTap: () => Navigator.pushNamed(
                  context, TaskRoutes.view,
                  arguments: EntityArguments(task.id)),
            ),
          ],
        ),
      ),
    );
  }

  Widget deleteDialog(TaskBloc taskBloc, BuildContext context, int id) {
    return BlocProvider<TaskBloc>.value(
      value: taskBloc,
      child: AlertDialog(
        title: new Text(S.of(context).pageEntitiesTaskDeletePopupTitle),
        content: new Text(S.of(context).entityActionConfirmDelete),
        actions: <Widget>[
          new FlatButton(
            child: new Text(S.of(context).entityActionConfirmDeleteYes),
            onPressed: () {
              taskBloc.add(DeleteTaskById(id: id));
            },
          ),
          new FlatButton(
            child: new Text(S.of(context).entityActionConfirmDeleteNo),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

}
