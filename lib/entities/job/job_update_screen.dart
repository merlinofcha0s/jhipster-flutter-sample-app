import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/job/bloc/job_bloc.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:jhipsterFlutterSampleApp/entities/job/job_model.dart';
import 'job_route.dart';

class JobUpdateScreen extends StatelessWidget {
  JobUpdateScreen({Key key}) : super(key: JobRoutes.editScreenKey);

  @override
  Widget build(BuildContext context) {
    return BlocListener<JobBloc, JobState>(
      listener: (context, state) {
        if(state.formStatus.isSubmissionSuccess){
          Navigator.pushNamed(context, JobRoutes.list);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: BlocBuilder<JobBloc, JobState>(
                buildWhen: (previous, current) => previous.editMode != current.editMode,
                builder: (context, state) {
                String title = state.editMode == true ?S.of(context).pageEntitiesJobUpdateTitle:
S.of(context).pageEntitiesJobCreateTitle;
                 return Text(title);
                }
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: <Widget>[settingsForm(context)]),
          ),
      ),
    );
  }

  Widget settingsForm(BuildContext context) {
    return Form(
      child: Wrap(runSpacing: 15, children: <Widget>[
          jobTitleField(),
          minSalaryField(),
          maxSalaryField(),
        validationZone(),
        submit(context)
      ]),
    );
  }

      Widget jobTitleField() {
        return BlocBuilder<JobBloc, JobState>(
            buildWhen: (previous, current) => previous.jobTitle != current.jobTitle,
            builder: (context, state) {
              return TextFormField(
                  controller: context.bloc<JobBloc>().jobTitleController,
                  onChanged: (value) { context.bloc<JobBloc>()
                    .add(JobTitleChanged(jobTitle:value)); },
                  keyboardType:TextInputType.text,                  decoration: InputDecoration(
                      labelText:S.of(context).pageEntitiesJobJobTitleField));
            }
        );
      }
      Widget minSalaryField() {
        return BlocBuilder<JobBloc, JobState>(
            buildWhen: (previous, current) => previous.minSalary != current.minSalary,
            builder: (context, state) {
              return TextFormField(
                  controller: context.bloc<JobBloc>().minSalaryController,
                  onChanged: (value) { context.bloc<JobBloc>()
                    .add(MinSalaryChanged(minSalary:int.parse(value))); },
                  keyboardType:TextInputType.number,                  decoration: InputDecoration(
                      labelText:S.of(context).pageEntitiesJobMinSalaryField));
            }
        );
      }
      Widget maxSalaryField() {
        return BlocBuilder<JobBloc, JobState>(
            buildWhen: (previous, current) => previous.maxSalary != current.maxSalary,
            builder: (context, state) {
              return TextFormField(
                  controller: context.bloc<JobBloc>().maxSalaryController,
                  onChanged: (value) { context.bloc<JobBloc>()
                    .add(MaxSalaryChanged(maxSalary:int.parse(value))); },
                  keyboardType:TextInputType.number,                  decoration: InputDecoration(
                      labelText:S.of(context).pageEntitiesJobMaxSalaryField));
            }
        );
      }


  Widget validationZone() {
    return BlocBuilder<JobBloc, JobState>(
        buildWhen:(previous, current) => previous.formStatus != current.formStatus,
        builder: (context, state) {
          return Visibility(
              visible: state.formStatus.isSubmissionFailure ||  state.formStatus.isSubmissionSuccess,
              child: Center(
                child: generateNotificationText(state, context),
              ));
        });
  }

  Widget generateNotificationText(JobState state, BuildContext context) {
    String notificationTranslated = '';
    MaterialColor notificationColors;

    if (state.generalNotificationKey.toString().compareTo(HttpUtils.errorServerKey) == 0) {
      notificationTranslated =S.of(context).genericErrorServer;
      notificationColors = Theme.of(context).errorColor;
    } else if (state.generalNotificationKey.toString().compareTo(HttpUtils.badRequestServerKey) == 0) {
      notificationTranslated =S.of(context).genericErrorBadRequest;
      notificationColors = Theme.of(context).errorColor;
    }

    return Text(
      notificationTranslated,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
          color: notificationColors),
    );
  }

  submit(BuildContext context) {
    return BlocBuilder<JobBloc, JobState>(
        buildWhen: (previous, current) => previous.formStatus != current.formStatus,
        builder: (context, state) {
          String buttonLabel = state.editMode == true ?
S.of(context).entityActionEdit.toUpperCase():
S.of(context).entityActionCreate.toUpperCase();
          return RaisedButton(
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Visibility(
                    replacement: CircularProgressIndicator(value: null),
                    visible: !state.formStatus.isSubmissionInProgress,
                    child: Text(buttonLabel),
                  ),
                )),
            onPressed: state.formStatus.isValidated ? () => context.bloc<JobBloc>().add(JobFormSubmitted()) : null,
          );
        }
    );
  }
}
