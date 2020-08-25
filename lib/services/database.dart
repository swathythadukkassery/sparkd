import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final CollectionReference feedCollection = Firestore.instance.collection('feed');
}