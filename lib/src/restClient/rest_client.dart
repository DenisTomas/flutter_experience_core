import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:fe_lab_clinicas_core/src/restClient/interceptors/auth_interceptor.dart';

final class RestClilent extends DioForNative {
  RestClilent(String baseUrl)
      : super(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 60),
        )) {
    interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
      AuthInterceptor(),
    ]);
  }

  RestClilent get auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  RestClilent get unAuth {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}
