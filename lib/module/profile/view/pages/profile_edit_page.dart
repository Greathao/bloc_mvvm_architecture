import 'package:bloc_mvvm_architecture/module/profile/bloc/profile_bloc.dart';
import 'package:bloc_mvvm_architecture/module/profile/bloc/profile_event.dart';
import 'package:bloc_mvvm_architecture/module/profile/bloc/profile_state.dart';
import 'package:bloc_mvvm_architecture/module/profile/profile_repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileEditPage extends StatelessWidget {
  const UserProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserProfileBloc(UserRepository())..add(LoadUserProfile()),
      child: Scaffold(
        appBar: AppBar(title: const Text("用户资料")),
        body: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
            if (state is UserProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserProfileLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(state.user.avatarUrl),
                    radius: 50,
                  ),
                  const SizedBox(height: 16),
                  Text(state.user.name, style: const TextStyle(fontSize: 24)),
                  Text(state.user.email),
                ],
              );
            } else if (state is UserProfileError) {
              return Center(child: Text("错误: ${state.message}"));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
