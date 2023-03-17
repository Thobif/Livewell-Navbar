import 'package:abc/query/name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class OTPService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  

  Future<String?> sendOTP(String phoneNumber) async {
  String? verificationId;

  try {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Error: ${e.message}');
      },
      codeSent: (String? id, int? token) {
        verificationId = id;
      },
      codeAutoRetrievalTimeout: (String id) {},
      timeout: const Duration(seconds: 5),
    );
  } catch (e) {
    print('Error: $e');
  }

  return verificationId;
}
  
  

  Future<void> verifyOTP(String verificationId, String otp, BuildContext context) async {
  try {
    await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    ));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => FirstPage()),
      (route) => false,
    );
  } catch (e) {
    print('Error: $e');
  }
}
}
