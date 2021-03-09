import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/location/bloc/location_bloc.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:jhipsterFlutterSampleApp/entities/location/location_model.dart';
import 'location_route.dart';

class LocationUpdateScreen extends StatelessWidget {
  LocationUpdateScreen({Key key}) : super(key: LocationRoutes.editScreenKey);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationBloc, LocationState>(
      listener: (context, state) {
        if(state.formStatus.isSubmissionSuccess){
          Navigator.pushNamed(context, LocationRoutes.list);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: BlocBuilder<LocationBloc, LocationState>(
                buildWhen: (previous, current) => previous.editMode != current.editMode,
                builder: (context, state) {
                String title = state.editMode == true ?S.of(context).pageEntitiesLocationUpdateTitle:
S.of(context).pageEntitiesLocationCreateTitle;
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
          streetAddressField(),
          postalCodeField(),
          cityField(),
          stateProvinceField(),
        validationZone(),
        submit(context)
      ]),
    );
  }

      Widget streetAddressField() {
        return BlocBuilder<LocationBloc, LocationState>(
            buildWhen: (previous, current) => previous.streetAddress != current.streetAddress,
            builder: (context, state) {
              return TextFormField(
                  controller: context.bloc<LocationBloc>().streetAddressController,
                  onChanged: (value) { context.bloc<LocationBloc>()
                    .add(StreetAddressChanged(streetAddress:value)); },
                  keyboardType:TextInputType.text,                  decoration: InputDecoration(
                      labelText:S.of(context).pageEntitiesLocationStreetAddressField));
            }
        );
      }
      Widget postalCodeField() {
        return BlocBuilder<LocationBloc, LocationState>(
            buildWhen: (previous, current) => previous.postalCode != current.postalCode,
            builder: (context, state) {
              return TextFormField(
                  controller: context.bloc<LocationBloc>().postalCodeController,
                  onChanged: (value) { context.bloc<LocationBloc>()
                    .add(PostalCodeChanged(postalCode:value)); },
                  keyboardType:TextInputType.text,                  decoration: InputDecoration(
                      labelText:S.of(context).pageEntitiesLocationPostalCodeField));
            }
        );
      }
      Widget cityField() {
        return BlocBuilder<LocationBloc, LocationState>(
            buildWhen: (previous, current) => previous.city != current.city,
            builder: (context, state) {
              return TextFormField(
                  controller: context.bloc<LocationBloc>().cityController,
                  onChanged: (value) { context.bloc<LocationBloc>()
                    .add(CityChanged(city:value)); },
                  keyboardType:TextInputType.text,                  decoration: InputDecoration(
                      labelText:S.of(context).pageEntitiesLocationCityField));
            }
        );
      }
      Widget stateProvinceField() {
        return BlocBuilder<LocationBloc, LocationState>(
            buildWhen: (previous, current) => previous.stateProvince != current.stateProvince,
            builder: (context, state) {
              return TextFormField(
                  controller: context.bloc<LocationBloc>().stateProvinceController,
                  onChanged: (value) { context.bloc<LocationBloc>()
                    .add(StateProvinceChanged(stateProvince:value)); },
                  keyboardType:TextInputType.text,                  decoration: InputDecoration(
                      labelText:S.of(context).pageEntitiesLocationStateProvinceField));
            }
        );
      }


  Widget validationZone() {
    return BlocBuilder<LocationBloc, LocationState>(
        buildWhen:(previous, current) => previous.formStatus != current.formStatus,
        builder: (context, state) {
          return Visibility(
              visible: state.formStatus.isSubmissionFailure ||  state.formStatus.isSubmissionSuccess,
              child: Center(
                child: generateNotificationText(state, context),
              ));
        });
  }

  Widget generateNotificationText(LocationState state, BuildContext context) {
    String notificationTranslated = '';
    MaterialColor notificationColors;

    if (state.generalNotificationKey.toString().compareTo(HttpUtils.errorServerKey) == 0) {
      notificationTranslated =S.of(context).genericErrorServer;
      notificationColors = Theme.of(context).errorColor;
    } else if (state.generalNotificationKey.toString().compareTo(HttpUtils.badRequestServerKey) == 0) {
      notificationTranslated =S.of(context).genericErrorBadRequest;
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
    return BlocBuilder<LocationBloc, LocationState>(
        buildWhen: (previous, current) => previous.formStatus != current.formStatus,
        builder: (context, state) {
          String buttonLabel = state.editMode == true ?
S.of(context).entityActionEdit.toUpperCase():
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
            onPressed: state.formStatus.isValidated ? () => context.bloc<LocationBloc>().add(LocationFormSubmitted()) : null,
          );
        }
    );
  }
}
