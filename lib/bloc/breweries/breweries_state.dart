part of 'breweries_bloc.dart';

abstract class BreweriesState extends Equatable {
  const BreweriesState();

  @override
  List<Object> get props => [];
}

class BreweriesInitial extends BreweriesState {}

class BreweriesLoading extends BreweriesState {}

class BreweriesSuccess extends BreweriesState {
  final List<BreweriesResponse> breweries;

  const BreweriesSuccess(this.breweries);
}

class BreweriesError extends BreweriesState {
  final String message;

  const BreweriesError(this.message);
}
