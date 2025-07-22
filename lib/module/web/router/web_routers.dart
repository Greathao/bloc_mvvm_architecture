import 'package:bloc_mvvm_architecture/core/router/base_module_route.dart';
import 'package:bloc_mvvm_architecture/module/web/view/web_page.dart';
import 'package:flutter/material.dart';

class WebModuleRoute extends BaseModuleRoute {
  @override
  String get moduleName => 'WebModule';

  @override
  String get entryPath => '/web';

  @override
  Map<String, WidgetBuilder> get routes => {
    entryPath: (context) {
      final settings = ModalRoute.of(context)?.settings;
      final args = settings?.arguments;
      final query = Uri.tryParse(settings?.name ?? '')?.queryParameters ?? {};
      // 优先使用 arguments 中的 url，fallback 用 URI query 参数
      final url = args is Map && args['url'] != null
          ? args['url'].toString()
          : query['url'] ?? '';
      return WebPage(url: url);
    },
  };

  @override
  List<String> get exportedPages => [
    entryPath,
  ];
}


