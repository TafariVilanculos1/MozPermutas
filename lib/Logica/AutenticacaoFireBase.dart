import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AutenticacaoFireBase
{
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
   cadastroUtilizador({
     required String email, required String senha, required String confirmarSenha,})
   {
        if( senha == confirmarSenha)
        {
          _firebaseAuth.createUserWithEmailAndPassword(email: email, password: senha);
        }else{

        }

   }


}