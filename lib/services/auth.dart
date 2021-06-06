import 'package:better_mentor/models/user.dart';
import "package:firebase_auth/firebase_auth.dart";

class AuthService{

  late FirebaseAuth _auth = FirebaseAuth.instance;

  getAuth() => _auth;

  //create user object based on firebase user
  CurrentUser? _userFromFirebaseUser(User? user){
    return user != null ? CurrentUser(uid: user.uid,
            username: user.displayName,
            email: user.email)
            : null ;
  }
  //auth change user stream
  Stream<CurrentUser?> get user{
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }
  //Sign in with email & password
  Future signInWithEmail({email, password}) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if(result.user != null) {
        CurrentUser? user = _userFromFirebaseUser(result.user);
        return user;
      }
    }catch(e){
      print(e.toString());
    }
    return null;
  }
  //sign in with google

  //register with email and password

  //sign out
}