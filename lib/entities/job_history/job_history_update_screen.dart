import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/job_history/bloc/job_history_bloc.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:jhipsterFlutterSampleApp/entities/job_history/job_history_model.dart';
import 'job_history_route.dart';

class JobHistoryUpdateScreen extends StatelessWidget {
  JobHistoryUpdateScreen({Key key}) : super(key: JobHistoryRoutes.editScreenKey);

  @override
  Widget build(BuildContext context) {
    return BlocListener<JobHistoryBloc, JobHistoryState>(
      listener: (context, state) {
        if(state.formStatus.isSubmissionSuccess){
          Navigator.pushNamed(context, JobHistoryRoutes.list);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: BlocBuilder<JobHistoryBloc, JobHistoryState>(
                buildWhen: (previous, current) => previous.editMode != current.editMode,
                builder: (context, state) {
                String title = state.editMode == true ?S.of(context).pageEntitiesJobHistoryUpdateTitle:
S.of(context).pageEntitiesJobHistoryCreateTitle;
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
          startDateField(),
          endDateField(),
          languageField(),
        validationZone(),
        submit(context)
      ]),
    );
  }

      Widget startDateField() {
        return BlocBuilder<JobHistoryBloc, JobHistoryState>(
            buildWhen: (previous, current) => previous.startDate != current.startDate,
            builder: (context, state) {
              return DateTimeField(
                controller: context.bloc<JobHistoryBloc>().startDateController,
                onChanged: (value) { context.bloc<JobHistoryBloc>().add(StartDateChanged(startDate: value)); },
                format: DateFormat.yMMMMd(S.of(context).locale),
                keyboardType: TextInputType.datetime,
            decoration: InputDecoration(labelText:S.of(context).pageEntitiesJobHistoryStartDateField,),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      locale: Locale(S.of(context).locale),
                      context: context,
                      firstDate: DateTime(1950),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2050));
                },
              );
            }
        );
      }
      Widget endDateField() {
        return BlocBuilder<JobHistoryBloc, JobHistoryState>(
            buildWhen: (previous, current) => previous.endDate != current.endDate,
            builder: (context, state) {
              return DateTimeField(
                controller: context.bloc<JobHistoryBloc>().endDateController,
                onChanged: (value) { context.bloc<JobHistoryBloc>().add(EndDateChanged(endDate: value)); },
                format: DateFormat.yMMMMd(S.of(context).locale),
                keyboardType: TextInputType.datetime,
            decoration: InputDecoration(labelText:S.of(context).pageEntitiesJobHistoryEndDateField,),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      locale: Locale(S.of(context).locale),
                      context: context,
                      firstDate: DateTime(1950),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2050));
                },
              );
            }
        );
      }
      Widget languageField() {
        return BlocBuilder<JobHistoryBloc,JobHistoryState>(
            buildWhen: (previous, current) => previous.language != current.language,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(S.of(context).pageEntitiesJobHistoryLanguageField, style: Theme.of(context).textTheme.bodyText1,),
                    DropdownButton<Language>(
                        value: state.language.value,
                        onChanged: (value) { context.bloc<JobHistoryBloc>().add(LanguageChanged(language: value)); },
                        items: createDropdownLanguageItems(Language.values)),
                  ],
                ),
              );
            });
      }

      List<DropdownMenuItem<Language>> createDropdownLanguageItems(List<Language> languages) {
        List<DropdownMenuItem<Language>> languageDropDown = [];
    
        for (Language language in languages) {
          DropdownMenuItem<Language> dropdown = DropdownMenuItem<Language>(
              value: language, child: Text(language.toString()));
              languageDropDown.add(dropdown);
        }
    
        return languageDropDown;
      }

  Widget validationZone() {
    return BlocBuilder<JobHistoryBloc, JobHistoryState>(
        buildWhen:(previous, current) => previous.formStatus != current.formStatus,
        builder: (context, state) {
          return Visibility(
              visible: state.formStatus.isSubmissionFailure ||  state.formStatus.isSubmissionSuccess,
              child: Center(
                child: generateNotificationText(state, context),
              ));
        });
  }

  Widget generateNotificationText(JobHistoryState state, BuildContext context) {
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
    return BlocBuilder<JobHistoryBloc, JobHistoryState>(
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
            onPressed: state.formStatus.isValidated ? () => context.bloc<JobHistoryBloc>().add(JobHistoryFormSubmitted()) : null,
          );
        }
    );
  }
}
