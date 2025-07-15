// module/home/view/pages/activity_page.dart

import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  final String actId;
  const ActivityPage({super.key, required this.actId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('活动页')),
      body: Center(
        child: Text('当前活动ID：$actId'),
      ),
    );
  }
}
