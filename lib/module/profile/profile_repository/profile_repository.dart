
import 'package:bloc_mvvm_architecture/module/profile/model/user_model.dart';

class UserRepository {
  Future<UserModel> fetchUserProfile() async {
    await Future.delayed(Duration(seconds: 1));
    return UserModel(
      name: 'John Doe',
      email: "John@example.com",
      avatarUrl: "https://picsum.photos/seed/john/100",);
  }
}
