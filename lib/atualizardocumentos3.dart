//CRIAR/ATUALIZAR FAZENDO UM MAP no DOC
//e passar uma GEOLOCALIZACAO de GPS como uma CHAVE:VALOR

import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class updateUser3 extends StatelessWidget {
  const updateUser3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection

    //estamos fazendo uma REFERENCIA/ATALHO para a Coleccao USERS no firebase
    //por assim vamos digitar APENAS USERS, e nao firebasefirestore.instance.collection...
    //e assim podemos fazer o return a baixo
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    //a funcao FUTURE vai receber a nossa FUNCAO UPDATEUSER3
    //
    //
    Future<void> updateUser3() {
      //chamando a COLLECTION REFERENCE USERS feita acima...
      return users
          //acessando o DOC de nome ABC123
          .doc('ABC123')
          //CRIANDO ou ATUALIZANDO o MAP info.addres.location e passando
          //a localizacao de GPS a baixo...
          //Obs os MAP funcionam como se fossem PASTAS e SUB-PASTAS
          //entao meio q INFO>ADDRES>LOCATION
          .update({'info.address.location': GeoPoint(53.483959, -2.244644)})
          //caso o comando acima funcione, exibe a mensagem a baixo
          .then((value) => print("User Updated"))
          //caso o comando acima nao funcione exibe a mensagem a baixo
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
          onTap: updateUser3,
          //vai ser executado o gesture detector se clicar no container a baixo
          child: Container(
            height: 400,
            width: 400,
            color: Colors.blue,
            child: Text('Atualizar DOCUMENTO/USUARIO... CRIAR MAP'),
          ),
        )
      ],
    );
  }
}
