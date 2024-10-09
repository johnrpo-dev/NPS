import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> syncCalificacion(Map<String, dynamic> data) async {
    await _firestore.collection('calificaciones').add(data);
  }
}
