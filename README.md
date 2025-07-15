```
lib/
├── core/                  # 基础层，技术设施层
│   ├── exceptions/        # 全局异常
│   ├── network/           # 网络请求封装
│   ├── utils/             # 通用工具
│   ├── services/          # 公共服务（如日志、定位等）
│   └── di/                # 依赖注入容器配置
│
├── common/                # 通用层，跨业务通用组件与模型
│   ├── models/            # 通用业务实体
│   ├── widgets/           # 通用 UI 组件
│   └── services/          # 跨模块业务服务（如用户信息管理）
│
└── module/               # 业务模块（横向拆分，独立MVVM）
└────── moduleA/                  # 某业务模块
        ├── model/            # 业务实体，数据层（Repository接口实现等）
        ├── viewmodel/        # 视图模型层，负责状态和业务逻辑 
        └── view/             # 界面层，负责UI展示和交互
            ├── pages/        # 页面级Widget（Page/Screen）
            ├── widgets/      # 页面内复用的UI组件
            └── dialogs/      # 弹窗、模态框等UI元素
```