import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterfluttersample/account/login/login_repository.dart';
import 'package:jhipsterfluttersample/entities/employee/bloc/employee_bloc.dart';
import 'package:jhipsterfluttersample/entities/employee/employee_model.dart';
import 'package:jhipsterfluttersample/entities/employee/employee_route.dart';
import 'package:jhipsterfluttersample/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:jhipsterfluttersample/shared/models/entity_argument.dart';
import 'package:jhipsterfluttersample/shared/widgets/drawer/bloc/drawer_bloc.dart';
import 'package:jhipsterfluttersample/shared/widgets/drawer/drawer_widget.dart';
import 'package:jhipsterfluttersample/shared/widgets/loading_indicator_widget.dart';

class EmployeeListScreen extends StatelessWidget {
  EmployeeListScreen({Key key}) : super(key: EmployeeRoutes.listScreenKey);
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmployeeBloc, EmployeeState>(
      listener: (context, state) {
        if(state.deleteStatus == EmployeeDeleteStatus.ok) {
          Navigator.of(context).pop();
          scaffoldKey.currentState.showSnackBar(new SnackBar(
              content: new Text(S.of(context).pageEntitiesEmployeeDeleteOk)
          ));
        }
      },
      child: Scaffold(
          key: scaffoldKey,
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
          onPressed: () => Navigator.pushNamed(context, EmployeeRoutes.create),
          child: Icon(Icons.add, color: Theme.of(context).iconTheme.color,),
          backgroundColor: Theme.of(context).primaryColor,
        )
      ),
    );
  }

  Widget employeeCard(Employee employee, BuildContext context) {
    EmployeeBloc employeeBloc = BlocProvider.of<EmployeeBloc>(context);
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
                  onPressed: () => Navigator.pushNamed(
                      context,
                      EmployeeRoutes.view,
                      arguments: EntityArguments(employee.id)
                  ),
                ),
                FlatButton(
                  child: Text(S.of(context).entityActionEdit),
                  onPressed: () => Navigator.pushNamed(
                      context,
                      EmployeeRoutes.edit,
                      arguments: EntityArguments(employee.id)
                  ),
                ),
                FlatButton(
                  child: Text(S.of(context).entityActionDelete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return deleteDialog(employeeBloc, context, employee.id);
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget deleteDialog(EmployeeBloc employeeBloc, BuildContext context, int id) {
    return BlocProvider<EmployeeBloc>.value(
      value: employeeBloc,
      child: AlertDialog(
        title: new Text(S.of(context).pageEntitiesEmployeeDeletePopupTitle),
        content: new Text(S.of(context).entityActionConfirmDelete),
        actions: <Widget>[
          new FlatButton(
            child: new Text(S.of(context).entityActionConfirmDeleteYes),
            onPressed: () {
              employeeBloc.add(DeleteEmployeeById(id: id));
            },
          ),
          new FlatButton(
            child: new Text(S.of(context).entityActionConfirmDeleteNo),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
