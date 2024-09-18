
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes.dart';

class AuthController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController= TextEditingController();

final FirebaseAuth _auth = FirebaseAuth.instance;

// Sign up with email and password
Future<UserCredential?> signUpWithEmailAndPassword(
   ) async {
  try {
    UserCredential userCredential=
    await _auth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text.trim(),
    );
    if (userCredential.user != null) {
      CollectionReference collection = FirebaseFirestore.instance.collection(
          'users');

      Map<String, dynamic> data = {

        'email': emailController.text,
      'name': nameController.text,
        'password': passwordController.text.trim(),


        'id': userCredential.user!.uid,

        'created_at': FieldValue.serverTimestamp(),
      };

      await collection.doc(userCredential.user!.uid).set(data);

      Get.snackbar("Félicitations!", "Le client a été ajouté avec succès");

      Get.back();
    }
   //return userCredential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Get.snackbar('Échec', 'Le mot de passe est trop faible');
    } else if (e.code == 'email-already-in-use') {
      Get.snackbar('Échec', 'Cet email est déjà utilisé');
    }
  } catch (e) {
    Get.snackbar('Échec', 'Erreur d\'authentification: ${e}');
  }
  return null;
}

// Sign in with email and password
Future<UserCredential?> signInWithEmailAndPassword(
  ) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text.trim(),
    );
    if (userCredential.user != null) {
    Get.toNamed(
        RoutesClass.getPostsRoute());}
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Get.snackbar('Échec', 'No user found');
    } else if (e.code == 'wrong-password') {
      Get.snackbar('Échec', 'wrong password');
    }
  } catch (e) {
    Get.snackbar('Échec', 'Une erreur inattendue s\'est produite: $e');
  }
  return null;
}}