import 'package:bloc_mvvm_architecture/module/home/router/home_routers.dart';
import 'package:bloc_mvvm_architecture/module/profile/router/profile_routers.dart';
import 'package:bloc_mvvm_architecture/module/tabbar/router/tabbar_routers.dart';
import 'package:flutter/material.dart';
import 'base_module_route.dart';
import 'not_found_page.dart';

/// 全局统一路由管理器，负责：
///
/// 1. 聚合各模块路由注册，维护统一路由表
/// 2. 提供路由生成器供 MaterialApp 使用
/// 3. 提供基于路由路径获取页面 Widget 的统一接口（供TabBar等使用）
/// 4. 提供统一的路由跳转接口（push、replace、Uri跳转）
/// 5. 未注册路由统一跳转到 NotFoundPage 错误页面
///
/// 设计原则：
/// - 集中管理路由，降低模块间耦合
/// - 提供统一且灵活的参数解析与传递方案
/// - 保证路由未注册时安全降级（错误页），防止程序崩溃
/// - 支持通过 Uri 路径和查询参数进行跳转，满足深度链接需求
class AppRouter {
  /// 所有模块路由注册入口，模块需继承 BaseModuleRoute 并注册路由
  static final List<BaseModuleRoute> _modules = [
    HomeModuleRoute(),
    ProfileModuleRoute(),
    TabbarModuleRoute(),
  ];

  /// 合并所有模块的路由表，形成全局路由表
  static final Map<String, WidgetBuilder> _routes = {
    for (final module in _modules) ...module.routes,
  };

  /// 外部只读访问完整路由表，供调试和外部查询
  static Map<String, WidgetBuilder> get routes => _routes;

  /// MaterialApp 统一路由生成器
  /// 根据路由名称解析对应页面，如果未找到，则返回错误页面
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;

    // 解析纯路径（去除query参数）
    final String pathOnly = name != null ? Uri.tryParse(name)?.path ?? name : '';

    final builder = _routes[pathOnly];
    if (builder != null) {
      return MaterialPageRoute(
        builder: builder,
        settings: settings,
      );
    }

    // 未注册路由，返回统一404错误页面
    return MaterialPageRoute(
      builder: (_) => NotFoundPage(routeName: name),
      settings: settings,
    );
  }

  /// 统一接口：根据路由名称返回对应页面 Widget
  ///
  /// 适合TabBar或多栈结构等需要直接拿Widget的场景
  /// 如果路由未注册，则返回错误页面
  ///
  /// 注意：
  /// - 建议调用时传入有效 BuildContext 用于 WidgetBuilder 创建
  /// - 参数传递可通过 arguments，并由页面自行解析 ModalRoute.of(context)?.settings.arguments
  static Widget getPageWidget(String routeName, {BuildContext? context, Object? arguments}) {
    final String pathOnly = Uri.tryParse(routeName)?.path ?? routeName;

    final builder = _routes[pathOnly];
    if (builder != null) {
      return builder(context ?? _fakeContext);
    }
    return NotFoundPage(routeName: routeName);
  }

  /// 占位的 BuildContext 实现，仅用于 builder 调用时避免空指针
  /// 实际场景建议都传入真实context，避免异常
  static final BuildContext _fakeContext = _FakeBuildContext();

  /// 普通页面跳转，支持传递参数
  static void push(
      BuildContext context,
      String routeName, {
        Object? arguments,
      }) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  /// 通过 Uri 跳转，自动拆解 path 与 query 参数
  static void pushFromUri(BuildContext context, Uri uri) {
    final path = uri.path;
    final queryParams = uri.queryParameters;
    Navigator.pushNamed(
      context,
      path,
      arguments: queryParams.isNotEmpty ? queryParams : null,
    );
  }

  /// 替换当前页面，支持传递参数
  static void replace(BuildContext context, String routeName, {Object? arguments}) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  /// 通过 Uri 替换当前页面，拆解路径和参数
  static void replaceFromUri(BuildContext context, Uri uri) {
    final path = uri.path;
    final queryParams = uri.queryParameters;
    Navigator.pushReplacementNamed(
      context,
      path,
      arguments: queryParams.isNotEmpty ? queryParams : null,
    );
  }

  /// 打印当前注册的所有路由，方便调试
  static void debugPrintAllRoutes() {
    debugPrint('—— 当前注册的路由表 ——');
    for (final entry in _routes.entries) {
      debugPrint('✅ ${entry.key}');
    }
  }
}

/// 路由参数提取辅助类
/// 支持合并从 arguments 和 URI queryParameters 中传递的参数，方便页面统一解析
class RouteParamHelper {
  /// 从当前页面上下文提取所有路由参数
  /// 包括：
  /// - pushNamed 传递的 arguments (必须是 Map 类型才能合并)
  /// - 路由名称中的 URI query 参数
  static Map<String, dynamic> extractParams(BuildContext context) {
    final ModalRoute? modalRoute = ModalRoute.of(context);
    if (modalRoute == null) return {};

    final RouteSettings settings = modalRoute.settings;
    final Object? args = settings.arguments;

    final Map<String, dynamic> params = {};

    if (args is Map) {
      params.addAll(args.cast<String, dynamic>());
    }

    final String? routeName = settings.name;
    if (routeName != null && routeName.contains('?')) {
      final uri = Uri.tryParse(routeName);
      if (uri != null && uri.queryParameters.isNotEmpty) {
        params.addAll(uri.queryParameters.cast<String, dynamic>());
      }
    }
    return params;
  }
}

/// 伪造的 BuildContext，仅作 Builder 调用占位符
/// 实际使用应传入真实context，避免潜在异常
class _FakeBuildContext implements BuildContext {
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

