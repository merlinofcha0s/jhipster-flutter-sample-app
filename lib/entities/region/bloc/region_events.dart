part of 'region_bloc.dart';

abstract class RegionEvent extends Equatable {
  const RegionEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class InitRegionList extends RegionEvent {}

class RegionNameChanged extends RegionEvent {
  final String regionName;
  
  const RegionNameChanged({@required this.regionName});
  
  @override
  List<Object> get props => [regionName];
}

class RegionFormSubmitted extends RegionEvent {}

class LoadRegionByIdForEdit extends RegionEvent {
  final int id;

  const LoadRegionByIdForEdit({@required this.id});

  @override
  List<Object> get props => [id];
}

class DeleteRegionById extends RegionEvent {
  final int id;

  const DeleteRegionById({@required this.id});

  @override
  List<Object> get props => [id];
}

class LoadRegionByIdForView extends RegionEvent {
  final int id;

  const LoadRegionByIdForView({@required this.id});

  @override
  List<Object> get props => [id];
}
