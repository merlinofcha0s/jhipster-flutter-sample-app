import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:jhipsterFlutterSampleApp/routes.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/drawer/bloc/drawer_bloc.dart';
import 'package:flutter/material.dart';

import 'package:jhipsterFlutterSampleApp/entities/country/country_route.dart';
import 'package:jhipsterFlutterSampleApp/entities/department/department_route.dart';
import 'package:jhipsterFlutterSampleApp/entities/employee/employee_route.dart';
import 'package:jhipsterFlutterSampleApp/entities/job/job_route.dart';
import 'package:jhipsterFlutterSampleApp/entities/job_history/job_history_route.dart';
import 'package:jhipsterFlutterSampleApp/entities/location/location_route.dart';
import 'package:jhipsterFlutterSampleApp/entities/person/person_route.dart';
import 'package:jhipsterFlutterSampleApp/entities/region/region_route.dart';
import 'package:jhipsterFlutterSampleApp/entities/task/task_route.dart';
// jhipster-merlin-needle-menu-import-entry-add

class JhipsterFlutterSampleAppDrawer extends StatelessWidget {
   JhipsterFlutterSampleAppDrawer({Key key}) : super(key: key);

   static final double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DrawerBloc, DrawerState>(
      listener: (context, state) {
        if(state.isLogout) {
          Navigator.popUntil(context, ModalRoute.withName(JhipsterFlutterSampleAppRoutes.login));
          Navigator.pushNamed(context, JhipsterFlutterSampleAppRoutes.login);
        }
      },
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            header(context),
            ListTile(
              leading: Icon(Icons.home, size: iconSize,),
              title: Text(S.of(context).drawerMenuMain),
              onTap: () => Navigator.pushNamed(context, JhipsterFlutterSampleAppRoutes.main),
            ),
            ListTile(
              leading: Icon(Icons.settings, size: iconSize,),
              title: Text(S.of(context).drawerSettingsTitle),
              onTap: () => Navigator.pushNamed(context, JhipsterFlutterSampleAppRoutes.settings),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, size: iconSize,),
          title: Text(S.of(context).drawerLogoutTitle),
              onTap: () => context.bloc<DrawerBloc>().add(Logout())
            ),
            Divider(thickness: 2),
            ListTile(
                leading: Icon(Icons.label, size: iconSize,),
                title: Text('Countries'),
                onTap: () => Navigator.pushNamed(context, CountryRoutes.list),
            ),
            ListTile(
                leading: Icon(Icons.label, size: iconSize,),
                title: Text('Departments'),
                onTap: () => Navigator.pushNamed(context, DepartmentRoutes.list),
            ),
            ListTile(
                leading: Icon(Icons.label, size: iconSize,),
                title: Text('Employees'),
                onTap: () => Navigator.pushNamed(context, EmployeeRoutes.list),
            ),
            ListTile(
                leading: Icon(Icons.label, size: iconSize,),
                title: Text('Jobs'),
                onTap: () => Navigator.pushNamed(context, JobRoutes.list),
            ),
            ListTile(
                leading: Icon(Icons.label, size: iconSize,),
                title: Text('JobHistories'),
                onTap: () => Navigator.pushNamed(context, JobHistoryRoutes.list),
            ),
            ListTile(
                leading: Icon(Icons.label, size: iconSize,),
                title: Text('Locations'),
                onTap: () => Navigator.pushNamed(context, LocationRoutes.list),
            ),
            ListTile(
                leading: Icon(Icons.label, size: iconSize,),
                title: Text('People'),
                onTap: () => Navigator.pushNamed(context, PersonRoutes.list),
            ),
            ListTile(
                leading: Icon(Icons.label, size: iconSize,),
                title: Text('Regions'),
                onTap: () => Navigator.pushNamed(context, RegionRoutes.list),
            ),
            ListTile(
                leading: Icon(Icons.label, size: iconSize,),
                title: Text('Tasks'),
                onTap: () => Navigator.pushNamed(context, TaskRoutes.list),
            ),
            // jhipster-merlin-needle-menu-entry-add
          ],
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Text(S.of(context).drawerMenuTitle,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
