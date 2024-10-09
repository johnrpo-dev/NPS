import 'package:connectivity_plus/connectivity_plus.dart';
import 'database_helper.dart';
import 'firebase_service.dart';

final dbHelper = DatabaseHelper();  // Instancia de la base de datos local
final firebaseService = FirebaseService();  // Instancia de la clase de Firebase

void syncIfOnline() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    // Si hay conexión, sincroniza los datos locales con Firebase
    var localData = await dbHelper.getLocalCalificaciones(); // Obtener datos de SQLite
    for (var data in localData) {
      await firebaseService.syncCalificacion(data);
    }
    // Luego de sincronizar, limpia la base de datos local
    await dbHelper.clearLocalDatabase();
  }
}
