//LER O QUE TA NA COLLECTION USUARIOS EM TEMPO REAL...
//DE TODA COLLECTION, OU DE UM DOCUMENTO ESPECIFICO

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//criando um stream... Pois sera em TEMPO REAL, entao é STREAM
//o stream vai receber uma foto/snapshot da COLLECAO USER
Stream collectionStream =
    FirebaseFirestore.instance.collection('users').snapshots();
//
//o codigo a baixo ta comentado, mas e caso eu queira apenas fazer o STREAM
//de um DOC especifico dentro da COLLECTION
//exemplo apenas sincronizar em tempo real o q ta no doc FUNCIONARIOS
//
//Stream documentStream = FirebaseFirestore.instance
//    .collection('users')
//    .doc('NLHxHlnIOvqaEoD7zXa1')
//    .snapshots();

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  //criando o final/constante _userStream q vai ser um QuerySnapShot
  //acho q o querysnapshot Requer/Pede uma Foto/Snapshot do estado atual
  //da colecao USERS
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    //chamando a funcao StreamBuilder, que QUERY/REQUER/PEDE uma FOTO/snapshot
    return StreamBuilder<QuerySnapshot>(
      //o stream vai receber o nosso _usersStream criado acima...
      //ele é inicializa a instancia do FireB e faz uma FOTO/SNAPSHOT de USERS
      stream: _usersStream,
      //metodo builder, recebe o buildcontext, e um contexto...
      //dps passamos q vai receber de forma ASSINCRONA uma foto/snapshot...
      //e por fim passamos o snapshot/foto da collection users
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //se houver erro exibe a mensagem
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        //se a conexao estiver carregando...
        if (snapshot.connectionState == ConnectionState.waiting) {
          //exibe essa mensagem
          return Text("Loading");
        }
        //apos carregar ele vai retornar um listview...
        return ListView(
          //dentro do listview fazemos um children q ira fazer um MAP com os SNAPSHOT
          //dos DOC
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            //map recebe uma String QUE EU ACHO Q é os valores dos DOC, e o
            //DYNAMIC eu ACHO q e para dizer q UM é String e o outro é QUALQUER TIPO
            //de FORMATO... https://pt.stackoverflow.com/questions/454098/qual-a-diferen%C3%A7a-entre-dynamic-e-object
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            //OBS: o codigo q ta em: https://firebase.flutter.dev/docs/firestore/usage/#realtime-changes
            //faz Return ListTile()... Mas dessa forma da erro...
            //entao gracas a Deus, descobri que tme que colocar
            //Return Material(child: ListTile(CODIGO))... Para poder funcionar
            return Material(
              child: ListTile(
                //mostrando os dados pegos do firebase
                title: Text(data['full_name']),
                subtitle: Text(data['company']),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
