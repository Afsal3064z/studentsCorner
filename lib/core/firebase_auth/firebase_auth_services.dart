// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseAuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create a Rx<User?> variable to hold the authenticated user
  Rx<User?> user = Rx<User?>(null);

  // RxBool to indicate loading state
  RxBool isLoading = false.obs;

  // Getter to access the user value
  User? get currentUser => user.value;

  @override
  void onInit() {
    super.onInit();
    // Listen to changes in authentication state
    _auth.authStateChanges().listen((User? user) {
      this.user.value = user;
    });
  }

  // This is the method to create the user with email, password, and name
  Future<User?> signUpWithEmailAndPasswordAndName(
    String email,
    String password,
    String name,
  ) async {
    try {
      isLoading.value = true;

      // Create user with email and password
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the authenticated user from the UserCredential
      User? user = credential.user;

      if (user != null) {
        print("User signed up successfully: ${user.uid}");
        // Update user profile with the provided name
        await user.updateDisplayName(name);

        // Reload the user to ensure that the updated display name is reflected
        await user.reload();
        print("User profile updated: ${user.displayName}");

        // Return the updated user
        return _auth.currentUser;
      } else {
        print("User is null after signing up");
        return null;
      }
    } on FirebaseAuthException catch (e) {
      print("Signup error: ${e.message}");
      rethrow; // Rethrow the exception to handle it in the calling code
    } catch (e) {
      print("Unexpected error during signup: $e");
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  // This is the method to sign in the user using the email and password
// This is the method to sign in the user using the email and password
  Future<User?> logInWithEmailAndPassword(String email, String password) async {
    try {
      isLoading.value = true;
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the authenticated user from the UserCredential
      User? user = credential.user;

      if (user != null) {
        print("User logged in successfully: ${user.uid}");
        return user;
      } else {
        print("User is null after logging in");
        return null;
      }
    } on FirebaseAuthException catch (e) {
      print("Login error: ${e.message}");
      // Handle the error, e.g., show a snackbar or return an error message
      return null;
    } catch (e) {
      print("Unexpected error during login: $e");
      // Handle unexpected errors
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  // Logout method
  Future<void> logOut() async {
    try {
      await _auth.signOut();
      print("User logged out successfully");
    } catch (e) {
      print("Error during logout: $e");
    }
  }
}
