import 'package:firebase_auth/firebase_auth.dart';
import 'package:soptify/data/model/auth/create_user.dart';

abstract class AuthFirebaseService {
  Future<void>signup(CreateUser createUser);
  Future<void>signin();
}


class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<void> signin() {
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUser createUser) async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: createUser.email,
      password: createUser.password
      );
    } on FirebaseAuthException catch (e) {
      throw UnimplementedError();
    }
  }

}