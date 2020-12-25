import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proctor_system/model/student.dart';
import 'package:proctor_system/model/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference studentCollection = Firestore.instance.collection('student');

  Future updateUserData(String name, String phonenumber, String post, String degree,int year,String teach,String course1,String course2,String course3,String course4,String course5,String code1,String code2,String code3,String code4,String code5,int grade1,int grade2,int grade3,int grade4,int grade5 ) async {
    return await studentCollection.document(uid).setData({
      'name': name,
      'phonenumber': phonenumber,
      'post': post,
      'degree': degree,
      'year': year,
      'teach': teach,
      'course1': course1,
      'course2':course2,
      'course3':course3,
      'course4':course4,
       'course5':course5,
        'code1':code1,
        'code2':code2,
         'code3':code3,
      'code4':code4,
      'code5':code5,
       'grade1':grade1,
      'grade2':grade2,
      'grade3':grade3,
      'grade4':grade4,
      'grade5':grade5,


    });
  }

  List<Student> _studentListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.documents.map((doc){
      return Student(

          name: doc.data['name'] ??'',
          phonenumber:doc.data['phonenumber'] ??'000000',
          degree:doc.data['degree'] ??'BEd',
          post:doc.data['post'] ??'Asst',
          year:doc.data['year'] ??0,
         teach: doc.data['teach'] ??'Teacher',
          course1:doc.data['course1']??'Course1',
          course2:doc.data['course2']??'Course2',
          course3:doc.data['course3']??'Course3',
          course4:doc.data['course4']??'Course4',
          course5:doc.data['course5']??'Course5',
          code1:doc.data['code1']??'Code1',
          code2: doc.data['code2']??'Code2',
          code3: doc.data['code3']??'Code3',
          code4: doc.data['code4']??'Code4',
          code5: doc.data['code5']??'Code5',
          grade1: doc.data['grade1']??0,
          grade2: doc.data['grade4']??0,
          grade3: doc.data['grade3']??0,
          grade4: doc.data['grade4']??0,
          grade5: doc.data['grade5']??0,

      );


    }


    ).toList();

  }
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot)
  {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      phonenumber: snapshot.data['phonenumber'],
      degree: snapshot.data['degree'],
      post: snapshot.data['post'],
      year: snapshot.data['year'],
      teach: snapshot.data['teach'],
      course1: snapshot.data['course1'],
      course2: snapshot.data['course2'],
      course3: snapshot.data['course3'],
      course4: snapshot.data['course4'],
      course5: snapshot.data['course5'],
      code1: snapshot.data['code1'],
      code2: snapshot.data['code2'],
      code3: snapshot.data['code3'],
      code4: snapshot.data['code4'],
      code5: snapshot.data['code5'],
      grade1: snapshot.data['grade1'],
      grade2: snapshot.data['grade2'],
      grade3: snapshot.data['grade3'],
      grade4: snapshot.data['grade4'],
      grade5: snapshot.data['grade5'],





    );


  }


  Stream<List<Student>> get student{

    return  studentCollection.snapshots()
        .map(_studentListFromSnapshot);

  }
// get user doc stream

  Stream<UserData> get userData{
    return studentCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);

  }

}