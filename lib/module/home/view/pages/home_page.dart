import 'package:bloc_mvvm_architecture/core/router/app_router.dart';
import 'package:bloc_mvvm_architecture/module/home/router/home_routers.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_floor_layout/flutter_floor_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('首页')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 跳转到子模块：活动页
            // AppRouter.push(context, HomeModuleRoute.activityPath);

            // 方式 1：arguments 传参
            AppRouter.push(
              context,
              HomeModuleRoute.activityPath,
              arguments: {'actId': '1002'},
            );

            // 方式 2（可选）：通过 URI 跳转
            // AppRouter.pushFromUri(context, Uri.parse('/home/activity?actId=1001'));

          },
          child: const Text('进入活动页'),
        ),
      ),
    );
  }
}

