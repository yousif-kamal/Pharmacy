import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential?> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    UserCredential? credential;
    try {
      credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('error', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('error', 'The account already exists for that email.');
      } else {
        Get.snackbar('error', e.message.toString());
      }
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
    return credential;
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    UserCredential? credential;

    try {
      credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong information provided for that user.');
      } else {
        Get.snackbar('Error', e.message.toString());
      }
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
    return credential;
  }

  // Future<void> verivywithphonenumber() async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: '+44 7123 123 456',
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       // ANDROID ONLY!

  //       // Sign the user in (or link) with the auto-generated credential
  //       await auth.signInWithCredential(credential);
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       if (e.code == 'invalid-phone-number') {
  //         print('The provided phone number is not valid.');
  //       }

  //       // Handle other errors
  //     },
  //     codeSent: (String verificationId, int? resendToken) async {
  //       // Update the UI - wait for the user to enter the SMS code
  //       String smsCode = 'xxxx';

  //       // Create a PhoneAuthCredential with the code
  //       PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //           verificationId: verificationId, smsCode: smsCode);

  //       // Sign the user in (or link) with the credential
  //       await auth.signInWithCredential(credential);
  //     },
  //     timeout: const Duration(seconds: 60),
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }
}
