import 'dart:developer';

import 'package:devit_driweather/app/data/models/weather_model.dart';
import 'package:devit_driweather/app/data/services/api_endpoint.dart';
import 'package:devit_driweather/app/data/services/network_services.dart';
import 'package:dio/dio.dart';

import '../../../main.dart';

class WeatherRepository {
  final ApiRequest _request = ApiRequest();

  Future<WeatherModel> getWeather({required String location}) async {
    try {
      final response = await _request.get(
        '$baseUrl/weather/forecast',
        queryParameters: {
          'location': location,
          'apikey': apiKey,
        },
      );

      WeatherModel? data;
      if (response.statusCode == 200) {
        log(response.data['location'].toString());
        data = WeatherModel.fromJson(response.data['timelines']['hourly'][0]);
        log(data.toString());
        return data;
      } else {
        throw Exception('Gagal memuat data weather');
      }
    } on DioException catch (e) {
      log(e.response!.data.toString());
      throw Exception('Terjadi kesalahan saat memuat data weather');
    }
  }

  Future<Map> getWeatherForecast({required String location}) async {
    try {
      final response = await _request.get(
        '$baseUrl/weather/forecast',
        queryParameters: {
          'location': location,
          'apikey': apiKey,
        },
      );

      Map<String, dynamic> data = {};
      if (response.statusCode == 200) {
        log(response.data['location'].toString());
        data = response.data['timelines'];
        log(data.toString());
        return data;
      } else {
        throw Exception('Gagal memuat data weather');
      }
    } on DioException catch (e) {
      log(e.response!.data.toString());
      throw Exception('Terjadi kesalahan saat memuat data weather hourly');
    }
  }

  // Future<List<WeatherModel>> getWeatherDaily({required String location}) async {
  //   try {
  //     final response = await _request.get(
  //       '$baseUrl/weather/forecast',
  //       queryParameters: {
  //         'location': location,
  //         'apikey': apiKey,
  //       },
  //     );

  //     List<WeatherModel> data = [];
  //     List<dynamic> dataDaily = response.data['timelines']['daily'];
  //     if (response.statusCode == 200) {
  //       log(response.data['location'].toString());
  //       data = dataDaily.map((e) => WeatherModel.fromJson(e)).toList();
  //       log(data.toString());
  //       return data;
  //     } else {
  //       throw Exception('Gagal memuat data provinsi');
  //     }
  //   } on DioException catch (e) {
  //     log(e.response!.data.toString());
  //     throw Exception('Terjadi kesalahan saat memuat data provinsi');
  //   }
  // }
}
