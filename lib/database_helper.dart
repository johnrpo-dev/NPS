import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static late Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    String path = join(await getDatabasesPath(), 'calificaciones.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE calificacion (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        categoria TEXT,
        puntuacion INTEGER,
        comentario TEXT
      )
    ''');
  }

  Future<int> insertCalificacion(Map<String, dynamic> calificacion) async {
    var dbClient = await db;
    int result = await dbClient.insert('calificacion', calificacion);
    if (result != 0) {
      print('Calificación guardada correctamente en SQLite.');
      // También puedes obtener las calificaciones y mostrarlas
      List<Map<String, dynamic>> calificaciones = await getLocalCalificaciones();
      print('Calificaciones actuales en SQLite: $calificaciones');
    } else {
      print('Error al guardar la calificación.');
    }
    return result;
  }


  // Obtener todas las calificaciones locales
  Future<List<Map<String, dynamic>>> getLocalCalificaciones() async {
    var dbClient = await db;
    return await dbClient.query('calificacion');
  }

  // Limpiar todas las calificaciones locales después de sincronizarlas
  Future<void> clearLocalDatabase() async {
    var dbClient = await db;
    await dbClient.delete('calificacion');  // Esto borra todas las filas de la tabla
  }

  Future<int> deleteCalificacion(int id) async {
    var dbClient = await db;
    return await dbClient.delete('calificacion', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteCalificacionesEnBloque(List<int> ids) async {
    var dbClient = await db;
    var idsStr = ids.map((id) => id.toString()).join(',');
    return await dbClient.rawDelete('DELETE FROM calificacion WHERE id IN ($idsStr)');
  }
}
