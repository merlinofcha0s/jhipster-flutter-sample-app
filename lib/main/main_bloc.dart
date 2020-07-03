import 'dart:async';

import 'package:jhipsterfluttersample/shared/bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc extends Bloc {
  final _example = BehaviorSubject<int>();

  Stream<int> get _exampleStream => _example.stream;

  Function(int) get changeExample => _example.sink.add;

  MainBloc();

  @override
  void dispose() => () {
    _example.close();
  };
}
