
class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => message;

///  ✅ 可拓展：根据不同 DioError 类型分类
  static NetworkException fromDioError(dynamic error) {
    if (error.type.toString().contains('Timeout')) {
      return NetworkException("连接超时");
    }
    if (error.response != null) {
      return NetworkException(
          "请求失败: [${error.response?.statusCode}] ${error.response?.statusMessage}");
    }
    return NetworkException("网络请求异常：${error.message ?? error.toString()}");
  }
}
