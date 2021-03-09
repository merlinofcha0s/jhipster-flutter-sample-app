import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/account/login/login_repository.dart';
import 'package:jhipsterFlutterSampleApp/entities/country/bloc/country_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/country/country_model.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/drawer/bloc/drawer_bloc.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/drawer/drawer_widget.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/loading_indicator_widget.dart';
import 'package:jhipsterFlutterSampleApp/shared/models/entity_arguments.dart';
import 'country_route.dart';

class CountryListScreen extends StatelessWidget {
    CountryListScreen({Key key}) : super(key: CountryRoutes.listScreenKey);
    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  BlocListener<CountryBloc, CountryState>(
      listener: (context, state) {
        if(state.deleteStatus == CountryDeleteStatus.ok) {
          Navigator.of(context).pop();
          scaffoldKey.currentState.showSnackBar(new SnackBar(
              content: new Text(S.of(context).pageEntitiesCountryDeleteOk)
          ));
        }
      },
      child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
    title:Text(S.of(context).pageEntitiesCountryListTitle),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: BlocBuilder<CountryBloc, CountryState>(
              buildWhen: (previous, current) => previous.countries != current.countries,
              builder: (context, state) {
                return Visibility(
                  visible: state.countryStatusUI == CountryStatusUI.done,
                  replacement: LoadingIndicator(),
                  child: Column(children: <Widget>[
                    for (Country country in state.countries) countryCard(country, context)
                  ]),
                );
              }
            ),
          ),
        drawer: BlocProvider<DrawerBloc>(
            create: (context) => DrawerBloc(loginRepository: LoginRepository()),
            child: JhipsterFlutterSampleAppDrawer()),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, CountryRoutes.create),
          child: Icon(Icons.add, color: Theme.of(context).iconTheme.color,),
          backgroundColor: Theme.of(context).primaryColor,
        )
      ),
    );
  }

  Widget countryCard(Country country, BuildContext context) {
    CountryBloc countryBloc = BlocProvider.of<CountryBloc>(context);
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 60.0,
                color: Theme.of(context).primaryColor,
              ),
                  title: Text('Country Name : ${country.countryName.toString()}'),
              trailing: DropdownButton(
                  icon: Icon(Icons.more_vert),
                  onChanged: (String newValue) {
                    switch (newValue) {
                      case "Edit":
                        Navigator.pushNamed(
                            context, CountryRoutes.edit,
                            arguments: EntityArguments(country.id));
                        break;
                      case "Delete":
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return deleteDialog(
                              countryBloc, context, country.id);
                          },
                        );
                    }
                  },
                  items: [
                    DropdownMenuItem<String>(
                      value: 'Edit',
                      child: Text('Edit'),
                    ),
                    DropdownMenuItem<String>(
                        value: 'Delete', child: Text('Delete'))
                  ]),
              selected: false,
              onTap: () => Navigator.pushNamed(
                  context, CountryRoutes.view,
                  arguments: EntityArguments(country.id)),
            ),
          ],
        ),
      ),
    );
  }

  Widget deleteDialog(CountryBloc countryBloc, BuildContext context, int id) {
    return BlocProvider<CountryBloc>.value(
      value: countryBloc,
      child: AlertDialog(
        title: new Text(S.of(context).pageEntitiesCountryDeletePopupTitle),
        content: new Text(S.of(context).entityActionConfirmDelete),
        actions: <Widget>[
          new FlatButton(
            child: new Text(S.of(context).entityActionConfirmDeleteYes),
            onPressed: () {
              countryBloc.add(DeleteCountryById(id: id));
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
