import 'package:exemplo37/addeatualizausuario.dart';
import 'package:exemplo37/addusuario.dart';
import 'package:exemplo37/addusuario2.dart';
import 'package:exemplo37/addusuario3.dart';
import 'package:exemplo37/atualizadocumentos.dart';
import 'package:exemplo37/atualizardocumentos2.dart';
import 'package:exemplo37/atualizardocumentos3.dart';
import 'package:exemplo37/atualizardocumentos5.dart';
import 'package:exemplo37/atualizardocumentosmapeufiz.dart';
import 'package:exemplo37/deletardados.dart';
import 'package:exemplo37/deletardados2.dart';
import 'package:exemplo37/lernomeusuario.dart';
import 'package:exemplo37/lerusuariotemporeal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
//inicializando o firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

//usando a variavel FIRESTORE para chamar o FIREBASE
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //na Home nos estamos chamando a FUNCAO/CLASSE ADDUSER
      //e estamos passando os parametros NOME, Empresa, e Idade
      //para assim cadastrar o usuario com as informacoes passadas aqui
      //
      //home: AddUser('Rodrigo JF', 'AppBox', 28),
      //
      //fazendo a leitura do nome de um usuario passado acima
      //q esta salvo no documento de nome: NLHxHlnIOvqaEoD7zXa1
      //home: GetUserName('NLHxHlnIOvqaEoD7zXa1'),
      //
      //Em TEMPO REAL, lendo o q ta em TODOS os DOC da Collection...
      //OU tbm em DOC especificos
      //home: UserInformation(),
      //
      //AddUser2 ele vai passar os dados a baixo NOME, EMPRESA, IDADE
      //para CLASSE/FUNCAO AddUser2, e dps vamos clicar em um container
      //escrito AddUser e vamos add o usuario a COLLECTION
      //home: AddUser2('Rodrigo JF - usando adduser2', 'AppBox -addUser2', 28),
      //
      //
      //chamando a funcao adduser3 q vai add USUARIO e IDADE a uma
      //DOCUMENTO ESPECIFICO da COLLECTION
      //home: addUser3(),
      //
      //
      //chamando a funcao ADDUSER4, q permite ADD e MODIFICAR/ATUALIZAR
      //as informacoes de um DOC especifico, no caso os campo CHAVE e valor
      //de USUARIO
      //home: addUser4(),
      //
      //podemos ATUALIZAR um DOCUMENTO especifico
      //CRIANDO uma CHAVE e VALOR nova... Ou ATUALIZANDO o VALOR
      //de uma CHAVE ja existente
      //home: updateUser(),
      //
      //MODIFICAR/ATUALIZAR FAZENDO UM MAP no DOC...
      //o MAP é meio como se conseguissemos fazer SUB-DOCS dentro de um DOC...
      //home: updateUser2(),
      //
      //CRIANDO/MODIFICANDO um DOC, e dentro dele fazendo um MAP
      //e dentro desse MAP colocando uma GEOLOCALIZACAO de GPS
      //home: updateUser3(),
      //
      //CRIANDO/MODIFICANDO um MAP com VARIAVEIS dentro de um DOC
      //home: updateUser4(),
      //
      //fazendo UP/Atualizacao de imagem para um DOC
      //home: updateUser5(),
      //
      //deletando tudo o q ta em um DOC dentro da Collection USERS
      //home: deleteUser(),
      //
      home: deleteField(),
    );
  }
}
