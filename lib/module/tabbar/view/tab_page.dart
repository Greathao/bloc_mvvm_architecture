import 'dart:async';
import 'package:bloc_mvvm_architecture/core/router/app_router.dart';
import 'package:bloc_mvvm_architecture/module/home/router/home_routers.dart';
import 'package:bloc_mvvm_architecture/module/profile/router/profile_routers.dart';
import 'package:flutter/material.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});
  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  int _currentIndex = 0;

  // Tab入口路由列表
  final List<String> _tabEntryPaths = [HomeModuleRoute().entryPath, ProfileModuleRoute().entryPath];

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = _tabEntryPaths.map((path) => AppRouter.getPageWidget(path)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
      ),
    );
  }
}
