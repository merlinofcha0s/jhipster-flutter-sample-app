import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/location/bloc/location_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/location/location_model.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/loading_indicator_widget.dart';
import 'location_route.dart';

class LocationViewScreen extends StatelessWidget {
  LocationViewScreen({Key key}) : super(key: LocationRoutes.createScreenKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:Text(S.of(context).pageEntitiesLocationViewTitle),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: BlocBuilder<LocationBloc, LocationState>(
              buildWhen: (previous, current) => previous.loadedLocation != current.loadedLocation,
              builder: (context, state) {
                return Visibility(
                  visible: state.locationStatusUI == LocationStatusUI.done,
                  replacement: LoadingIndicator(),
                  child: Column(children: <Widget>[
                    locationCard(state.loadedLocation, context)
                  ]),
                );
              }
            ),
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, LocationRoutes.create),
          child: Icon(Icons.add, color: Theme.of(context).iconTheme.color,),
          backgroundColor: Theme.of(context).primaryColor,
        )
    );
  }

  Widget locationCard(Location location, BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Id : ' + location.id.toString(), style: Theme.of(context).textTheme.bodyText1,),
                Text('Street Address : ' + location.streetAddress.toString(), style: Theme.of(context).textTheme.bodyText1,),
                Text('Postal Code : ' + location.postalCode.toString(), style: Theme.of(context).textTheme.bodyText1,),
                Text('City : ' + location.city.toString(), style: Theme.of(context).textTheme.bodyText1,),
                Text('State Province : ' + location.stateProvince.toString(), style: Theme.of(context).textTheme.bodyText1,),
          ],
        ),
      ),
    );
  }
}
