import 'package:dio/dio.dart';
import 'network_config.dart';
import 'network_exception.dart';
import 'api_result.dart';

class ApiClient {
  late final Dio _dio;

  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;

  ApiClient._internal() {
    final options = BaseOptions(
      baseUrl: NetworkConfig.baseUrl,
      connectTimeout: NetworkConfig.connectTimeout,
      receiveTimeout: NetworkConfig.receiveTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    _dio = Dio(options);

    /// ✅ 可拓展：添加 Token、日志、加密等拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // 🟡 TODO: 动态 token 注入
        // options.headers['Authorization'] = 'Bearer ${AuthManager.token}';

        // 🟡 TODO: 参数加密/签名
        // options.queryParameters = encryptParams(options.queryParameters);

        return handler.next(options);
      },
      onResponse: (response, handler) => handler.next(response),
      onError: (error, handler) => handler.next(error),
    ));
  }

  /// 封装 GET 请求
  Future<ApiResult<T>> get<T>(
      String path, {
        Map<String, dynamic>? queryParameters,
        T Function(dynamic json)? parser,
      }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      final data = response.data;
      return ApiResult.success(parser != null ? parser(data) : data);
    } catch (e) {
      return ApiResult.failure(NetworkException.fromDioError(e).message);
    }
  }

  /// 封装 POST 请求
  Future<ApiResult<T>> post<T>(
      String path, {
        Map<String, dynamic>? data,
        T Function(dynamic json)? parser,
      }) async {
    try {
      final response = await _dio.post(path, data: data);
      final responseData = response.data;
      return ApiResult.success(parser != null ? parser(responseData) : responseData);
    } catch (e) {
      return ApiResult.failure(NetworkException.fromDioError(e).message);
    }
  }

// 🟡 TODO: 支持 PUT / DELETE / PATCH 同样封装

// 🟡 TODO: 上传文件
// Future<ApiResult<String>> uploadFile(String path, File file) async {}

// 🟡 TODO: 下载文件
// Future<ApiResult<File>> downloadFile(String url, String savePath) async {}
}
