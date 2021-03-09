import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/job_history/bloc/job_history_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/job_history/job_history_model.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/loading_indicator_widget.dart';
import 'job_history_route.dart';

class JobHistoryViewScreen extends StatelessWidget {
  JobHistoryViewScreen({Key key}) : super(key: JobHistoryRoutes.createScreenKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:Text(S.of(context).pageEntitiesJobHistoryViewTitle),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: BlocBuilder<JobHistoryBloc, JobHistoryState>(
              buildWhen: (previous, current) => previous.loadedJobHistory != current.loadedJobHistory,
              builder: (context, state) {
                return Visibility(
                  visible: state.jobHistoryStatusUI == JobHistoryStatusUI.done,
                  replacement: LoadingIndicator(),
                  child: Column(children: <Widget>[
                    jobHistoryCard(state.loadedJobHistory, context)
                  ]),
                );
              }
            ),
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, JobHistoryRoutes.create),
          child: Icon(Icons.add, color: Theme.of(context).iconTheme.color,),
          backgroundColor: Theme.of(context).primaryColor,
        )
    );
  }

  Widget jobHistoryCard(JobHistory jobHistory, BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Id : ' + jobHistory.id.toString(), style: Theme.of(context).textTheme.bodyText1,),
              Text('Start Date : ' + (jobHistory?.startDate != null ? DateFormat.yMMMMd(S.of(context).locale).format(jobHistory.startDate) : ''), style: Theme.of(context).textTheme.bodyText1,),
              Text('End Date : ' + (jobHistory?.endDate != null ? DateFormat.yMMMMd(S.of(context).locale).format(jobHistory.endDate) : ''), style: Theme.of(context).textTheme.bodyText1,),
                Text('Language : ' + jobHistory.language.toString(), style: Theme.of(context).textTheme.bodyText1,),
          ],
        ),
      ),
    );
  }
}
