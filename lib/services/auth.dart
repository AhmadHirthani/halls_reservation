import 'package:firebase_auth/firebase_auth.dart';
import 'package:halls_reservation/models/user.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUsers(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null ;
  }

  Future signInAnnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUsers(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
