//CRIAR/ATUALIZAR FAZENDO o UP de uma IMAGEM para um DOC

import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class updateUser5 extends StatelessWidget {
  const updateUser5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection

    //estamos fazendo uma REFERENCIA/ATALHO para a Coleccao USERS no firebase
    //por assim vamos digitar APENAS USERS, e nao firebasefirestore.instance.collection...
    //e assim podemos fazer o return a baixo
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    //a funcao FUTURE vai receber a nossa FUNCAO UPDATEUSER5
    //
    //
    Future<void> updateUser5() {
      //chamando a funcao rootBudle (nao sei como ela funciona)
      return rootBundle
          //carregando a imagem q ta no diretorio ali... na vdd e .load('assets/images/sample.jpg')
          .load('lib/assets/images/sample.jpg')
          //ACHO Q estamos transformando os BYTE da IMAGEM acima em uma LISTA EU ACHO
          .then((bytes) => bytes.buffer.asUint8List())
          //EU ACHO Q a lista vai virar o AVATAR
          .then((avatar) {
            //acessando o DOC ABC123 e CRIANDO ou ATUALIZANDO o AVATAR... Ou seja
            //enviando a imagem
            return users.doc('ABC123').update({'info.avatar': Blob(avatar)});
          })
          //se conseguir enviar exibe esta mensagem
          .then((value) => print("User Updated"))
          //se nao conseguiu enviar exibe esta mensagem
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
          onTap: updateUser5,
          //vai ser executado o gesture detector se clicar no container a baixo
          child: Container(
            height: 400,
            width: 400,
            color: Colors.blue,
            child: Text('upar/atualizar imagem para o doc'),
          ),
        )
      ],
    );
  }
}
