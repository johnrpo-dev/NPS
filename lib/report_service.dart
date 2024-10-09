import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';

Future<void> generarReporteCSV(List<Map<String, dynamic>> calificaciones) async {
  // Crear la lista de encabezados para el CSV
  List<List<dynamic>> rows = [
    ["ID", "Categoría", "Puntuación", "Comentario", "Fecha"]
  ];

  // Iterar sobre las calificaciones para crear filas
  for (var calificacion in calificaciones) {
    rows.add([
      calificacion['id'],
      calificacion['categoria'],
      calificacion['puntuacion'],
      calificacion['comentario'],
      calificacion['fecha']
    ]);
  }

  // Convertir las filas en formato CSV
  String csv = const ListToCsvConverter().convert(rows);

  // Obtener el directorio para guardar el archivo
  final directory = await getApplicationDocumentsDirectory();
  final path = '${directory.path}/reporte.csv';
  final file = File(path);

  // Escribir el archivo CSV
  await file.writeAsString(csv);

  print('Reporte CSV generado en: $path');
}
