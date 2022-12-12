import 'dart:convert';
import 'dart:io';

import 'package:calculator_imc/bloc/service_bloc/coment_service.dart';
import 'package:calculator_imc/bloc/service_bloc/custom_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:calculator_imc/bloc/service_bloc/service_model.dart';

class ServiceRespositoty {
  static var client = http.Client();
  var server = "https://server.freela.co.mz";
  Future<List<ServiceModel>> getServices() async {
    try {
      final response = await client.get(Uri.parse("$server/service/todos"),
          headers: {'Content-Type': 'application/json'});

      var data = json.decode(utf8.decode(response.bodyBytes));

      var service = await data["object"]
          .map<ServiceModel>((json) => ServiceModel.fromJson(json))
          .toList();

      return service;
    } on SocketException {
      throw FetchDataException("Sem conexão com a Internet");
    }
  }

  Future<List<ServiceModel>> getServicesByOwner(String email) async {
    try {
      final response = await client.get(Uri.parse("$server/mobile/$email"),
          headers: {'Content-Type': 'application/json'});

      var data = json.decode(utf8.decode(response.bodyBytes));

      var service = await data["object"]
          .map<ServiceModel>((json) => ServiceModel.fromJson(json))
          .toList();
      return service;
    } on SocketException {
      throw FetchDataException("Sem conexão com a Internet");
    }
  }

  Future<List<ServiceModel>> getService(int id) async {
    try {
      var response = await Dio().get("$server/subcategory/$id/");
      List<ServiceModel> services = [];

      for (var service in response.data['object']) {
        services.add(ServiceModel.fromJson(service));
      }

      return services;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw const SocketException('Connection timeout');
      } else {
        throw "Sem conexão com a Internet";
      }
    }
  }

  Future<List<ComentService>> getComentService(int id) async {
    try {
      var response = await Dio().get("https://server.freela.co.mz/comment/$id");

      List<ComentService> services = [];

      for (var service in response.data['content']) {
        services.add(ComentService.fromJson(service));
      }

      print(services);

      return services;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw const SocketException('Connection timeout');
      } else {
        throw "Sem conexão com a Internet";
      }
    }
  }

  Future<bool> setRate(String email, int rate, int id) async {
    try {
      var response = await Dio()
          .get("https://server.freela.co.mz/service/rate/$email/$rate/$id",
              options: Options(
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                },
              ));

      if (response.statusCode == 200) {
        Future.delayed(const Duration(milliseconds: 200), () {
          //Get.snackbar("Info", "Voce Ad", backgroundColor: Color(Colors.rd));
        });
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw const SocketException('Connection timeout');
      } else {
        throw "Sem conexão com a Internet";
      }
    }
  }
}
