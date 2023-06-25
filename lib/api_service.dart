import 'dart:developer';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_1/constants.dart';
import 'package:flutter_test_1/models/user.dart';

class ApiService {
  Future<dynamic> getUser() async {
    final firebaseDB = FirebaseFirestore.instance;
    await firebaseDB.collection("tasks").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
      return event.docs;
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      return throw Exception("Failed to load tasks.");
    });
  }
}
