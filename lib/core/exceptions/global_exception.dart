

/// 表示应用全局级别的异常，常用于系统级错误、无法分类的严重异常
class GlobalException implements Exception {
  final String message;

  /// [code] 可选错误码，用于定位严重系统异常或埋点
  final int? code;

  GlobalException(this.message, {this.code});

  @override
  String toString() {
    return 'GlobalException${code != null ? ' [$code]' : ''}: $message';
  }
}
