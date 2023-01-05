import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> signUpUSers(
      String email, String fullName, String password) async {
    String res = 'some error occured';

    try {
      if (email.isNotEmpty && fullName.isNotEmpty && password.isNotEmpty) {
        // / CREATING  IN FIREBASE AUTH USER
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        /// STORE USER TO FIRESTORE DATEBASE

        await _firestore.collection('buyers').doc(cred.user!.uid).set({
          'emailAdress': email,
          'fullName': fullName,
          'buyerUid': cred.user!.uid,
          'address': '',
        });
        res = 'success';

        print(cred.user!.email);
      } else {
        res = 'please fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> loginUsers(String email, String password) async {
    String res = 'some error occured';

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        //LOGGING IN THE CURRENT USER

        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        res = 'logged in';
      } else {
        res = 'Please Fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  // logout() async {
  //   await _auth.signOut();
  // }
}
