import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jhipsterfluttersample/generated/l10n.dart';
import 'package:jhipsterfluttersample/keys.dart';
import 'package:jhipsterfluttersample/main/main_bloc.dart';
import 'package:jhipsterfluttersample/routes.dart';
import 'package:jhipsterfluttersample/shared/bloc/bloc_provider_legacy.dart';
import 'package:jhipsterfluttersample/shared/models/user.dart';
import 'package:jhipsterfluttersample/shared/widgets/drawer/drawer_bloc.dart';
import 'package:jhipsterfluttersample/shared/widgets/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class MainScreen extends StatelessWidget {
  MainScreen({Key key}) : super(key: JhipsterfluttersampleKeys.mainScreen);

  @override
  Widget build(BuildContext context) {
    final mainBloc = BlocProviderLegacy.of<MainBloc>(context);
    init(context, mainBloc);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).pageMainTitle),
      ),
      body: body(context, mainBloc),
      drawer: BlocProviderLegacy<JhipsterfluttersampleDrawerBloc>(bloc: JhipsterfluttersampleDrawerBloc(),
          child: JhipsterfluttersampleDrawer())
    );
  }

  Widget body(BuildContext context, MainBloc mainBloc){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            currentUserWidget(context, mainBloc),
            Padding(padding: EdgeInsets.symmetric(vertical: 10),),
            linkWidget(context, 'Jhipster Docs', 'https://www.jhipster.tech/'),
            linkWidget(context, 'Stackoverflow', 'http://stackoverflow.com/tags/jhipster/info'),
            linkWidget(context, 'Open issues', 'https://github.com/merlinofcha0s/generator-jhipster-flutter/issues?state=open'),
            linkWidget(context, 'Gitter', 'https://gitter.im/jhipster/generator-jhipster'),
            linkWidget(context, 'Jhipster twitter', 'https://twitter.com/jhipster')
          ],
        ),
      ],
    );
  }

  Widget currentUserWidget(BuildContext context, MainBloc bloc) {
    return StreamBuilder<User>(
      stream: bloc.userStream,
      builder: (context, snapshot) {
        String login = snapshot.data?.login != null ? snapshot.data?.login : '';
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(S.of(context).pageMainCurrentUser(login), style: Theme.of(context).textTheme.headline3),
            Padding(padding: EdgeInsets.symmetric(vertical: 5),),
            SizedBox(width: MediaQuery.of(context).size.width * 0.80,
                child: Text(S.of(context).pageMainWelcome, textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3)),
          ],
        );
      }
    );
  }

  Widget linkWidget(BuildContext context, String text, String url){
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: RaisedButton(
          onPressed: () => _launchURL(url),
          child: Container(
            child: Text(text, textAlign: TextAlign.center,),
            width: MediaQuery.of(context).size.width * 0.5,)
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  init(BuildContext context, MainBloc bloc) async {
    bool reload = await bloc.init();
    if(reload) {
      Navigator.popAndPushNamed(context, JhipsterfluttersampleRoutes.main);
    }
  }
}
