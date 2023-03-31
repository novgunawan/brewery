// ignore_for_file: constant_identifier_names, unnecessary_null_comparison

import 'package:brewery/base/base.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkResponse {
  final dynamic data;
  final String? errorMessage;

  NetworkResponse(this.data, this.errorMessage);

  factory NetworkResponse.success(dynamic data) {
    return NetworkResponse(data, null);
  }

  factory NetworkResponse.failed(String errorMessage) {
    return NetworkResponse(null, errorMessage);
  }
}

enum RequestType { GET, POST, DELETE, PUT, PATCH }

enum PaymentType { eadvice, reservation, eneeds }
// enum Status { SUCESSS, ERROR }

class NetworkHelper {
  late Dio _dio;

  BuildContext? buildContext;

  NetworkHelper() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
    _dio.interceptors.clear();
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));

    _dio.interceptors
        .add(QueuedInterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (resp, handler) {
      if (resp.data != null) {
        //on success it is getting dd called here
        return handler.next(resp);
      } else {
        return;
      }
    }));
  }

  Future<NetworkResponse> apiCall(
      String url,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      RequestType requestType) async {
    late Response result;

    try {
      switch (requestType) {
        case RequestType.POST:
          {
            result = await _dio.post(url,
                data: body,
                options: Options(
                  followRedirects: true,
                  validateStatus: (status) {
                    return status! < 500;
                  },
                ));
            break;
          }
        case RequestType.GET:
          {
            result = await _dio.get(url,
                queryParameters: queryParameters,
                options: Options(
                  followRedirects: true,
                  validateStatus: (status) {
                    return status! < 500;
                  },
                ));
            break;
          }
        case RequestType.DELETE:
          {
            result = await _dio.delete(url,
                queryParameters: queryParameters,
                options: Options(
                  followRedirects: true,
                  validateStatus: (status) {
                    return status! < 500;
                  },
                ));
            break;
          }
        case RequestType.PATCH:
          {
            result = await _dio.patch(url,
                data: body,
                options: Options(
                  followRedirects: true,
                  validateStatus: (status) {
                    return status! < 500;
                  },
                ));
            break;
          }
        case RequestType.PUT:
          {
            result = await _dio.put(url,
                data: body,
                options: Options(
                  followRedirects: true,
                  validateStatus: (status) {
                    return status! < 500;
                  },
                ));
            break;
          }
      }
      final status = result.statusCode as int;
      if (status > 299) {
        if (status == 401) {
          final cacheErrorPath = result.requestOptions.path;
          final cacheErrorMethod = result.requestOptions.method;
          final cacheCancelToken = result.requestOptions.cancelToken;
          final cacheOnReceiveProgress =
              result.requestOptions.onReceiveProgress;
          final cacheOnSendProgress = result.requestOptions.onSendProgress;
          final cacheQueryParameter = result.requestOptions.queryParameters;
          final cacheData = result.requestOptions.data;

          // get http method
          _dio.options.headers["Accept"] = "*/*";

          // recall previous api again
          final response = await _dio.request(cacheErrorPath,
              options: Options(method: cacheErrorMethod),
              cancelToken: cacheCancelToken,
              onReceiveProgress: cacheOnReceiveProgress,
              onSendProgress: cacheOnSendProgress,
              queryParameters: cacheQueryParameter,
              data: cacheData);
          // if response != nil
          if (response != null) {
            return NetworkResponse.success(response.data);
          } else {
            return NetworkResponse.failed('Something Failed');
          }
        }
        if (result.data["message"] != null) {
          return NetworkResponse.failed(result.data["message"]);
        } else {
          return NetworkResponse.failed('Something Failed');
        }
      }
      if (result.data != null) {
        return NetworkResponse.success(result.data);
      } else {
        return NetworkResponse.failed('Data is null');
      }
    } on DioError catch (error) {
      if (error.response?.statusCode == 401) {
        // TODO: Return to Login Page
        // navigatorKey.currentState?.pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (context) {
        //   return const Login();
        // }), (route) => false);
      }
      return NetworkResponse.failed(error.message ?? 'Something\'s wrong');
    } catch (error) {
      return NetworkResponse.failed(error.toString());
    }
  }
}

class ErrorInterceptors extends Interceptor {
  final Dio dio;

  ErrorInterceptors(this.dio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw TimeOutException(err.requestOptions);
      case DioErrorType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.connectionTimeout:
        break;
      case DioErrorType.badCertificate:
        break;
      case DioErrorType.connectionError:
        break;
      case DioErrorType.unknown:
        break;
    }
    return handler.next(err);
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class TimeOutException extends DioError {
  TimeOutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
