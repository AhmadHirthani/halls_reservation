import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {

  Future<List> getHalls () {
    return  Firestore.instance.collection("halls").getDocuments().asStream().toList() ;
  }
}




