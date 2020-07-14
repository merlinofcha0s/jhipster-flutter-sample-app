import 'package:jhipsterfluttersample/account/register/register_bloc.dart';
import 'package:jhipsterfluttersample/generated/l10n.dart';
import 'package:jhipsterfluttersample/keys.dart';
import 'package:jhipsterfluttersample/routes.dart';
import 'package:jhipsterfluttersample/shared/bloc/bloc_provider_legacy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen() : super(key: JhipsterfluttersampleKeys.registerScreen);

  @override
  Widget build(BuildContext context) {
    final registerBloc = BlocProviderLegacy.of<RegisterBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).pageRegisterTitle),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: <Widget>[
            header(context),
            successZone(registerBloc),
            registerForm(registerBloc)
          ]),
        ));
  }

  Widget header(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(
          image:
              AssetImage('assets/images/jhipster_family_member_1_head-512.png'),
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width * 0.35,
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 20))
      ],
    );
  }

  Widget registerForm(RegisterBloc registerBloc) {
    return StreamBuilder<bool>(
        stream: registerBloc.successRegisterStream,
        builder: (context, snapshot) {
          return Visibility(
            visible: !snapshot.hasData || !snapshot.data,
            child: Form(
              child: Wrap(runSpacing: 15, children: <Widget>[
                loginField(registerBloc),
                emailField(registerBloc),
                passwordField(registerBloc),
                confirmPasswordField(registerBloc),
                termsAndConditionsField(registerBloc),
                validationZone(registerBloc),
                submit(registerBloc)
              ]),
            ),
          );
        });
  }


  Widget loginField(RegisterBloc registerBloc) {
    return StreamBuilder<String>(
        stream: registerBloc.loginStream,
        builder: (context, snapshot) {
          return TextFormField(
              onChanged: registerBloc.changeLogin,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText:S.of(context).pageRegisterFormLogin,
                  errorText: snapshot.error));
        });
  }

  Widget emailField(RegisterBloc registerBloc) {
    return StreamBuilder<String>(
        stream: registerBloc.emailStream,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: registerBloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText:S.of(context).pageRegisterFormEmail,
                hintText:S.of(context).pageRegisterFormEmailHint,
                errorText: snapshot.error),
          );
        });
  }

  Widget passwordField(RegisterBloc registerBloc) {
    return StreamBuilder<String>(
        stream: registerBloc.passwordStream,
        builder: (context, snapshot) {
          return TextFormField(
              onChanged: registerBloc.changePassword,
              obscureText: true,
              decoration: InputDecoration(
                  labelText:S.of(context).pageRegisterFormPassword,
                  errorText: snapshot.error));
        });
  }

  Widget confirmPasswordField(RegisterBloc registerBloc) {
    return StreamBuilder<String>(
        stream: registerBloc.confirmPasswordStream,
        builder: (context, snapshot) {
          return TextFormField(
              onChanged: registerBloc.changeConfirmPassword,
              obscureText: true,
              decoration: InputDecoration(
                  labelText:S.of(context).pageRegisterFormConfirmPassword,
                  errorText: snapshot.error));
        });
  }

  Widget termsAndConditionsField(RegisterBloc registerBloc) {
    return StreamBuilder<bool>(
        stream: registerBloc.termsAndConditionsStream,
        builder: (context, snapshot) {
          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                        onChanged: registerBloc.changeTermsAndConditions,
                        value: snapshot.hasData ? snapshot.data : false),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                  ),
                  Text(S.of(context).pageRegisterFormTermsConditions, style: Theme.of(context).textTheme.bodyText1,),
                ],
              ),
              Visibility(
                visible: snapshot.hasError,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(S.of(context).pageRegisterFormTermsConditionsNotChecked,
                    style: TextStyle(color: Theme.of(context).errorColor),
                  ),
                ),
              )
            ],
          );
        });
  }

  Widget validationZone(RegisterBloc registerBloc) {
    return StreamBuilder<bool>(
        stream: registerBloc.generalValidationStream,
        builder: (context, snapshot) {
          return Visibility(
              visible: snapshot.hasError,
              child: Center(
                child: Text(
                  generateError(snapshot, context),
                  style: TextStyle(color: Theme.of(context).errorColor),
                ),
              ));
        });
  }

  String generateError(AsyncSnapshot<bool> snapshot, BuildContext context) {
    String errorTranslated = '';
    if(snapshot.error.toString().compareTo(RegisterBloc.passwordNotIdenticalKey) == 0){
      errorTranslated =S.of(context).pageRegisterErrorPasswordNotIdentical;
    } else if(snapshot.error.toString().compareTo(RegisterBloc.emailExistKey) == 0) {
      errorTranslated =S.of(context).pageRegisterErrorMailExist;
    } else if (snapshot.error.toString().compareTo(RegisterBloc.loginExistKey) == 0){
      errorTranslated =S.of(context).pageRegisterErrorLoginExist;
    }

    return errorTranslated;
  }

  Widget submit(RegisterBloc registerBloc) {
    return StreamBuilder(
        stream: registerBloc.submitValid,
        builder: (context, snapshotSubmit) {
          return RaisedButton(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: StreamBuilder<bool>(
                    stream: registerBloc.isLoadingStream,
                    builder: (context, snapshotLoading) {
                      return Center(
                        child: Visibility(
                          replacement: CircularProgressIndicator(value: null),
                          visible: snapshotLoading.hasData && !snapshotLoading.data,
                          child: Text(S.of(context).pageRegisterFormSubmit.toUpperCase(),
                          ),
                        ),
                      );
                    })),
            onPressed: snapshotSubmit.hasData ? registerBloc.submit : null,
          );
        });
  }

  Widget successZone(RegisterBloc registerBloc) {
    return StreamBuilder<bool>(
        stream: registerBloc.successRegisterStream,
        builder: (context, snapshot) {
          return Visibility(
            visible: snapshot.hasData && snapshot.data,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.check_circle,
                    color: Theme.of(context).primaryColor,
                    size: 125.0,
                    semanticLabel:S.of(context).pageRegisterSuccessAltImg,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Text(S.of(context).pageRegisterSuccess.toUpperCase(),
                      style: Theme.of(context).textTheme.headline1),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Text(S.of(context).pageRegisterSuccessSub),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  RaisedButton(
                    child: Container(
                        child: Center(
                            child: Text(S.of(context).pageRegisterFormLogin))),
                    onPressed: () =>
                        Navigator.pushNamed(context, JhipsterfluttersampleRoutes.login),
                  )
                ],
              ),
            ),
          );
        });
  }
}
