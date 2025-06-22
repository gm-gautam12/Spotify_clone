import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soptify/data/model/auth/create_user.dart';
import 'package:dartz/dartz.dart';
import 'package:soptify/data/model/auth/signin_user.dart';
abstract class AuthFirebaseService {
  Future<Either>signup(CreateUser createUser);
  Future<Either>signin(SigninUser signinUser);
}


class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUser signinUser) async {
     try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: signinUser.email,
      password: signinUser.password
      );


      return Right('Sign In was successful');
    } on FirebaseAuthException catch (e) {
        String message = '';

        if(e.code == 'invalid-email'){
          message = 'No user found for this email';
        }else if(e.code == 'invalid-credential'){
          message = 'Wrong password provided for email';
        }

        return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUser createUser) async{
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: createUser.email,
      password: createUser.password
      );

      FirebaseFirestore.instance.collection('users').doc(data.user?.uid).set(
        {
          "name": createUser.fullName,
          "email": data.user?.email
        }
      );

      return Right('Signup was successful');
    } on FirebaseAuthException catch (e) {
        String message = '';

        if(e.code == 'weak-password'){
          message = 'The password is too weak';
        }else if(e.code == 'email-already-in-use'){
          message = 'An account already exist with that email';
        }

        return Left(message);
    }
  }

}