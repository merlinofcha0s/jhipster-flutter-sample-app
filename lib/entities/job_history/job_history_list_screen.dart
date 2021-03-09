import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/account/login/login_repository.dart';
import 'package:jhipsterFlutterSampleApp/entities/job_history/bloc/job_history_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/job_history/job_history_model.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/drawer/bloc/drawer_bloc.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/drawer/drawer_widget.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/loading_indicator_widget.dart';
import 'package:jhipsterFlutterSampleApp/shared/models/entity_arguments.dart';
import 'job_history_route.dart';

class JobHistoryListScreen extends StatelessWidget {
    JobHistoryListScreen({Key key}) : super(key: JobHistoryRoutes.listScreenKey);
    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  BlocListener<JobHistoryBloc, JobHistoryState>(
      listener: (context, state) {
        if(state.deleteStatus == JobHistoryDeleteStatus.ok) {
          Navigator.of(context).pop();
          scaffoldKey.currentState.showSnackBar(new SnackBar(
              content: new Text(S.of(context).pageEntitiesJobHistoryDeleteOk)
          ));
        }
      },
      child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
    title:Text(S.of(context).pageEntitiesJobHistoryListTitle),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: BlocBuilder<JobHistoryBloc, JobHistoryState>(
              buildWhen: (previous, current) => previous.jobHistories != current.jobHistories,
              builder: (context, state) {
                return Visibility(
                  visible: state.jobHistoryStatusUI == JobHistoryStatusUI.done,
                  replacement: LoadingIndicator(),
                  child: Column(children: <Widget>[
                    for (JobHistory jobHistory in state.jobHistories) jobHistoryCard(jobHistory, context)
                  ]),
                );
              }
            ),
          ),
        drawer: BlocProvider<DrawerBloc>(
            create: (context) => DrawerBloc(loginRepository: LoginRepository()),
            child: JhipsterFlutterSampleAppDrawer()),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, JobHistoryRoutes.create),
          child: Icon(Icons.add, color: Theme.of(context).iconTheme.color,),
          backgroundColor: Theme.of(context).primaryColor,
        )
      ),
    );
  }

  Widget jobHistoryCard(JobHistory jobHistory, BuildContext context) {
    JobHistoryBloc jobHistoryBloc = BlocProvider.of<JobHistoryBloc>(context);
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
                  title: Text('Start Date : ${jobHistory.startDate.toString()}'),
                  subtitle: Text('End Date : ${jobHistory.endDate.toString()}'),
              trailing: DropdownButton(
                  icon: Icon(Icons.more_vert),
                  onChanged: (String newValue) {
                    switch (newValue) {
                      case "Edit":
                        Navigator.pushNamed(
                            context, JobHistoryRoutes.edit,
                            arguments: EntityArguments(jobHistory.id));
                        break;
                      case "Delete":
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return deleteDialog(
                              jobHistoryBloc, context, jobHistory.id);
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
                  context, JobHistoryRoutes.view,
                  arguments: EntityArguments(jobHistory.id)),
            ),
          ],
        ),
      ),
    );
  }

  Widget deleteDialog(JobHistoryBloc jobHistoryBloc, BuildContext context, int id) {
    return BlocProvider<JobHistoryBloc>.value(
      value: jobHistoryBloc,
      child: AlertDialog(
        title: new Text(S.of(context).pageEntitiesJobHistoryDeletePopupTitle),
        content: new Text(S.of(context).entityActionConfirmDelete),
        actions: <Widget>[
          new FlatButton(
            child: new Text(S.of(context).entityActionConfirmDeleteYes),
            onPressed: () {
              jobHistoryBloc.add(DeleteJobHistoryById(id: id));
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
