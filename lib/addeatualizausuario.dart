//ADD e MODIFICAR/ATUALIZAR um usuario especifico

import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class addUser4 extends StatelessWidget {
  const addUser4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection

    //estamos fazendo uma REFERENCIA/ATALHO para a Coleccao USERS no firebase
    //por assim vamos digitar APENAS USERS, e nao firebasefirestore.instance.collection...
    //e assim podemos fazer o return a baixo
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    //
    //chamando a funcao futura adduser4 e para ela passando os parametros...
    Future<void> addUser4() {
      //acessando a COLLECTION REFERENCE feita ACIMA que é "variavel USERS", ela
      //faz refecia a INICIALIZAR o FireBase e acessar a COLLECTION USERS
      return users
          // acessando o DOC de nome ABC123 criado na collection USERS
          .doc('ABC123')
          //criando a CHAVE(full_name) e passando o Valor Mary J, e criando a
          //CHAVE(age) e passando a idade 28...
          //CASO essas CHAVES ja tenham VALORES preenchidos, eles serao
          //alterados para os valores a baixo
          .set(
            {'full_name': "Mary J", 'age': 28},
            SetOptions(merge: true),
          )
          .then((value) =>
              print("'full_name' & 'age' merged with existing data!"))
          .catchError((error) => print("Failed to merge data: $error"));
    }

//criando um container escrito ADDUSER para q ao clicar add o usuario a COLLECTION
    return Column(
      //o children é uma lista/vetor de child...
      children: [
        //o gesture detector é um CHILD q ao ser clicado ele executa uma acao
        GestureDetector(
          //ao ser clicado vai chamar a funcao AddUser3
          onTap: addUser4,
          //vai ser executado o gesture detector se clicar no container a baixo
          child: Container(
            height: 400,
            width: 400,
            color: Colors.blue,
            child: Text('add e atualiza usuario'),
          ),
        )
      ],
    );
  }
}
