import 'package:flutter/material.dart';

/// 所有模块都必须实现的统一路由定义接口。
/// 强制规范每个模块的路由结构，便于集中管理和解耦。
abstract class BaseModuleRoute {
  /// 模块名称（用于日志、调试等场景）
  String get moduleName;

  /// 模块入口路径（模块的首页路径）
  String get entryPath;

  /// 当前模块定义的所有页面路由映射
  Map<String, WidgetBuilder> get routes;

  /// 当前模块暴露给外部使用的路径（如组件中台、跨模块跳转等）
  List<String> get exportedPages;

  /// 如果模块启动时需要默认参数，这里可以定义（可选）
  Map<String, dynamic>? get initialArguments => null;
}
