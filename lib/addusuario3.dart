//ADD usuario a UM DOC especifico

import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class addUser3 extends StatelessWidget {
  const addUser3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection

    //estamos fazendo uma REFERENCIA/ATALHO para a Coleccao USERS no firebase
    //por assim vamos digitar APENAS USERS, e nao firebasefirestore.instance.collection...
    //e assim podemos fazer o return a baixo
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    //
    //chamando a funcao futura adduser3 e para ela passando os parametros...
    Future<void> addUser3() {
      //chamando a CollectionReference USERS q criamos ali em cima...
      //para chamar o Firebase
      return users
          //criando um DOC com o nome de ABC12345
          .doc('ABC12345')
          //no DOC ABC12345, vamos criar a CHAVE full_name e age...
          .set({'full_name': "Mary Jane", 'age': 18})
          //se der certo acima
          .then((value) => print("User Added"))
          //se nao conseguir add... dai exibe essa mensagem
          .catchError((error) => print("Failed to add user: $error"));
    }

//criando um container escrito ADDUSER para q ao clicar add o usuario a COLLECTION
    return Column(
      //o children é uma lista/vetor de child...
      children: [
        //o gesture detector é um CHILD q ao ser clicado ele executa uma acao
        GestureDetector(
          //ao ser clicado vai chamar a funcao AddUser3
          onTap: addUser3,
          //vai ser executado o gesture detector se clicar no container a baixo
          child: Container(
            height: 400,
            width: 400,
            color: Colors.blue,
            child: Text('add user - em um doc especifico'),
          ),
        )
      ],
    );
  }
}
