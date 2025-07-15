
/// 封装结果（成功/失败+错误信息）
class ApiResult<T> {
  final T? data;
  final String? error;

  bool get isSuccess => data != null && error == null;

  const ApiResult.success(this.data) : error = null;
  const ApiResult.failure(this.error) : data = null;
}
