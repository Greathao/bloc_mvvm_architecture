import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// web平台必须导入
import 'dart:ui' as ui;
import 'dart:html';
import 'package:flutter/widgets.dart';

class WebPage extends StatefulWidget {
  final String url;
  const WebPage({super.key, required this.url});
  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    if (!kIsWeb) {
      // 非Web平台使用原生webview_flutter
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(widget.url));
    } else {
      // 注册一个iframe视图（仅在Web平台）
      // 用唯一名字注册iframe，后面 build 时用
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        'iframeElement',
            (int viewId) => IFrameElement()
          ..width = '100%'
          ..height = '100%'
          ..src = widget.url
          ..style.border = 'none',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // Web平台用iframe展示
      return Scaffold(
        appBar: AppBar(title: const Text('内嵌网页')),
        body: HtmlElementView(viewType: 'iframeElement'),
      );
    } else {
      // 移动平台用webview_flutter
      return Scaffold(
        appBar: AppBar(title: const Text('内嵌网页')),
        body: WebViewWidget(controller: _controller),
      );
    }
  }
}
