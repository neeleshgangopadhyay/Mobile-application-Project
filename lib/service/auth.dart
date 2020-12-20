import 'package:firebase_auth/firebase_auth.dart';
import 'package:proctor/models/users.dart';
import 'package:proctor/service/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create appuser model
  AppUsers _toFirebaseuser(User user){
    return user!= null ? AppUsers( uid: user.uid, displayName: user.displayName, emailVerified: user.emailVerified, email: user.email ) : null ;
  } 

  //auth change user stream
  Stream<AppUsers> get user {
    return _auth.authStateChanges()
    .map((User user) => _toFirebaseuser(user));
  }

  // sign in anon
  Future signInAnonymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _toFirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and password
  Future registeremailpassword(String name, String email , String password, int sem , String course, String contact) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user= result.user;

      //creates a document in db.
      await FirestoreService(uid: user.uid).updateUserData(email, name , sem, course , contact);
      return _toFirebaseuser(user);
    }
    catch(e){
      print(e.toString());
      return null ;
    }
  }

  // sign in with google
  Future signInGoogle(AuthCredential credential) async {
    try {
      UserCredential result = await _auth.signInWithCredential(credential);
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signinEmailpassword(String email , String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user= result.user;
      return _toFirebaseuser(user);
    }
    catch(e){
      print(e.toString());
      return null ;
    }
  }


  // sign out
Future signout() async {
  try {
    return await _auth.signOut();
  }
  catch(e){
    print(e.toString());
    return null ;
  }

}


}