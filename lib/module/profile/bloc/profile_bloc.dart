
import 'package:bloc_mvvm_architecture/module/profile/bloc/profile_event.dart';
import 'package:bloc_mvvm_architecture/module/profile/bloc/profile_state.dart';
import 'package:bloc_mvvm_architecture/module/profile/profile_repository/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileBloc extends Bloc<UserProfileEvent,UserProfileState> {
  final UserRepository repository;
  UserProfileBloc(this.repository) : super(UserProfileInitial()){
    //监听LoadUserProfile 事件
    on<LoadUserProfile>((event, emit) async {
      emit(UserProfileLoading());
      try {
        final user = await repository.fetchUserProfile();
        emit(UserProfileLoaded(user));
      } catch(e) {
        emit(UserProfileError('Failed to load user profile'));
      }
    });
  }
}