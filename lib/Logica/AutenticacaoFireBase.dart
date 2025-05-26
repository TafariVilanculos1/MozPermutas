import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoFirebase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUtilizador({
    required String email,
    required String senha,
    required String confirmarSenha,
  }) async {
    if (senha != confirmarSenha) {
      return 'As palavras-passe não coincidem.';
    }

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return 'Utilizador registado com sucesso.';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'O e-mail já está em uso.';
      } else if (e.code == 'weak-password') {
        return 'A palavra-passe é demasiado fraca.';
      } else if (e.code == 'invalid-email') {
        return 'O e-mail inserido é inválido.';
      } else {
        return 'Erro ao criar conta: ${e.message}';
      }
    } catch (e) {
      return 'Erro inesperado: $e';
    }
  }


  Future<String?> loginUtilizador({
    required String email,
    required String senha,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return 'Login efectuado com sucesso.';
    } on FirebaseAuthException catch (e) {
      return _traduzirErroFirebase(e);
    } catch (e) {
      return 'Erro inesperado: $e';
    }
  }

  String _traduzirErroFirebase(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'Utilizador não encontrado.';
      case 'wrong-password':
        return 'Palavra-passe incorrecta.';
      case 'invalid-email':
        return 'E-mail inválido.';
      case 'user-disabled':
        return 'Esta conta foi desactivada.';
      default:
        return 'Erro: ${e.message}';
    }
  }
}
