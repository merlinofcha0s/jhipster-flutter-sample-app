import 'package:jhipsterfluttersample/generated/l10n.dart';
import 'package:jhipsterfluttersample/keys.dart';
import 'package:jhipsterfluttersample/main/main_bloc.dart';
import 'package:jhipsterfluttersample/shared/bloc/bloc_provider.dart';
import 'package:jhipsterfluttersample/shared/widgets/drawer/drawer_bloc.dart';
import 'package:jhipsterfluttersample/shared/widgets/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class MainScreen extends StatelessWidget {
  MainScreen({Key key}) : super(key: JhipsterfluttersampleKeys.mainScreen);

  @override
  Widget build(BuildContext context) {
    final mainBloc = BlocProvider.of<MainBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).pageMainTitle),
      ),
      body: body(context),
      drawer: BlocProvider<JhipsterfluttersampleDrawerBloc>(bloc: JhipsterfluttersampleDrawerBloc() ,child: JhipsterfluttersampleDrawer())
    );
  }

  Widget body(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(S.of(context).pageMainWelcome, style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
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

  Widget linkWidget(BuildContext context, String text, String url){
    return RaisedButton(
        onPressed: () => _launchURL(url),
        color: Colors.teal,
        child: Container(
          child: Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.white),),
          width: MediaQuery.of(context).size.width * 0.5,)
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
