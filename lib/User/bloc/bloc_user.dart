import 'package:basic_flutter/Place/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class UserBloc extends Bloc {
  final _auth_repository = AuthRepository();

  Future<UserCredential> signIn() async {
    return await _auth_repository.signInFirebase();
  }

  @override
  void dispose() {}
}
