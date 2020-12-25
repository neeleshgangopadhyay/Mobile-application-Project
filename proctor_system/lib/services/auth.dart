import 'package:firebase_auth/firebase_auth.dart';
import 'database.dart';
import 'package:proctor_system/model/user.dart';

class AuthService
{


final FirebaseAuth _auth = FirebaseAuth.instance ;
User _userFromFirebaseUser(FirebaseUser user)
{

   return user != null ? User(uid: user.uid) : null;
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
      await DatabaseService(uid: user.uid).updateUserData('new teacher','000000','asst','bsc',0000,'teacher','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,0);
     return _userFromFirebaseUser(user);


  }catch(e)
  {
     print(e.toString());
     return null;

  }

}


}

