class NetworkConfig {
  static const String baseUrl = 'https://api.example.com'; // 替换为你实际地址

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 15);

// ✅ 未来拓展：多环境配置
// static String get baseUrl {
//   if (env == Env.dev) return 'https://dev.api.com';
//   if (env == Env.prod) return 'https://api.com';
// }
}
