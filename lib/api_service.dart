import 'dart:developer';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_1/constants.dart';
import 'package:flutter_test_1/models/user.dart';

class ApiService {

  // https://firebase.flutter.dev/docs/firestore/usage/
  Stream<QuerySnapshot> getTasks() {
    final firebaseDB = FirebaseFirestore.instance;
    return firebaseDB.collection("tasks").snapshots();
  }

  Future<void> addTask(String taskName) {
    final firebaseDB = FirebaseFirestore.instance;
    return firebaseDB.collection("tasks")
      .add({
        "createdAt": Timestamp.fromDate(DateTime.now()),
        "points": 2, // hard coded
        "state": "incomplete",  // hard coded
        "title": "${taskName}",
        "userId": "aaaaa"  // userId hard coded for now
      })
      .then((value) => print("Task added"))
      .catchError((onError) => print("Failed to add task: $onError"));
  }
}
