import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/job/bloc/job_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/job/job_model.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/loading_indicator_widget.dart';
import 'job_route.dart';

class JobViewScreen extends StatelessWidget {
  JobViewScreen({Key key}) : super(key: JobRoutes.createScreenKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:Text(S.of(context).pageEntitiesJobViewTitle),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: BlocBuilder<JobBloc, JobState>(
              buildWhen: (previous, current) => previous.loadedJob != current.loadedJob,
              builder: (context, state) {
                return Visibility(
                  visible: state.jobStatusUI == JobStatusUI.done,
                  replacement: LoadingIndicator(),
                  child: Column(children: <Widget>[
                    jobCard(state.loadedJob, context)
                  ]),
                );
              }
            ),
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, JobRoutes.create),
          child: Icon(Icons.add, color: Theme.of(context).iconTheme.color,),
          backgroundColor: Theme.of(context).primaryColor,
        )
    );
  }

  Widget jobCard(Job job, BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Id : ' + job.id.toString(), style: Theme.of(context).textTheme.bodyText1,),
                Text('Job Title : ' + job.jobTitle.toString(), style: Theme.of(context).textTheme.bodyText1,),
                Text('Min Salary : ' + job.minSalary.toString(), style: Theme.of(context).textTheme.bodyText1,),
                Text('Max Salary : ' + job.maxSalary.toString(), style: Theme.of(context).textTheme.bodyText1,),
          ],
        ),
      ),
    );
  }
}
