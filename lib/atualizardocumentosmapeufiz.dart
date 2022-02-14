//CRIAR/ATUALIZAR um DOC, fazendo um MAP dentro do DOC

//Um MAP funciona como se fosse uma ARVORE de PASTAS...
//entao conseguimos dentro do DOC ABC123 fazer a sequinte estrutura
//EMPRESA>FUNCIONARIOS>NOMES>

//mas da forma q foi construido aqui, o nome dessas "PASTAS" vao ser
//definidos por uma VARIAVEL... Podendo assim ser alterado conforme o CODIGO
//esta rodando

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class updateUser4 extends StatelessWidget {
  const updateUser4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//definindo uma variavel de nome ADDRES com o nome de TIJUCAS
    var address = 'tijucas';

    //estamos fazendo uma REFERENCIA/ATALHO para a Coleccao USERS no firebase
    //por assim vamos digitar APENAS USERS, e nao firebasefirestore.instance.collection...
    //e assim podemos fazer o return a baixo
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    //a funcao FUTURE vai receber a nossa FUNCAO UPDATEUSER4
    //
    Future<void> updateUser4() {
      //chamando a CollectionReference USERS feita acima
      return users
          //acessando o DOC ABC123
          .doc('ABC123')
          //criando um MAP com o nome de INFO, em q o segundo nivel desse MAP
          //e tera o nome q associamos a variavel $ADDRES, ou seja TIJUCAS
          //e o ultimo nivel é a LOCATION, no qual passamos um endereco de GPS
          .update({'info.$address.location': GeoPoint(53.483959, -2.244644)})
          .then((value) => print("User Updated"))
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
          onTap: updateUser4,
          //vai ser executado o gesture detector se clicar no container a baixo
          child: Container(
            height: 400,
            width: 400,
            color: Colors.blue,
            child: Text('Atualizar DOCUMENTO/USUARIO... CRIAR MAP/ATUALIZAR'),
          ),
        )
      ],
    );
  }
}
