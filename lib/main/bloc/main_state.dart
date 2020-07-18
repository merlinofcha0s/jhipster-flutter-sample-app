part of 'main_bloc.dart';

enum MainAction {none, reloadForLanguage}

class MainState extends Equatable {
  final User currentUser;
  final MainAction mainAction;

  const MainState({
    this.currentUser = const User('', '', '', '', '', ''),
    this.mainAction = MainAction.none
  });

  MainState copyWith({
    User currentUser,
    MainAction mainAction
  }) {
    return MainState(
      currentUser: currentUser ?? this.currentUser,
      mainAction: mainAction ?? this.mainAction,
    );
  }

  @override
  List<Object> get props => [currentUser, mainAction];

  @override
  bool get stringify => true;
}
