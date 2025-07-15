
import 'package:bloc_mvvm_architecture/core/router/app_router.dart';
import 'package:bloc_mvvm_architecture/module/profile/router/profile_routers.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('我的')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AppRouter.push(context, ProfileModuleRoute.editPath);
          },
          child: const Text('编辑个人信息'),
        ),
      ),
    );
  }
}
