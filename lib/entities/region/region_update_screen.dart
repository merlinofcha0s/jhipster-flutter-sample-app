import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/region/bloc/region_bloc.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:jhipsterFlutterSampleApp/entities/region/region_model.dart';
import 'region_route.dart';

class RegionUpdateScreen extends StatelessWidget {
  RegionUpdateScreen({Key key}) : super(key: RegionRoutes.editScreenKey);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegionBloc, RegionState>(
      listener: (context, state) {
        if(state.formStatus.isSubmissionSuccess){
          Navigator.pushNamed(context, RegionRoutes.list);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: BlocBuilder<RegionBloc, RegionState>(
                buildWhen: (previous, current) => previous.editMode != current.editMode,
                builder: (context, state) {
                String title = state.editMode == true ?S.of(context).pageEntitiesRegionUpdateTitle:
S.of(context).pageEntitiesRegionCreateTitle;
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
          regionNameField(),
        validationZone(),
        submit(context)
      ]),
    );
  }

      Widget regionNameField() {
        return BlocBuilder<RegionBloc, RegionState>(
            buildWhen: (previous, current) => previous.regionName != current.regionName,
            builder: (context, state) {
              return TextFormField(
                  controller: context.bloc<RegionBloc>().regionNameController,
                  onChanged: (value) { context.bloc<RegionBloc>()
                    .add(RegionNameChanged(regionName:value)); },
                  keyboardType:TextInputType.text,                  decoration: InputDecoration(
                      labelText:S.of(context).pageEntitiesRegionRegionNameField));
            }
        );
      }


  Widget validationZone() {
    return BlocBuilder<RegionBloc, RegionState>(
        buildWhen:(previous, current) => previous.formStatus != current.formStatus,
        builder: (context, state) {
          return Visibility(
              visible: state.formStatus.isSubmissionFailure ||  state.formStatus.isSubmissionSuccess,
              child: Center(
                child: generateNotificationText(state, context),
              ));
        });
  }

  Widget generateNotificationText(RegionState state, BuildContext context) {
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
    return BlocBuilder<RegionBloc, RegionState>(
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
            onPressed: state.formStatus.isValidated ? () => context.bloc<RegionBloc>().add(RegionFormSubmitted()) : null,
          );
        }
    );
  }
}
