import 'package:firebase_auth/firebase_auth.dart';
import 'database.dart';
import 'package:proctor_system/mode/user.dart';

class AuthService
{


  final FirebaseAuth _auth = FirebaseAuth.instance ;
  User _userFromFirebaseUser(FirebaseUser user)
  {

    return user != null ? User(id: user.uid) : null;
  }

  Stream<User> get user{
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);

  }
  Future signInWithEmailAndPassword(String email,String password)async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);


    }catch(e)
    {
      print(e.toString());
      return null;

    }

  }





// register with the email and the password
  Future registerWithEmailAndPassword(String email,String password)async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //create a new document
      await DatabaseService(uid: user.uid).updateUserData('new teacher','000000','asst','bsc','Message will be send by Proctor');
      return _userFromFirebaseUser(user);


    }catch(e)
    {
      print(e.toString());
      return null;

    }

  }


}

