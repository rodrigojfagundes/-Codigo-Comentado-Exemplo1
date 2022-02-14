//arquivo onde realmente ta acontecendo o aplicativo
import 'package:exemplo1/novo_home.dart';
import 'package:flutter/material.dart';

// esse HOME_.DART é o antigo... era para medir o IMC... a partir dele fiz um para calcular maior e menor idade
import 'home_.dart';

//dando START no arquivo MAIN a partir do comando RunAPP... a aprtir disso ele executa a classe myApp a baixo
void main() {
  runApp(const MyApp());
}

//carregando a classe myapp do tipo stateless
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

//carregando as propiedadesda classe como cor, funcao inicial... etc... tirar o banner de debug
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //removendo o banner de debug
      debugShowCheckedModeBanner: false,
      //carregando o tipo de thema e qual vai ser a cor principal do app.. no caso a cor azul
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      //home carrega a fncao novoHome que é uma funcao dentro do arquivo NOVO_HOME.DART... ALi ta o APP
      home: novoHome(),
    );
  }
}
