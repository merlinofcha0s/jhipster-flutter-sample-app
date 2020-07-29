import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterfluttersample/entities/employee/bloc/employee_bloc.dart';
import 'package:jhipsterfluttersample/generated/l10n.dart';
import 'package:jhipsterfluttersample/keys.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class EmployeeUpdateScreen extends StatelessWidget {
  EmployeeUpdateScreen({Key key}) : super(key: JhipsterfluttersampleKeys.employeeCreateScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:Text(S.of(context).pageEntitiesEmployeeUpdateTitle),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: <Widget>[settingsForm(context)]),
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
          return TextFormField(
              controller: context.bloc<EmployeeBloc>().hireDateController,
              onChanged: (value) { context.bloc<EmployeeBloc>().add(HireDateChanged(hireDate: value)); },
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: S.of(context).pageEntitiesEmployeeHireDateField,));
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
        buildWhen: (previous, current) => previous.commission != current.commission,
        builder: (context, state) {
          return TextFormField(
              controller: context.bloc<EmployeeBloc>().commissionController,
              onChanged: (value) { context.bloc<EmployeeBloc>().add(CommissionChanged(commission: int.parse(value))); },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: S.of(context).pageEntitiesEmployeeCommissionField,));
        }
    );
  }

  submit(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
        buildWhen: (previous, current) => previous.formStatus != current.formStatus,
        builder: (context, state) {
          return RaisedButton(
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Visibility(
                    replacement: CircularProgressIndicator(value: null),
                    visible: !state.formStatus.isSubmissionInProgress,
                    child: Text(S.of(context).pageEntitiesEmployeeSubmitCreate.toUpperCase()),
                  ),
                )),
            onPressed: state.formStatus.isValidated ? () => context.bloc<EmployeeBloc>().add(EmployeeFormCreateSubmitted()) : null,
          );
        }
    );
  }
}
