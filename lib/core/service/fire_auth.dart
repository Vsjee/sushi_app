import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // google signin
  signInWithGoogle() async {
    // begin interactive signin process
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // create a new credential for user
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // finally signin
    return await _firebaseAuth.signInWithCredential(credential);
  }

  // logout
  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await _firebaseAuth.signOut();
  }
}

// riverpod providers
final authInstanceProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final customerIdProvider = StateProvider<String>((ref) => '');
