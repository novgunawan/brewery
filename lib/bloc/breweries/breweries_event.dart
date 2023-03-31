part of 'breweries_bloc.dart';

abstract class BreweriesEvent extends Equatable {
  const BreweriesEvent();

  @override
  List<Object> get props => [];
}

class GetListBreweriesEvent extends BreweriesEvent {}

class GetBreweryEvent extends BreweriesEvent {}
