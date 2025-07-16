# 🧭 Flutter 模块化架构：MVVM + BLoC + 路由解耦

本项目采用高度模块化的方式进行业务划分，结合 MVVM 模式和 BLoC 状态管理方案，实现逻辑与界面解耦，具备良好的扩展性与团队协作效率。适用于中大型 Flutter 项目，开箱即用。

---

## 📦 项目结构总览

``` 
lib/
├── core/                  # 基础设施层（技术栈相关封装）
│   ├── exceptions/        # 全局异常定义与处理
│   ├── network/           # 网络请求封装
│   ├── utils/             # 工具方法/扩展函数
│   └── router/            # 路由注册与统一跳转入口

├── common/                # 通用模块（跨业务复用）
│   ├── models/            # 通用数据模型
│   ├── widgets/           # 通用 UI 组件
│   └── services/          # 跨模块服务类（如全局用户信息）

└── module/                # 各业务模块（横向拆分）
    └── moduleA/           
        ├── router/        # 模块内页面路由路径与导出路径
        ├── model/         # 数据模型（业务实体）
        ├── viewmodel/     # Bloc（视图模型层）
        └── view/          # UI 层，按页面和组件拆分
            ├── pages/
            ├── widgets/
            └── dialogs/
```

---

## 🔄 MVVM 模式解读（基于 BLoC）

本项目采用 `BLoC` 替代传统 ViewModel，构建响应式、可测试的 MVVM 架构。

### 数据流说明

```
UI(View)  →  Event（用户意图）
     ↓
 Bloc（视图逻辑与状态变更）
     ↓
 State（状态）→ 更新 UI
```

### 每个 Bloc 模块包含：

- `Event`: 用户操作与外部输入的抽象
- `State`: UI 状态（如加载中、成功、失败、空数据）
- `Bloc`: 连接输入输出、处理业务逻辑
- `Repository`: 封装数据获取逻辑（如 API）

---

## 🚀 路由模块化设计

### 设计目标

- **集中管理路由表**
- **模块独立注册与暴露路径**
- **支持深度链接和参数跳转**
- **注册错误回退 NotFound 页面**

### 文件结构

```
core/router/
├── app_router.dart         # 总路由控制器
├── base_module_route.dart  # 模块路由接口规范
└── not_found_page.dart     # 未注册页面提示
```

### 模块注册方式

每个模块实现 `BaseModuleRoute`：

```dart
class HomeModuleRoute implements BaseModuleRoute {
  @override
  String get moduleName => "home";

  @override
  String get entryPath => "/home";

  @override
  List<String> get exportedPages => ["/home", "/home/detail"];

  @override
  Map<String, WidgetBuilder> get routes => {
    "/home": (_) => HomePage(),
    "/home/detail": (_) => DetailPage(),
  };
}
```

在 `AppRouter` 中统一注册：

```dart
static final List<BaseModuleRoute> _modules = [
  HomeModuleRoute(),
  ProfileModuleRoute(),
];
```

调用方式统一：

```dart
AppRouter.push(context, "/profile", arguments: {"id": 123});
AppRouter.replaceFromUri(context, Uri.parse("/home/detail?id=1"));
```

