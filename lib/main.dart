import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'database_helper.dart';  // Importa el archivo para SQLite
import 'firebase_service.dart';  // Importa el archivo para Firebase
import 'package:flutter/services.dart';  // Para retroalimentación háptica

// Inicializa las instancias globales de las clases
final dbHelper = DatabaseHelper();  // Instancia de SQLite
final firebaseService = FirebaseService();  // Instancia de Firebase

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Calificaciones',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    testSQLiteConnection();  // Prueba la conexión con SQLite
    testFirebaseConnection();  // Prueba la sincronización con Firebase
  }

  // Función para probar SQLite
  void testSQLiteConnection() async {
    try {
      // Crear una nueva calificación para probar la conexión
      Map<String, dynamic> nuevaCalificacion = {
        'categoria': 'Servicio',
        'puntuacion': 5,
        'comentario': 'Excelente servicio',
      };

      // Insertar en la base de datos
      await dbHelper.insertCalificacion(nuevaCalificacion);

      // Obtener todas las calificaciones
      List<Map<String, dynamic>> calificaciones = await dbHelper.getLocalCalificaciones();
      print('Calificaciones almacenadas en SQLite: $calificaciones');
    } catch (e) {
      print('Error en la conexión con SQLite: $e');
    }
  }

  // Función para probar la sincronización con Firebase
  void testFirebaseConnection() async {
    try {
      // Crear un objeto simulado de calificación para probar la sincronización
      Map<String, dynamic> calificacion = {
        'categoria': 'Servicio',
        'puntuacion': 4,
        'comentario': 'Muy buen servicio',
        'fecha': DateTime.now().toIso8601String(),
      };

      // Intentar sincronizar con Firebase
      await firebaseService.syncCalificacion(calificacion);
      print('Sincronización con Firebase exitosa');
    } catch (e) {
      print('Error en la sincronización con Firebase: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calificación de Satisfacción'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bienvenido a la app de calificación ✓...melo'),
            SizedBox(height: 20),  // Espacio entre el texto y el botón
            Semantics(
              container: true,
              label: 'Botón para enviar calificación',
              button: true,
              child: ElevatedButton(
                onPressed: _onCalificar,  // Llamada a la función de calificación
                child: const Text('Enviar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Función para gestionar la calificación
void _onCalificar() {
  HapticFeedback.mediumImpact();  // Proporciona retroalimentación háptica
  // Aquí iría el código para guardar la calificación en SQLite o Firebase
  print('Calificación enviada');  // Simulación de envío
}
