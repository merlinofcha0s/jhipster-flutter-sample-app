import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterfluttersample/account/settings/bloc/settings_bloc.dart';
import 'package:jhipsterfluttersample/environment.dart';
import 'package:jhipsterfluttersample/generated/l10n.dart';
import 'package:jhipsterfluttersample/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jhipsterfluttersample/routes.dart';
import 'package:jhipsterfluttersample/shared/repository/http_utils.dart';
import 'package:formz/formz.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen() : super(key: JhipsterfluttersampleKeys.settingsScreen);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if(state.action == SettingsAction.reloadForLanguage) {
          Navigator.popAndPushNamed(context, JhipsterfluttersampleRoutes.main);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(S.of(context).pageSettingsTitle),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: <Widget>[settingsForm(context)]),
          )
          //drawer: BlocProviderLegacy<JhipsterfluttersampleDrawerBloc>(bloc: JhipsterfluttersampleDrawerBloc() ,child: JhipsterfluttersampleDrawer())
      ),
    );
  }

  Widget settingsForm(BuildContext context) {
          return Form(
            child: Wrap(runSpacing: 15, children: <Widget>[
              firstnameField(),
              lastnameNameField(),
              emailField(),
              languageField(),
              notificationZone(),
              submit(context)
            ]),
          );
  }

  Widget firstnameField() {
    return BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (previous, current) => previous.firstname != current.firstname,
        builder: (context, state) {
          return TextFormField(
              controller: context.bloc<SettingsBloc>().firstNameController,
              onChanged: (value) { context.bloc<SettingsBloc>().add(FirstnameChanged(firstname: value)); },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: S.of(context).pageSettingsFormFirstname,
                  errorText: state.firstname.invalid ? 'Invalid Firstname' : null));
        }
    );
  }

  Widget lastnameNameField() {
    return BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (previous, current) => previous.lastname != current.lastname,
        builder: (context, state) {
          return TextFormField(
              controller: context.bloc<SettingsBloc>().lastNameController,
              onChanged: (value) { context.bloc<SettingsBloc>().add(LastnameChanged(lastname: value)); },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: S.of(context).pageSettingsFormLastname,
                  errorText: state.lastname.invalid ? 'Invalid Lastname' : null));
        }
    );
  }

  Widget emailField() {
    return BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextFormField(
              controller: context.bloc<SettingsBloc>().emailController,
              onChanged: (value) { context.bloc<SettingsBloc>().add(EmailChanged(email: value)); },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: S.of(context).pageSettingsFormEmail,
                  errorText: state.email.invalid ? 'Invalid Email' : null));
        }
    );
  }

  Widget languageField() {
    return BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (previous, current) => previous.language != current.language,
        builder: (context, state) {
           return Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(S.of(context).pageSettingsFormLanguages, style: Theme.of(context).textTheme.bodyText1,),
                DropdownButton<String>(
                    value: state.language,
                    onChanged: (value) { context.bloc<SettingsBloc>().add(LanguageChanged(language: value)); },
                    items: createDropdownLanguageItems(Constants.languages)),
              ],
            ),
          );
        });
  }

  List<DropdownMenuItem<String>> createDropdownLanguageItems(Map<String, String> languages) {
    return languages.keys.map<DropdownMenuItem<String>>((String key) =>
            DropdownMenuItem<String>(value: key, child: Text(languages[key])))
        .toList();
  }

  submit(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (previous, current) => previous.formStatus != current.formStatus,
        builder: (context, state) {
        return RaisedButton(
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Visibility(
                  replacement: CircularProgressIndicator(value: null),
                  visible: !state.formStatus.isSubmissionInProgress,
                  child: Text(S.of(context).pageSettingsFormSave.toUpperCase()),
                ),
              )),
          onPressed: state.formStatus.isValidated ? () => context.bloc<SettingsBloc>().add(FormSubmitted()) : null,
        );
      }
    );
  }

  Widget notificationZone() {
    return BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (previous, current) => previous.formStatus != current.formStatus,
        builder: (context, state) {
          return Visibility(
              visible: state.formStatus.isSubmissionFailure,
              child: Center(
                child: generateNotificationText(state, context),
              ));
        });
  }

  Widget generateNotificationText(SettingsState state, BuildContext context) {
    String notificationTranslated = '';
    MaterialColor notificationColors;
    if(state.generalErrorKey.compareTo(SettingsBloc.successKey) == 0) {
      notificationTranslated = S.of(context).pageSettingsSave;
      notificationColors = Theme.of(context).primaryColor;
    } else if(state.generalErrorKey.compareTo(HttpUtils.errorServerKey) == 0) {
      notificationTranslated = S.of(context).genericErrorBadRequest;
      notificationColors = Theme.of(context).errorColor;
    } else if (state.generalErrorKey.compareTo(HttpUtils.errorServerKey) == 0) {
      notificationTranslated = S.of(context).genericErrorServer;
      notificationColors = Theme.of(context).errorColor;
    }

    return Text(
      notificationTranslated,
      style: TextStyle(color: notificationColors),
    );
  }
}
