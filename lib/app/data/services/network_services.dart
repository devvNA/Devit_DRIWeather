// ignore_for_file: deprecated_member_use, avoid_print, unused_element, unused_import
import 'dart:developer';
import 'dart:io';

import 'package:devit_driweather/app/data/services/api_endpoint.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:get_storage/get_storage.dart';

typedef JSON = Map<String, dynamic>;

class ApiRequest {
  Dio _dio = Dio();
  final box = GetStorage();

  ApiRequest() {
    _dio = Dio(
      BaseOptions(
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        contentType: "application/json",
      ),
    );
  }

  /// GET request
  Future<Response> get(String endpoint,
      {JSON? queryParameters, Object? data}) async {
    return await _dio.get(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );
  }

  /// POST request
  Future<Response> post(String endpoint,
      {JSON? queryParameters, Object? data}) async {
    return await _dio.post(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );
  }

  /// DELETE request
  Future<Response> delete(String endpoint,
      {JSON? queryParameters, Object? data}) async {
    return await _dio.delete(endpoint);
  }

  /// PUT request
  Future<Response> put(String endpoint,
      {JSON? queryParameters, Object? data}) async {
    return await _dio.put(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );
  }
}
