import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app_elred/models/user_details.dart';
import 'package:todo_app_elred/services/storage_hive.dart';

class Authentication {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCred =
        await FirebaseAuth.instance.signInWithCredential(credential);

    User? user = userCred.user;

    HiveStorage.saveUserDetails(UserDetails(
      useruid: user?.uid ?? '',
      name: user?.displayName ?? '',
      emailid: user?.email ?? '',
      profileimage: user?.photoURL ?? '',
    ));

    return userCred;
  }

  Future<void> signOutWithGoogle() async {
    await GoogleSignIn().signOut();

    await auth.signOut();
  }
}
