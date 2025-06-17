import 'package:soptify/data/model/auth/create_user.dart';

abstract class AuthRepository {
  Future<void> signup(CreateUser createUser);
  Future<void> signin();
}
