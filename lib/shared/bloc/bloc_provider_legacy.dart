import 'package:flutter/cupertino.dart';

import 'bloc.dart';

class BlocProviderLegacy<T extends Bloc> extends StatefulWidget {
  final T bloc;
  final Widget child;

  BlocProviderLegacy({@required this.bloc, @required this.child});

  static T of<T extends Bloc>(BuildContext buildContext) {
    final BlocProviderLegacy<T> _provider = buildContext.findAncestorWidgetOfExactType<BlocProviderLegacy<T>>();
    return _provider.bloc;
  }

  State createState() => _BlocProviderLegacyState();
}

class _BlocProviderLegacyState extends State<BlocProviderLegacy> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
