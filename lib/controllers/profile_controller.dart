import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Reactive user data
  var userData = {}.obs;


  Future<void> fetchUserData() async {
    try {
      User? currentUser = _auth.currentUser;

      if (currentUser != null) {
        // Check if the user is logged in through Google
        if (currentUser.providerData.any((info) => info.providerId == 'google.com')) {
          // For Google login, fetch data directly from FirebaseAuth
          userData.value = {
            'name': currentUser.displayName ?? 'No Name',
            'email': currentUser.email ?? 'No Email',
            'photoUrl': currentUser.photoURL,
            'phone': currentUser.phoneNumber ?? 'No Phone',
          };
        } else {
          // For non-Google users, fetch data from Firestore
          DocumentSnapshot userDoc = await _firestore.collection('users').doc(currentUser.uid).get();

          if (userDoc.exists) {
            userData.value = userDoc.data() as Map<String, dynamic>;
          } else {
            // If user data doesn't exist in Firestore, fetch from FirebaseAuth
            userData.value = {
              'name': currentUser.displayName ?? 'No Name',
              'email': currentUser.email ?? 'No Email',
              'photoUrl': currentUser.photoURL,
              'phone': currentUser.phoneNumber ?? 'No Phone',
            };
          }
        }
      } else {
        userData.value = {}; // Clear data if no user is logged in
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch user data: $e");
    }
  }


  // Future<void> fetchUserData() async {
  //   try {
  //     User? currentUser = _auth.currentUser;
  //
  //     if (currentUser != null) {
  //       // Check if the user is logged in through Google
  //       if (currentUser.providerData.any((info) => info.providerId == 'google.com')) {
  //         // For Google login, we can fetch data directly from FirebaseAuth
  //         userData.value = {
  //           'name': currentUser.displayName ?? 'No Name',
  //           'email': currentUser.email ?? 'No Email',
  //           'photoUrl': currentUser.photoURL,
  //           'phone': currentUser.phoneNumber ?? 'No Phone',
  //         };
  //       } else {
  //         // For non-Google users, fetch data from Firestore
  //         DocumentSnapshot userDoc = await _firestore.collection('users').doc(currentUser.uid).get();
  //
  //         if (userDoc.exists) {
  //           userData.value = userDoc.data() as Map<String, dynamic>;
  //         } else {
  //           // If user data doesn't exist in Firestore, fetch from FirebaseAuth
  //           userData.value = {
  //             'name': currentUser.displayName ?? 'No Name',
  //             'email': currentUser.email ?? 'No Email',
  //             'photoUrl': currentUser.photoURL,
  //             'phone': currentUser.phoneNumber ?? 'No Phone',
  //           };
  //         }
  //       }
  //     } else {
  //       userData.value = {}; // Clear data if no user is logged in
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", "Failed to fetch user data: $e");
  //   }
  // }



  // Future<void> fetchUserData() async {
  //   try {
  //     User? currentUser = _auth.currentUser;
  //
  //     if (currentUser != null) {
  //       // Fetch user data from Firestore
  //       DocumentSnapshot userDoc =
  //       await _firestore.collection('users').doc(currentUser.uid).get();
  //
  //       if (userDoc.exists) {
  //         // Update the reactive userData map
  //         userData.value = userDoc.data() as Map<String, dynamic>;
  //       } else {
  //         // Handle case where user data is not in Firestore
  //         userData.value = {
  //           'name': currentUser.displayName,
  //           'email': currentUser.email,
  //           'photoUrl': currentUser.photoURL,
  //           'phone': currentUser.phoneNumber ?? '',
  //         };
  //       }
  //     } else {
  //       userData.value = {}; // Clear user data if no user is logged in
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", "Failed to fetch user data: $e");
  //   }
  // }


  // Fetch user data based on the currently logged-in user
  // Future<void> fetchUserData() async {
  //   try {
  //     User? currentUser = _auth.currentUser;
  //
  //     if (currentUser != null) {
  //       DocumentSnapshot userDoc =
  //       await _firestore.collection('users').doc(currentUser.uid).get();
  //
  //       // Update the reactive userData map
  //       userData.value = userDoc.data() as Map<String, dynamic>;
  //     } else {
  //       // Handle case where no user is logged in
  //       userData.value = {};
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", "Failed to fetch user data: $e");
  //   }
  // }

  // Called when user logs out
  void clearUserData() {
    userData.value = {};
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserData(); // Fetch user data when the controller is initialized
  }
}
