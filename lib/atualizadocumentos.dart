//MODIFICAR/ATUALIZAR um DOC/USUARIO especifico

import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class updateUser extends StatelessWidget {
  const updateUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection

    //estamos fazendo uma REFERENCIA/ATALHO para a Coleccao USERS no firebase
    //por assim vamos digitar APENAS USERS, e nao firebasefirestore.instance.collection...
    //e assim podemos fazer o return a baixo
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    //a funcao FUTURE vai receber a nossa FUNCAO UPDATEUSER
    Future<void> updateUser() {
      //chamando a COLLECTION REFERENCE criada ali em cima
      return users
          //acessando o nosso DOC com o nome de ABC123
          .doc('ABC123')
          //com o comando UPDATE nos podemos CRIAR um NOVO conjunto CHAVE e VALOR
          //assim como podemos MODIFICAR/ATUALIZAR os valores ja existente em uma
          //CHAVE
          .update({'company': 'Stokes and Sons2'})
          //caso consiga fazer a atualizacao exibe a mensagem a baixo no
          //prompt do VISUAL STUDIO CODE
          .then((value) => print("User Updated"))
          //caso de erro exibe a mensagem a baixo
          .catchError((error) => print("Failed to update user: $error"));
    }

//criando um container escrito ATUALIZAR DOCUMENTO/USUARIO
// para q ao clicar add o usuario a COLLECTION
    return Column(
      //o children é uma lista/vetor de child...
      children: [
        //o gesture detector é um CHILD q ao ser clicado ele executa uma acao
        GestureDetector(
          //ao ser clicado vai chamar a funcao atualizaDoc
          onTap: updateUser,
          //vai ser executado o gesture detector se clicar no container a baixo
          child: Container(
            height: 400,
            width: 400,
            color: Colors.blue,
            child: Text('Atualizar DOCUMENTO/USUARIO'),
          ),
        )
      ],
    );
  }
}
