// module/profile/view/pages/profile_edit_page.dart

import 'package:flutter/material.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('编辑资料')),
      body: const Center(child: Text('这里是编辑页面')),
    );
  }
}
