import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpService {
  HttpService._internal();

  factory HttpService() {
    return _instance;
  }

  static final HttpService _instance = HttpService._internal();

  Future<http.Response?> get(
      {required String ruta, required String token}) async {
    Response? respuesta;
    try {
      respuesta = await http
          .get(
        Uri.parse(ruta),
      )
          .timeout(const Duration(seconds: 15), onTimeout: () {
        throw "timeout";
      });
    } catch (e) {
      throw "error_servicio";
    }
    return respuesta;
  }
}
