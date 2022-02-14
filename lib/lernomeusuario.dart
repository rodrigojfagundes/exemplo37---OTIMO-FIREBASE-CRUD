//LER OS NOMES QUE ESTA EM UM DOC ESPECIFICO DENTRO DA COLLECTION...
//MAS A ATUALIZACAO NAO É EM TEMPO REAL

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//a classe GetUserName recebe uma STRING q é o ID/NOME do documento
//em q ta o NOME de usuario q queremos pegar
class GetUserName extends StatelessWidget {
  final String documentId;

//classe GetuserName recebe o q ta na Variavel
//DocumentId (que é o nome/id do documento)
  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    //fazendo uma REFERENCIA/ATALHO para a COLECAO USERS...
    //esse atalho vai se chamar users...
    //pois assim ao digitar USERS vamos iniciar o FireB na colecao USERS
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    //vamos retornar/criar um FutureBuilder de uma FOTO/SNAPSHOT de um DOCUMENTO
    return FutureBuilder<DocumentSnapshot>(
      //"funcao" future recebe a Colection Reference USERS (feita la em cima)
      //e damos o comando .doc e passamos o ID/NOME do documento q queremos
      //ler o full_name q esta armazenado...
      future: users.doc(documentId).get(),
      //a funcao BUILDER, vai receber um BuildContext e um context, q é o context
      //passado la em cima no (widget build)... Depois vamos receber de forma
      //assincrona um snapshot/foto do DOC q escolhemos
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        //se houver erro na hora de fazer o snapshot/foto
        if (snapshot.hasError) {
          //retorna a mensagem a baixo
          return Text("Something went wrong");
        }
        //nao entendi mto bem... Mas acho q algo como
        //dados de snapshot nao existem... algo assim
        if (snapshot.hasData && !snapshot.data!.exists) {
          //dai retorna a mensagem a baixo
          return Text("Document does not exist");
        }
        //se conseguir fazer/DONE a conexao
        if (snapshot.connectionState == ConnectionState.done) {
          //EU ACHO, q estamos recebendo uma STRING q seria o FULL_NAME
          //e, o DYNAMIC ali eu nao entendi mto bem... NAO SEI se um dado é
          //STRING e outro é DINAMICO talvez...

          Map<String, dynamic> data =
              //os dados(data) q tiver no snapshot/foto do DOC serao enviados
              //para STRING... o DYNAMIC eu nao entendi...
              snapshot.data!.data() as Map<String, dynamic>;
          //imprimindo os dados
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },
    );
  }
}
