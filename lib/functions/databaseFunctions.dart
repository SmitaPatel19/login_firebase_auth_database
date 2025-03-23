import 'package:cloud_firestore/cloud_firestore.dart';

create(String collName, docName, name, animal, int age) async {
  //creates collection in the database in particular document.
  await FirebaseFirestore.instance.collection(collName).doc(docName).set({
    'name': name,
    'animal': animal,
    'age': age,
  });
  print('................Database Created.............');
}

update(String colName, docName, field, var newFieldVal) async{
  await FirebaseFirestore.instance.collection(colName).doc(docName).update({
    field: newFieldVal,
  });
  print('................Database Updated.............');
}

delete(String colName, docName) async{
  await FirebaseFirestore.instance.collection(colName).doc(docName).delete();
  print('................Database Deleted.............');
}

