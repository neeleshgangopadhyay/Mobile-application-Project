import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proctor_system/mode/teacher.dart';
import 'package:proctor_system/mode/user.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference teacherCollection =  Firestore.instance.collection('teacher');

   Future updateUserData(String name,String phonenumber,String post,String degree,String message) async{
       return await teacherCollection.document(uid).setData({
         'name': name,
         'phonenumber':phonenumber,
         'post':post,
         'degree':degree,
         'message':message,



       });



   }
   List<Teacher> _teacherListFromSnapshot(QuerySnapshot snapshot)
   {
      return snapshot.documents.map((doc){
        return Teacher(

          name: doc.data['name'] ??'',
          phonenumber:doc.data['phonenumber'] ??'000000',
          degree:doc.data['degree'] ??'Bed',
           post:doc.data['post'] ??'Asst',
          message:doc.data['message'] ??'This is empty message'

        );


      }


      ).toList();

   }
   Userdata _userDataFromSnapshot(DocumentSnapshot snapshot)
   {
       return Userdata(
         uid: uid,
         name: snapshot.data['name'],
         phonenumber: snapshot.data['phonenumber'],
         degree: snapshot.data['degree'],
         post: snapshot.data['post'],
         message: snapshot.data['message'],



       );


   }



  Stream< List<Teacher>> get teacher{

    return  teacherCollection.snapshots()
    .map(_teacherListFromSnapshot);
  }
  Stream<Userdata> get userData{
    return teacherCollection.document(uid).snapshots()
       .map(_userDataFromSnapshot);

  }

}

