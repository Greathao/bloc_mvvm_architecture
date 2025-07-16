
import 'package:bloc_mvvm_architecture/module/profile/model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();
  @override
  List<Object?> get props => [];
}
// 初始化
class UserProfileInitial extends UserProfileState {}
// 加载中
class UserProfileLoading extends UserProfileState {}
// 加载成功
class UserProfileLoaded  extends UserProfileState {
  final UserModel user;
  const UserProfileLoaded(this.user);
  @override
  List<Object?> get props => [user];
}
// 加载错误
class UserProfileError extends UserProfileState {
  final String message;
  const UserProfileError(this.message);
  @override
  List<Object?> get props => [message];
}


