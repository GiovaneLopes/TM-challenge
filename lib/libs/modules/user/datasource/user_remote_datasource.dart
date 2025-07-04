import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tm_challenge/libs/modules/user/models/user_model.dart';

abstract class UserRemoteDatasource {
  Future<UserModel?> getUser();

  Future<void> createUser({
    required UserModel user,
    required String password,
  });

  Future<void> deleteUser({
    required String cpf,
  });
  Future<void> signIn({
    required String cpf,
    required String password,
  });
  Future<void> signOut();
  Future<void> resetPassword({
    required String email,
  });
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  UserRemoteDatasourceImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  @override
  Future<UserModel?> getUser() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user == null) {
        return null;
      }
      final cpf = user.email?.split('@').first;
      final snapshot =
          await firebaseFirestore.collection('users').doc(cpf).get();
      if (snapshot.exists) {
        return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } on FirebaseException catch (e) {
      throw Exception('Error fetching user: ${e.message}');
    }
  }

  @override
  Future<void> createUser({
    required UserModel user,
    required String password,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: '${user.cpf}@insurancecompany.com',
        password: password,
      );
      await firebaseFirestore
          .collection('users')
          .doc(user.cpf)
          .set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw Exception('Error creating user: ${e.message}');
    } on FirebaseException catch (e) {
      throw Exception('Erro ao salvar perfil no Firestore: ${e.message}');
    }
  }

  @override
  Future<void> deleteUser({required String cpf}) async {
    try {
      await firebaseAuth.signOut();
      await firebaseFirestore.collection('users').doc(cpf).delete();
    } on FirebaseAuthException catch (e) {
      throw Exception('Error deleting user: ${e.message}');
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception('### Error resetting password: ${e.message}');
    }
  }

  @override
  Future<void> signIn({required String cpf, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: '$cpf@insurancecompany.com',
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception('Error signing in: ${e.message}');
    }
  }

  @override
  Future<void> signOut() {
    try {
      return firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception('Error signing out: ${e.message}');
    }
  }
}
