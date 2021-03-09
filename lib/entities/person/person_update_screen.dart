import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/person/bloc/person_bloc.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:jhipsterFlutterSampleApp/entities/person/person_model.dart';
import 'person_route.dart';

class PersonUpdateScreen extends StatelessWidget {
  PersonUpdateScreen({Key key}) : super(key: PersonRoutes.editScreenKey);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PersonBloc, PersonState>(
      listener: (context, state) {
        if(state.formStatus.isSubmissionSuccess){
          Navigator.pushNamed(context, PersonRoutes.list);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: BlocBuilder<PersonBloc, PersonState>(
                buildWhen: (previous, current) => previous.editMode != current.editMode,
                builder: (context, state) {
                String title = state.editMode == true ?S.of(context).pageEntitiesPersonUpdateTitle:
S.of(context).pageEntitiesPersonCreateTitle;
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
          firstNameField(),
          lastNameField(),
          emailField(),
          phoneNumberField(),
        validationZone(),
        submit(context)
      ]),
    );
  }

      Widget firstNameField() {
        return BlocBuilder<PersonBloc, PersonState>(
            buildWhen: (previous, current) => previous.firstName != current.firstName,
            builder: (context, state) {
              return TextFormField(
                  controller: context.bloc<PersonBloc>().firstNameController,
                  onChanged: (value) { context.bloc<PersonBloc>()
                    .add(FirstNameChanged(firstName:value)); },
                  keyboardType:TextInputType.text,                  decoration: InputDecoration(
                      labelText:S.of(context).pageEntitiesPersonFirstNameField));
            }
        );
      }
      Widget lastNameField() {
        return BlocBuilder<PersonBloc, PersonState>(
            buildWhen: (previous, current) => previous.lastName != current.lastName,
            builder: (context, state) {
              return TextFormField(
                  controller: context.bloc<PersonBloc>().lastNameController,
                  onChanged: (value) { context.bloc<PersonBloc>()
                    .add(LastNameChanged(lastName:value)); },
                  keyboardType:TextInputType.text,                  decoration: InputDecoration(
                      labelText:S.of(context).pageEntitiesPersonLastNameField));
            }
        );
      }
      Widget emailField() {
        return BlocBuilder<PersonBloc, PersonState>(
            buildWhen: (previous, current) => previous.email != current.email,
            builder: (context, state) {
              return TextFormField(
                  controller: context.bloc<PersonBloc>().emailController,
                  onChanged: (value) { context.bloc<PersonBloc>()
                    .add(EmailChanged(email:value)); },
                  keyboardType:TextInputType.text,                  decoration: InputDecoration(
                      labelText:S.of(context).pageEntitiesPersonEmailField));
            }
        );
      }
      Widget phoneNumberField() {
        return BlocBuilder<PersonBloc, PersonState>(
            buildWhen: (previous, current) => previous.phoneNumber != current.phoneNumber,
            builder: (context, state) {
              return TextFormField(
                  controller: context.bloc<PersonBloc>().phoneNumberController,
                  onChanged: (value) { context.bloc<PersonBloc>()
                    .add(PhoneNumberChanged(phoneNumber:value)); },
                  keyboardType:TextInputType.text,                  decoration: InputDecoration(
                      labelText:S.of(context).pageEntitiesPersonPhoneNumberField));
            }
        );
      }


  Widget validationZone() {
    return BlocBuilder<PersonBloc, PersonState>(
        buildWhen:(previous, current) => previous.formStatus != current.formStatus,
        builder: (context, state) {
          return Visibility(
              visible: state.formStatus.isSubmissionFailure ||  state.formStatus.isSubmissionSuccess,
              child: Center(
                child: generateNotificationText(state, context),
              ));
        });
  }

  Widget generateNotificationText(PersonState state, BuildContext context) {
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
    return BlocBuilder<PersonBloc, PersonState>(
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
            onPressed: state.formStatus.isValidated ? () => context.bloc<PersonBloc>().add(PersonFormSubmitted()) : null,
          );
        }
    );
  }
}
