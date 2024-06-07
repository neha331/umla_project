// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:google_sign_in/google_sign_in.dart';

// class UserController {

//   static Future<User?> loginWithGoogle() async {

//    final googleAccount =await GoogleSignIn().signIn();

//    final googleAuth =await googleAccount?.authentication;

//    final credential= GoogleAuthProvider.credential( accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken, );

//    final userCredential= await FirebaseAuth.instance.signInWithCredential(credential, );

//   return userCredential.user;
//  }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserController {
  static Future<User?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleAccount = await GoogleSignIn().signIn();
      if (googleAccount != null) {
        final GoogleSignInAuthentication googleAuth = await googleAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        return userCredential.user;
      }
    } catch (e) {
      throw FirebaseAuthException(message: 'Failed to sign in with Google: $e', code: 'ERROR_GOOGLE_SIGN_IN');
    }
    return null;
  }
}
