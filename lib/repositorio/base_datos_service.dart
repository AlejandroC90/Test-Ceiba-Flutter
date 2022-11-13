import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'model/usuario.dart';

class BaseDatosService {
  Future<void> guardarUsuariosBaseDatos(
      {required List<ModeloUsuario> listadoUsuarios}) async {
    try {
      Database basedeDatos = await inicializarBaseDatos(true);

      for (ModeloUsuario m in listadoUsuarios) {
        await basedeDatos.insert(
          'usuarios', //tabla
          m.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      //cerramos la base de datos al terminar
      basedeDatos.close();
    } catch (e) {
      return;
    }
  }

  Future<List<ModeloUsuario>> leerUsuariosBaseDatos() async {
    List<ModeloUsuario> listadoUsuarios = List.empty();
    try {
      listadoUsuarios = List.empty();

      Database basedeDatos = await inicializarBaseDatos(false);

      //Busco todas las entradas de usuarios
      final List<Map<String, dynamic>> maps =
          await basedeDatos.query('usuarios');

      basedeDatos.close();

      //mapeo la salida a una lista de usuarios
      return List.generate(maps.length, (i) {
        return ModeloUsuario(
          id: maps[i]['id'],
          nombre: maps[i]['nombre'],
          telefono: maps[i]['telefono'],
          correo: maps[i]['correo'],
        );
      });
    } catch (e) {
      return listadoUsuarios;
    }
  }

  //funcion que inicializa la base de datos al momento de guardar los usuarios
  Future<Database> inicializarBaseDatos(bool reiniciar) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'usuarios.db');

    if (reiniciar) {
      await deleteDatabase(path);
    }

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE usuarios (id INTEGER PRIMARY KEY, nombre TEXT, telefono TEXT, correo TEXT)');
    });
    return database;
  }
}
