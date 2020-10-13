import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterfluttersample/entities/employee/employee_route.dart';
import 'package:jhipsterfluttersample/generated/l10n.dart';
import 'package:jhipsterfluttersample/routes.dart';
import 'package:jhipsterfluttersample/shared/widgets/drawer/bloc/drawer_bloc.dart';
import 'package:flutter/material.dart';

class JhipsterfluttersampleDrawer extends StatelessWidget {
   JhipsterfluttersampleDrawer({Key key}) : super(key: key);

   static final double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DrawerBloc, DrawerState>(
      listener: (context, state) {
        if(state.isLogout) {
          Navigator.popUntil(context, ModalRoute.withName(JhipsterfluttersampleRoutes.login));
          Navigator.pushNamed(context, JhipsterfluttersampleRoutes.login);
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
              onTap: () => Navigator.pushNamed(context, JhipsterfluttersampleRoutes.main),
            ),
            ListTile(
              leading: Icon(Icons.settings, size: iconSize,),
              title: Text(S.of(context).drawerSettingsTitle),
              onTap: () => Navigator.pushNamed(context, JhipsterfluttersampleRoutes.settings),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, size: iconSize,),
              title: Text(S.of(context).drawerLogoutTitle),
              onTap: () => context.bloc<DrawerBloc>().add(Logout())
            ),
            Divider(thickness: 2),
            ListTile(
                leading: Icon(Icons.label, size: iconSize,),
                title: Text('Employees'),
                onTap: () => Navigator.pushNamed(context, EmployeeRoutes.list),
            )
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
