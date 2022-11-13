import 'package:http/http.dart' as http;
import 'package:prueba_ceiba_flutter/repositorio/urls.dart';

import 'httpservice.dart';

class ApiServicios {
  ///Para traer todos los usuarios
  Future<http.Response?> traerListadoUsuarios() async {
    http.Response? response;

    try {
      response = await HttpService().get(ruta: UrlsApp.urlUsuarios);
    } catch (e) {
      return response;
    }
    return response;
  }

  ///Para traer post por Usuario
  Future<http.Response?> traerListadoPostsPorUsuario(String idUsuario) async {
    http.Response? response;

    try {
      response =
          await HttpService().get(ruta: UrlsApp.urlPostsPorUsuario + idUsuario);
    } catch (e) {
      return response;
    }
    return response;
  }
}
