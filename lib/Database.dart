import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clubrecruitment/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class addcard
{
  addcard();
  final CollectionReference Cards = FirebaseFirestore.instance.collection('Carddata');

  Future carddata(var question ,var answer )async
  {
    return await Cards.doc().set({
      'question':question,
      'answer':answer,
    });

  }



}