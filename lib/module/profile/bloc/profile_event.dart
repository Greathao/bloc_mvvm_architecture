
import 'package:equatable/equatable.dart' ;

//事件接口
abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();
  @override
  List<Object> get props => [];
}

class LoadUserProfile extends UserProfileEvent {}
