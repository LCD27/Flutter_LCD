import 'package:dio/dio.dart';

class CDDio {
  static CDDio? _cdDio;
  static Dio? _dio;

  factory CDDio() {
    if (_cdDio == null) {
      _cdDio = CDDio._();
      _dio = Dio(BaseOptions(
          baseUrl: '',
          connectTimeout: 5000,
          receiveTimeout: 20000,
          sendTimeout: 3000));
    }
    return _cdDio!;
  }

  CDDio._();

  post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    _dio?.post(path);
  }

  get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    _dio?.get(path);
  }
}
