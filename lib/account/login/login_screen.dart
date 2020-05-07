import 'package:JhipsterAppSample/generated/l10n.dart';
import 'package:JhipsterAppSample/keys.dart';
import 'package:JhipsterAppSample/shared/bloc/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';
import 'login_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: JhipsterSampleAppKeys.loginScreen);

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).pageLoginTitle),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: <Widget>[
            header(context),
            loginForm(loginBloc),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            register(context)
          ]),
        ));
  }

  Widget header(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(image: AssetImage('assets/images/jhipster_family_member_0_head-512.png'),
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width * 0.4,),
        Padding(padding: EdgeInsets.symmetric(vertical: 20))
      ],
    );
  }

  Widget loginField(LoginBloc loginBloc) {
    return StreamBuilder<String>(
        stream: loginBloc.usernameStream,
        builder: (context, snapshot) {
          return TextFormField(
              onChanged: loginBloc.changeLogin,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: S.of(context).pageRegisterFormLogin,
                  errorText: snapshot.error));
        });
  }

  Widget passwordField(LoginBloc loginBloc) {
    return StreamBuilder<String>(
        stream: loginBloc.passwordStream,
        builder: (context, snapshot) {
          return TextFormField(
              onChanged: loginBloc.changePassword,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: S.of(context).pageRegisterFormPassword,
                  errorText: snapshot.error));
        });
  }

  Widget loginForm(LoginBloc loginBloc) {
    return Form(
      child: Wrap(runSpacing: 15, children: <Widget>[
        loginField(loginBloc),
        passwordField(loginBloc),
        validationZone(loginBloc),
        submit(loginBloc)
      ]),
    );
  }

  Widget register(BuildContext context) {
    return RaisedButton(
      color: Colors.red,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Center(
            child: Text(
              S.of(context).pageRegisterTitle.toUpperCase(),
              style: TextStyle(fontSize: 15),
            ),
          )),
      onPressed: () => Navigator.pushNamed(context, JhipsterSampleRoutes.register),
    );
  }

  Widget validationZone(LoginBloc loginBloc) {
    return StreamBuilder<bool>(
        stream: loginBloc.generalValidationStream,
        builder: (context, snapshot) {
          return Visibility(
              visible: snapshot.hasError,
              child: Center(
                child: Text(
                  generateError(snapshot, context),
                  style: TextStyle(color: Colors.red),
                ),
              ));
        });
  }

  Widget submit(LoginBloc loginBloc) {
    return StreamBuilder(
        stream: loginBloc.submitValid,
        builder: (context, snapshotSubmit) {
          return RaisedButton(
            color: Colors.blue,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: StreamBuilder<bool>(
                    stream: loginBloc.isLoadingStream,
                    builder: (context, snapshotLoading) {
                      return Center(
                        child: Visibility(
                          replacement: CircularProgressIndicator(value: null),
                          visible:
                              snapshotLoading.hasData && !snapshotLoading.data,
                          child: Text(
                            S.of(context).pageLoginLoginButton.toUpperCase(),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      );
                    })),
            onPressed: snapshotSubmit.hasData
                ? () => onAuthenticate(loginBloc, context)
                : null,
          );
        });
  }

  onAuthenticate(LoginBloc loginBloc, BuildContext context) async {
    bool authenticateSuccess = await loginBloc.authenticate();
    if (authenticateSuccess) {
      Navigator.pushNamed(context, JhipsterSampleRoutes.main);
    }
  }

  String generateError(AsyncSnapshot<bool> snapshot, BuildContext context) {
    String errorTranslated = '';
    if (snapshot.error.toString().compareTo(LoginBloc.authenticationFailKey) == 0) {
      errorTranslated = S.of(context).pageLoginErrorAuthentication;
    }
    return errorTranslated;
  }
}
