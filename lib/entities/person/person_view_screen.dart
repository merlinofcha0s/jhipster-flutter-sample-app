import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/person/bloc/person_bloc.dart';
import 'package:jhipsterFlutterSampleApp/entities/person/person_model.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:jhipsterFlutterSampleApp/shared/widgets/loading_indicator_widget.dart';
import 'person_route.dart';

class PersonViewScreen extends StatelessWidget {
  PersonViewScreen({Key key}) : super(key: PersonRoutes.createScreenKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:Text(S.of(context).pageEntitiesPersonViewTitle),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: BlocBuilder<PersonBloc, PersonState>(
              buildWhen: (previous, current) => previous.loadedPerson != current.loadedPerson,
              builder: (context, state) {
                return Visibility(
                  visible: state.personStatusUI == PersonStatusUI.done,
                  replacement: LoadingIndicator(),
                  child: Column(children: <Widget>[
                    personCard(state.loadedPerson, context)
                  ]),
                );
              }
            ),
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, PersonRoutes.create),
          child: Icon(Icons.add, color: Theme.of(context).iconTheme.color,),
          backgroundColor: Theme.of(context).primaryColor,
        )
    );
  }

  Widget personCard(Person person, BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Id : ' + person.id.toString(), style: Theme.of(context).textTheme.bodyText1,),
                Text('First Name : ' + person.firstName.toString(), style: Theme.of(context).textTheme.bodyText1,),
                Text('Last Name : ' + person.lastName.toString(), style: Theme.of(context).textTheme.bodyText1,),
                Text('Email : ' + person.email.toString(), style: Theme.of(context).textTheme.bodyText1,),
                Text('Phone Number : ' + person.phoneNumber.toString(), style: Theme.of(context).textTheme.bodyText1,),
          ],
        ),
      ),
    );
  }
}
