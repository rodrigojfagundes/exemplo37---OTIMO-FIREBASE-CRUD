//CRIAR/ATUALIZAR FAZENDO o UP de uma IMAGEM para um DOC

import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class deleteField extends StatelessWidget {
  const deleteField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection

    //estamos fazendo uma REFERENCIA/ATALHO para a Coleccao USERS no firebase
    //por assim vamos digitar APENAS USERS, e nao firebasefirestore.instance.collection...
    //e assim podemos fazer o return a baixo
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    //a funcao FUTURE vai receber a nossa FUNCAO deleteUser
    //
    Future<void> deleteField() {
      return users
          .doc('NLHxHlnIOvqaEoD7zXa1')
          .update({'age': FieldValue.delete()})
          .then((value) => print("User's Property Deleted"))
          .catchError(
              (error) => print("Failed to delete user's property: $error"));
    }

//criando um container escrito ATUALIZAR DOCUMENTO/USUARIO
// para q ao clicar add o usuario a COLLECTION
    return Column(
      //o children é uma lista/vetor de child...
      children: [
        //o gesture detector é um CHILD q ao ser clicado ele executa uma acao
        GestureDetector(
          //ao ser clicado vai chamar a funcao deleteUser
          onTap: deleteField,
          //vai ser executado o gesture detector se clicar no container a baixo
          child: Container(
            height: 400,
            width: 400,
            color: Colors.blue,
            child: Text('deletar APENAS UMA CHAVE/VALOR do doc'),
          ),
        )
      ],
    );
  }
}
