import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterfluttersample/entities/employee/bloc/employee_bloc.dart';
import 'package:jhipsterfluttersample/entities/employee/employee_model.dart';
import 'package:jhipsterfluttersample/generated/l10n.dart';
import 'package:jhipsterfluttersample/keys.dart';
import 'package:flutter/material.dart';
import 'package:jhipsterfluttersample/routes.dart';
import 'package:intl/intl.dart';
import 'package:jhipsterfluttersample/shared/widgets/loading_indicator_widget.dart';

class EmployeeViewScreen extends StatelessWidget {
  EmployeeViewScreen({Key key}) : super(key: JhipsterfluttersampleKeys.employeeViewScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:Text(S.of(context).pageEntitiesEmployeeViewTitle),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: BlocBuilder<EmployeeBloc, EmployeeState>(
              buildWhen: (previous, current) => previous.loadedEmployee != current.loadedEmployee,
              builder: (context, state) {
                return Visibility(
                  visible: state.employeeStatusUI == EmployeeStatusUI.done,
                  replacement: LoadingIndicator(),
                  child: Column(children: <Widget>[
                    employeeCard(state.loadedEmployee, context)
                  ]),
                );
              }
            ),
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, JhipsterfluttersampleRoutes.entitiesEmployeeCreate),
          child: Icon(Icons.add, color: Theme.of(context).iconTheme.color,),
          backgroundColor: Theme.of(context).primaryColor,
        )
    );
  }

  Widget employeeCard(Employee employee, BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('id : ' + employee.id.toString(), style: Theme.of(context).textTheme.bodyText1,),
            Text('Lastname : ' + employee.lastName, style: Theme.of(context).textTheme.bodyText1,),
            Text('Firstname : ' + employee.firstName, style: Theme.of(context).textTheme.bodyText1,),
            Text('Hire Date : ' + (employee?.hireDate != null ? DateFormat.yMMMMd(S.of(context).locale).format(employee.hireDate) : ''), style: Theme.of(context).textTheme.bodyText1,),
            Text('Phone Number : ' + employee.phoneNumber, style: Theme.of(context).textTheme.bodyText1,),
            Text('Salary : ' + employee.salary.toString(), style: Theme.of(context).textTheme.bodyText1,),
            Text('CommissionPct : ' + employee.commissionPct.toString(), style: Theme.of(context).textTheme.bodyText1,),
          ],
        ),
      ),
    );
  }
}
