//ADD Usuario Clicando no Container... A UM DOC COM NOME ALEARTORIO

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//classe AddUser2 recebe 3 parametros passados na funcao main
//ao chamar essa classe, NOME, COMPANY, IDADE
class AddUser2 extends StatelessWidget {
  final String fullName;
  final String company;
  final int age;

//passandoo conteudo das variaveis acima para a CLASSE ADDUSER2
  AddUser2(this.fullName, this.company, this.age);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    //acho q a "VARIAVEL" "users" recebe o FIREBASE instanciado/iniciado
    //na COLECAO USERS... para ficar mais facil de chamar ao longo do codigo
    //poem apenas "users."" ou "users =" ...
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    //chamando o metodo/funcao/classe FUTURA ADDUSER2...
    Future<void> addUser2() {
      // Call the user's CollectionReference to add a new user
      //estamos chamando o USERS q criamos ali na linha 26 do CODIGO...
      //q e uma REFERENCIA/ATALHO para iniciar o firebase e acessar a colecao users
      return users
          //vamos criar um DOC com um nome ALEARTORIO e nele vamos add
          //as 'CHAVES': valores a baixo
          .add({
            //criando a chave 'full_name' no doc do FIREBASE e add o nome q foi
            //passado a 'variavel' fullName(nome foi passado no main.dart)
            'full_name': fullName,
            //criando a chave 'company' no doc do FIREBASE e add a empresa q foi
            //passada na 'variavel' company(nome da empresa foi passado no main.dart)
            'company': company,
            //criando a chave 'age' no doc do FIREBASE e add a idade q foi
            //passado a 'variavel' age(idade foi passado no main.dart)
            'age': age // 42
          })
          //caso consiga add o valor, mostra no console User Added
          .then((value) => print("User Added"))
          //caso nao consiga add o valor retorna esta mensagem a baixo
          .catchError((error) => print("Failed to add user: $error"));
    }

//criando um container escrito ADDUSER para q ao clicar add o usuario a COLLECTION
    //
    //criando colum
    return Column(
      //children = LISTA de CHILDS... ou seja pode por varios containers, etc...
      children: [
        //campo de deteccao de toque
        GestureDetector(
          //se for tocado chama a classe adduser2
          onTap: addUser2,
          //esse Gesture Detector vai ficar dentro de um container
          //entao ao clicarmos no container vamos chamar a classe ADDUSER2
          child: Container(
            //parametros do container
            height: 100,
            width: 100,
            color: Colors.blue,
            child: Text('add user'),
          ),
        )
      ],
    );
  }
}


// CODIGO ORIGINAL ERA O Q TA A BAIXO, foi modificado
//PQ o BOTAO FLATBUTTON nao funcionava...
//dai na modificacao acima eu coloquei um CONTAINER no lugar

//class AddUser extends StatelessWidget {
//  final String fullName;
//  final String company;
//  final int age;
//
//  AddUser(this.fullName, this.company, this.age);
//
//  @override
//  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
//    CollectionReference users = FirebaseFirestore.instance.collection('users');

 //   Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
//      return users
//          .add({
//            'full_name': fullName, // John Doe
//            'company': company, // Stokes and Sons
//            'age': age // 42
//          })
//          .then((value) => print("User Added"))
//          .catchError((error) => print("Failed to add user: $error"));
//    }

//    return FlatButton(
//      onPressed: addUser,
//      child: Text(
//        "Add User",
//      ),
//    );
//  }
//}

