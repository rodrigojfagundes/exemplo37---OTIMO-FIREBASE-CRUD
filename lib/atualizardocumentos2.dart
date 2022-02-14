//MODIFICAR/ATUALIZAR FAZENDO UM MAP no DOC

import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class updateUser2 extends StatelessWidget {
  const updateUser2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection

    //estamos fazendo uma REFERENCIA/ATALHO para a Coleccao USERS no firebase
    //por assim vamos digitar APENAS USERS, e nao firebasefirestore.instance.collection...
    //e assim podemos fazer o return a baixo
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    //a funcao FUTURE vai receber a nossa FUNCAO UPDATEUSER2
    //
    //
    Future<void> updateUser2() {
      //chamando a CollectionReference criada ACIMA chamade de USERS
      //ela vai servir para se comunicar com o FIREBASE e acessar a COLLECTION USERS
      return users
          //acessando o DOC ABC123

          .doc('ABC123')
          //AQUI ESTMOS FAZENDO UM MAP... ficando assim INFO>ADDRES>ZIPCODE: valor
          //assim meio q conseguimos "fazer uma escadinha"...
          //tipo Funcionarios>Nome>Info>Address>ZipCode
          .update({'info.address.zipcode': 90210})
          //se conseguir add o valor
          .then((value) => print("User Updated"))
          //se nao consegiur exibe a mensagem
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
          onTap: updateUser2,
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
