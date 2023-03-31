// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:brewery/base/base.dart';
import 'package:brewery/data/model/breweries/response/breweries_response.dart';
import 'package:brewery/network/network_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'breweries_event.dart';
part 'breweries_state.dart';

class BreweriesBloc extends Bloc<BreweriesEvent, BreweriesState> {
  final helper = NetworkHelper();
  BreweriesBloc() : super(BreweriesInitial()) {
    on<GetListBreweriesEvent>(_onGetListBreweries, transformer: sequential());
  }

  Future<void> _onGetListBreweries(
      BreweriesEvent event, Emitter<BreweriesState> state) async {
    emit(BreweriesLoading());

    final response =
        await helper.apiCall(getListBreweriesUrl, null, null, RequestType.GET);

    if (response.errorMessage != null) {
      emit(BreweriesError(response.errorMessage ?? "Something's wrong"));
    } else {
      final List<BreweriesResponse> breweriesList = [];

      for (var data in response.data) {
        BreweriesResponse rawData = BreweriesResponse.fromJson(data);

        breweriesList.add(rawData);
      }
      emit(BreweriesSuccess(breweriesList));
    }
  }
}
