part of 'drawer_blocv2.dart';

abstract class DrawerEvent extends Equatable {
  const DrawerEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class Logout extends DrawerEvent {}
