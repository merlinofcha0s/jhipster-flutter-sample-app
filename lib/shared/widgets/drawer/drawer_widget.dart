import 'package:JhipsterAppSample/generated/l10n.dart';
import 'package:JhipsterAppSample/routes.dart';
import 'package:JhipsterAppSample/shared/bloc/bloc_provider.dart';
import 'package:JhipsterAppSample/shared/widgets/drawer/drawer_bloc.dart';
import 'package:flutter/material.dart';

class JhipsterSampleDrawer extends StatelessWidget {
  JhipsterSampleDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerBloc = BlocProvider.of<JhipsterSampleDrawerBloc>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          header(context),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(S.of(context).drawerSettingsTitle),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(S.of(context).drawerLogoutTitle),
            onTap: () => onSignOut(drawerBloc, context),
          )
        ],
      ),
    );
  }

  onSignOut(JhipsterSampleDrawerBloc drawerBloc, BuildContext context) {
    drawerBloc.changeSignOut(true);
    Navigator.pop(context);
    Navigator.pushNamed(context, JhipsterSampleRoutes.login);
  }

  Widget header(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.teal,
      ),
      child: Text(
        S.of(context).drawerMenuTitle,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }
}
