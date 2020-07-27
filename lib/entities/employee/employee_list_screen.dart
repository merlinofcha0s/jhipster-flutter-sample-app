import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterfluttersample/account/login/login_repository.dart';
import 'package:jhipsterfluttersample/entities/employee/bloc/employee_bloc.dart';
import 'package:jhipsterfluttersample/entities/employee/employee_model.dart';
import 'package:jhipsterfluttersample/generated/l10n.dart';
import 'package:jhipsterfluttersample/keys.dart';
import 'package:flutter/material.dart';
import 'package:jhipsterfluttersample/shared/widgets/drawer/bloc/drawer_bloc.dart';
import 'package:jhipsterfluttersample/shared/widgets/drawer/drawer_widget.dart';
import 'package:jhipsterfluttersample/shared/widgets/loading_indicator_widget.dart';

class EmployeeListScreen extends StatelessWidget {
  EmployeeListScreen({Key key}) : super(key: JhipsterfluttersampleKeys.employeeListScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:Text(S.of(context).pageEntitiesEmployeeListTitle),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: BlocBuilder<EmployeeBloc, EmployeeState>(
            buildWhen: (previous, current) => previous.employees != current.employees,
            builder: (context, state) {
              return Visibility(
                visible: state.employeeStatusUI == EmployeeStatusUI.done,
                replacement: LoadingIndicator(),
                child: Column(children: <Widget>[
                  for (Employee employee in state.employees) employeeCard(employee, context)
                ]),
              );
            }
          ),
        ),
      drawer: BlocProvider<DrawerBloc>(
          create: (context) => DrawerBloc(loginRepository: LoginRepository()),
          child: JhipsterfluttersampleDrawer()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        child: Icon(Icons.add, color: Theme.of(context).iconTheme.color,),
        backgroundColor: Theme.of(context).primaryColor,
      )
    );
  }

  Widget employeeCard(Employee employee, BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.turned_in),
              title: Text('Lastname : ${employee.lastName}'),
              subtitle: Text('Firstname : ${employee.firstName}'),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text(S.of(context).entityActionView),
                  onPressed: () {/* ... */},
                ),
                FlatButton(
                  child: Text(S.of(context).entityActionEdit),
                  onPressed: () {/* ... */},
                ),
                FlatButton(
                  child: Text(S.of(context).entityActionDelete),
                  onPressed: () {/* ... */},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
