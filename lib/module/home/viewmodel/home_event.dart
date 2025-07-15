
import 'package:bloc_mvvm_architecture/core/state/base_state.dart';
import 'package:flutter_floor_layout/core/floor_base_model.dart';

class HomeState extends BaseState<List<FloorBaseModel>> {
  const HomeState();
}

class HomeInitial extends InitialState<List<FloorBaseModel>> {
  const HomeInitial();
}

class HomeLoading extends LoadingState<List<FloorBaseModel>> {
  const HomeLoading();
}

class HomeSuccess extends SuccessState<List<FloorBaseModel>> {
  const HomeSuccess(super.data);
}

class HomeError extends ErrorState<List<FloorBaseModel>> {
  const HomeError(super.message);
}
