import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterfluttersample/entities/employee/bloc/employee_bloc.dart';
import 'package:jhipsterfluttersample/entities/employee/employee_model.dart';
import 'package:jhipsterfluttersample/generated/l10n.dart';
import 'package:jhipsterfluttersample/keys.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:jhipsterfluttersample/routes.dart';
import 'package:jhipsterfluttersample/shared/repository/http_utils.dart';

class EmployeeUpdateScreen extends StatelessWidget {
  EmployeeUpdateScreen({Key key}) : super(key: JhipsterfluttersampleKeys.employeeCreateScreen);

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmployeeBloc, EmployeeState>(
      listener: (context, state) {
        if(state.formStatus.isSubmissionSuccess){
          Navigator.pushNamed(context, JhipsterfluttersampleRoutes.entitiesEmployeeList);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: BlocBuilder<EmployeeBloc, EmployeeState>(
                buildWhen: (previous, current) => previous.editMode != current.editMode,
                builder: (context, state) {
                  String title = state.editMode == true ? S.of(context).pageEntitiesEmployeeUpdateTitle :
                  S.of(context).pageEntitiesEmployeeCreateTitle;
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
        firstnameField(),
        lastnameNameField(),
        emailField(),
        phoneNumberField(),
        hireDateField(),
        salaryField(),
        commissionField(),
        languageField(),
        rightField(),
        validationZone(),
        submit(context)
      ]),
    );
  }


  Widget firstnameField() {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
        buildWhen: (previous, current) => previous.firstname != current.firstname,
        builder: (context, state) {
          return TextFormField(
              controller: context.bloc<EmployeeBloc>().firstNameController,
              onChanged: (value) { context.bloc<EmployeeBloc>().add(FirstnameChanged(firstname: value)); },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: S.of(context).pageEntitiesEmployeeFirstnameField));
        }
    );
  }

  Widget lastnameNameField() {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
        buildWhen: (previous, current) => previous.lastname != current.lastname,
        builder: (context, state) {
          return TextFormField(
              controller: context.bloc<EmployeeBloc>().lastNameController,
              onChanged: (value) { context.bloc<EmployeeBloc>().add(LastnameChanged(lastname: value)); },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: S.of(context).pageEntitiesEmployeeLastnameField,));
        }
    );
  }

  Widget emailField() {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextFormField(
              controller: context.bloc<EmployeeBloc>().emailController,
              onChanged: (value) { context.bloc<EmployeeBloc>().add(EmailChanged(email: value)); },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: S.of(context).pageEntitiesEmployeeEmailField,));
        }
    );
  }

  Widget phoneNumberField() {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
        buildWhen: (previous, current) => previous.phoneNumber != current.phoneNumber,
        builder: (context, state) {
          return TextFormField(
              controller: context.bloc<EmployeeBloc>().phoneNumberController,
          onChanged: (value) { context.bloc<EmployeeBloc>().add(PhoneNumberChanged(phoneNumber: value)); },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
          labelText: S.of(context).pageEntitiesEmployeePhoneNumberField,));
        }
    );
  }

  Widget hireDateField() {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
        buildWhen: (previous, current) => previous.hireDate != current.hireDate,
        builder: (context, state) {
          return DateTimeField(
            controller: context.bloc<EmployeeBloc>().hireDateController,
            onChanged: (value) { context.bloc<EmployeeBloc>().add(HireDateChanged(hireDate: value)); },
            format: DateFormat.yMMMMd(S.of(context).locale),
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(labelText: S.of(context).pageEntitiesEmployeeHireDateField,),
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

  Widget salaryField() {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
        buildWhen: (previous, current) => previous.salary != current.salary,
        builder: (context, state) {
          return TextFormField(
              controller: context.bloc<EmployeeBloc>().salaryController,
              onChanged: (value) { context.bloc<EmployeeBloc>().add(SalaryChanged(salary: int.parse(value))); },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: S.of(context).pageEntitiesEmployeeSalaryField,));
        }
    );
  }

  Widget commissionField() {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
        buildWhen: (previous, current) => previous.commissionPct != current.commissionPct,
        builder: (context, state) {
          return TextFormField(
              controller: context.bloc<EmployeeBloc>().commissionController,
              onChanged: (value) { context.bloc<EmployeeBloc>().add(CommissionPctChanged(commissionPct: int.parse(value))); },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: S.of(context).pageEntitiesEmployeeCommissionField,));
        }
    );
  }

  Widget languageField() {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
        buildWhen: (previous, current) => previous.language != current.language,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(S.of(context).pageEntitiesEmployeeLanguageField, style: Theme.of(context).textTheme.bodyText1,),
                DropdownButton<Language>(
                    value: state.language.value,
                    onChanged: (value) { context.bloc<EmployeeBloc>().add(LanguageChanged(language: value)); },
                    items: createDropdownLanguageItems(Language.values)),
              ],
            ),
          );
        });
  }


  List<DropdownMenuItem<Language>> createDropdownLanguageItems(List<Language> languages) {
    List<DropdownMenuItem<Language>> languageDropDown = [];

    for (Language language in languages) {
      DropdownMenuItem<Language> drop = DropdownMenuItem<Language>(
          value: language, child: Text(language.toString()));
      languageDropDown.add(drop);
    }

    return languageDropDown;
  }

  Widget rightField() {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
        buildWhen: (previous, current) => previous.isRight != current.isRight,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(S.of(context).pageEntitiesEmployeeRightField, style: Theme.of(context).textTheme.bodyText1,),
                Switch(
                    value: state.isRight.value,
                    onChanged: (value) { context.bloc<EmployeeBloc>().add(RightChanged(right: value)); },
                  activeColor: Theme.of(context).primaryColor,
                )
              ],
            ),
          );
        });
  }

  Widget validationZone() {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
        buildWhen:(previous, current) => previous.formStatus != current.formStatus,
        builder: (context, state) {
          return Visibility(
              visible: state.formStatus.isSubmissionFailure ||  state.formStatus.isSubmissionSuccess,
              child: Center(
                child: generateNotificationText(state, context),
              ));
        });
  }

  Widget generateNotificationText(EmployeeState state, BuildContext context) {
    String notificationTranslated = '';
    MaterialColor notificationColors;

    if (state.generalNotificationKey.toString().compareTo(HttpUtils.errorServerKey) == 0) {
      notificationTranslated = S.of(context).genericErrorServer;
      notificationColors = Theme.of(context).errorColor;
    } else if (state.generalNotificationKey.toString().compareTo(HttpUtils.badRequestServerKey) == 0) {
      notificationTranslated = S.of(context).genericErrorBadRequest;
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
    return BlocBuilder<EmployeeBloc, EmployeeState>(
        buildWhen: (previous, current) => previous.formStatus != current.formStatus,
        builder: (context, state) {
          String buttonLabel = state.editMode == true ?
          S.of(context).entityActionEdit.toUpperCase() :
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
            onPressed: state.formStatus.isValidated ? () => context.bloc<EmployeeBloc>().add(EmployeeFormSubmitted()) : null,
          );
        }
    );
  }
}
