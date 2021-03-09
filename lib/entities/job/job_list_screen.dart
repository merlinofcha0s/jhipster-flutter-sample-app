import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/account/login/login_repository.dart';
import 'package:jhipsterFlutterSampleApp/entities/job/bloc/job_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/job/job_model.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/drawer/bloc/drawer_bloc.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/drawer/drawer_widget.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/loading_indicator_widget.dart';
import 'package:jhipsterFlutterSampleApp/shared/models/entity_arguments.dart';
import 'job_route.dart';

class JobListScreen extends StatelessWidget {
    JobListScreen({Key key}) : super(key: JobRoutes.listScreenKey);
    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  BlocListener<JobBloc, JobState>(
      listener: (context, state) {
        if(state.deleteStatus == JobDeleteStatus.ok) {
          Navigator.of(context).pop();
          scaffoldKey.currentState.showSnackBar(new SnackBar(
              content: new Text(S.of(context).pageEntitiesJobDeleteOk)
          ));
        }
      },
      child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
    title:Text(S.of(context).pageEntitiesJobListTitle),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: BlocBuilder<JobBloc, JobState>(
              buildWhen: (previous, current) => previous.jobs != current.jobs,
              builder: (context, state) {
                return Visibility(
                  visible: state.jobStatusUI == JobStatusUI.done,
                  replacement: LoadingIndicator(),
                  child: Column(children: <Widget>[
                    for (Job job in state.jobs) jobCard(job, context)
                  ]),
                );
              }
            ),
          ),
        drawer: BlocProvider<DrawerBloc>(
            create: (context) => DrawerBloc(loginRepository: LoginRepository()),
            child: JhipsterFlutterSampleAppDrawer()),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, JobRoutes.create),
          child: Icon(Icons.add, color: Theme.of(context).iconTheme.color,),
          backgroundColor: Theme.of(context).primaryColor,
        )
      ),
    );
  }

  Widget jobCard(Job job, BuildContext context) {
    JobBloc jobBloc = BlocProvider.of<JobBloc>(context);
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
                  title: Text('Job Title : ${job.jobTitle.toString()}'),
                  subtitle: Text('Min Salary : ${job.minSalary.toString()}'),
              trailing: DropdownButton(
                  icon: Icon(Icons.more_vert),
                  onChanged: (String newValue) {
                    switch (newValue) {
                      case "Edit":
                        Navigator.pushNamed(
                            context, JobRoutes.edit,
                            arguments: EntityArguments(job.id));
                        break;
                      case "Delete":
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return deleteDialog(
                              jobBloc, context, job.id);
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
                  context, JobRoutes.view,
                  arguments: EntityArguments(job.id)),
            ),
          ],
        ),
      ),
    );
  }

  Widget deleteDialog(JobBloc jobBloc, BuildContext context, int id) {
    return BlocProvider<JobBloc>.value(
      value: jobBloc,
      child: AlertDialog(
        title: new Text(S.of(context).pageEntitiesJobDeletePopupTitle),
        content: new Text(S.of(context).entityActionConfirmDelete),
        actions: <Widget>[
          new FlatButton(
            child: new Text(S.of(context).entityActionConfirmDeleteYes),
            onPressed: () {
              jobBloc.add(DeleteJobById(id: id));
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
