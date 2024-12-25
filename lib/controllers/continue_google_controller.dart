import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medicine_delivery/controllers/profile_controller.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ProfileController controller = Get.put(ProfileController());


  Future<User?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null; // The user canceled the sign-in
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credentials
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      // Save the user data to Firestore
      if (user != null) {
        DocumentReference userDoc = _firestore.collection('users').doc(user.uid);

        // Check if the user already exists in Firestore
        DocumentSnapshot docSnapshot = await userDoc.get();
        if (!docSnapshot.exists) {
          await userDoc.set({
            'uid': user.uid,
            'name': user.displayName,
            'email': user.email,
            'photoUrl': user.photoURL,
            'phone': user.phoneNumber ?? '',
            'createdAt': FieldValue.serverTimestamp(),
          });
        }

        // Trigger a refresh of the user data
        final ProfileController controller = Get.find();
        await controller.fetchUserData();
      }

      return user;
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }


  // Future<User?> signInWithGoogle() async {
  //   try {
  //     // Trigger the Google Sign-In flow
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser == null) {
  //       return null; // The user canceled the sign-in
  //     }
  //
  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //
  //     // Create a new credential
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //
  //     // Sign in to Firebase with the Google credentials
  //     final UserCredential userCredential = await _auth.signInWithCredential(credential);
  //     final User? user = userCredential.user;
  //
  //     // Save the user data to Firestore
  //     if (user != null) {
  //       DocumentReference userDoc = _firestore.collection('users').doc(user.uid);
  //
  //       // Check if the user already exists in Firestore
  //       DocumentSnapshot docSnapshot = await userDoc.get();
  //       if (!docSnapshot.exists) {
  //         await userDoc.set({
  //           'uid': user.uid,
  //           'name': user.displayName,
  //           'email': user.email,
  //           'photoUrl': user.photoURL,
  //           'phone': user.phoneNumber ?? '',
  //           'createdAt': FieldValue.serverTimestamp(),
  //         });
  //       }
  //     }
  //
  //     return user;
  //   } catch (e) {
  //     print('Error signing in with Google: $e');
  //     return null;
  //   }
  // }


  // Future<User?> signInWithGoogle() async {
  //   try {
  //     // Trigger the Google Sign-In flow
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser == null) {
  //       return null; // The user canceled the sign-in
  //     }
  //
  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication googleAuth =
  //     await googleUser.authentication;
  //
  //     // Create a new credential
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //
  //     // Sign in to Firebase with the Google credentials
  //     final UserCredential userCredential =
  //     await _auth.signInWithCredential(credential);
  //
  //     return userCredential.user;
  //   } catch (e) {
  //     print('Error signing in with Google: $e');
  //     return null;
  //   }
  // }


  Future<void> signOut() async {
    // Clear ProfileController data and reset navigation
    ProfileController controller = Get.find();
    controller.clearUserData();
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
