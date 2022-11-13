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
      print(e);
    }
    return response;
  }
}
