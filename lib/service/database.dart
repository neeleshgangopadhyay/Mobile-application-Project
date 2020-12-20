import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proctor/models/students.dart';

class FirestoreService {

  final String uid ;
  FirestoreService ({this.uid});
  final CollectionReference usercollection = FirebaseFirestore.instance.collection('users') ;
  final CollectionReference noticecollection = FirebaseFirestore.instance.collection('notices');

  //obtains user data
  Future updateUserData(String email , String name , int sem , String course , String contact) async {
    return await usercollection.doc(uid).set({
      'email': email ,
      'name': name ,
      'sem' : sem ,
      'course': course ,
      'contact': contact ,
    });
  }

  List<Student> _userinfofromsnapshot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc){
      return Student(
        name: doc["name"],
        email: doc["email"],
        sem: doc["sem"],
        course: doc["course"],
        contact:doc["contact"],
        );
    }).toList();
  }
  //providing a stream to above function object
  Stream<List<Student>> get users {
    return usercollection.snapshots()
    .map((_userinfofromsnapshot));
  }


    //



  //
}