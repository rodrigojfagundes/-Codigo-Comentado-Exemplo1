import 'package:flutter/material.dart';

//criando a CLASSE/FUNCAO novoHome ela é do tipo StateFul ou seja dependendo do tipo ela muda o
//estado
class novoHome extends StatefulWidget {
  @override
  //EU ACHO q o _HomeState ganha um nome estado a partir de _HomeState
  _HomeState createState() => _HomeState();
}

//criando a classe _HomeState, q vai ganhar um novo estado de novoHome
class _HomeState extends State<novoHome> {
//EU ACHO q os valores adicionados no campo TextEditingController SERAO armazenados na variavel IdadeControler
  TextEditingController idadeController = TextEditingController();

//criando o botao calcular... a funcao do botao calular
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//textinho q aparece em baixo no app
  String _infoText = "Informe seus dados!";

//funcao do tipo vazia... q serve para limpar os CAMPOS do app
  void _resetFields() {
    //resetar os campos... ou seja passar valor 0 para a variavel idade controler
    idadeController.text = "";
    setState(() {
      //e alterando novamente o estado da variavel _infotext para informe os seus dado...
      _infoText = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });
  }

//funcao vazia q serve para realizar o calculo se é maior ou menor de idade
  void _calculate() {
    //alterando o estado
    setState(() {
      //verificando se a variavel IDADE é MAIOR ou MENOR q 18
      double idade = double.parse(idadeController.text);
      if (idade < 18.0) {
        _infoText = "menor de idade (${idade.toStringAsPrecision(4)})";
      } else if (idade >= 18.1) {
        _infoText = "maior de idade (${idade.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  //carregando um widget q vai ajudar mais na parte do design
  Widget build(BuildContext context) {
    //ele retorna o esqueleto do app
    return Scaffold(
      //dentro do esqueleto nos criamos um appbar para para ter uma barra no topo do app... com um texto
      appBar: AppBar(
        title: Text("maior ou menor de idade"),
        //falando q o titulo fica no centro
        centerTitle: true,
        //cor do toopbar é verde
        backgroundColor: Colors.green,
        //criando o widget de botao(refresh) q ao ser precionado chama a funcao _resetFields para limpar os campos preenchidos
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            //quando o botao e precionado ele chama a funcao _resetFields para limpar os campos
            onPressed: _resetFields,
          )
        ],
      ),
      //cor de fundo ao app
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        //margens e centralizacao dos campos(idade e figurinha e texto) e botao calcular...
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          //key recebe o valor q ta no formkey q no caso é a idade passada EU ACHOO ACHO ACHO
          key: _formKey,
          //criando um child(filho) q sera alinhado para colocar um bonequinho
          child: Column(
            //alinhando o child q ira ter o bonequinho verde desenhado no topo do app
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //passando o bonequinho verde
              Icon(Icons.person_outline, size: 120.0, color: Colors.green),
              //criando campo para digitar a idade
              TextFormField(
                //campo apenas aceita valores do tipo numerico
                keyboardType: TextInputType.number,
                //chamando a funcao decoration para imprimir texto idade na cor verde
                decoration: InputDecoration(
                    labelText: "idade",
                    labelStyle: TextStyle(color: Colors.green)),
                //centralizando o texto de IDADE que é digitado
                textAlign: TextAlign.center,
                //cor e tamanho do texto (idade) q é digitado
                style: TextStyle(color: Colors.red, fontSize: 25.0),
                //funcao controler do campo de texto acima, recebe o valor q ta na variavel idadeControler
                controller: idadeController,
                //verificando se o valor q ta na variavel idadeControler é diferente de vazio
                validator: (value) {
                  //caso seja vazio exibe a mensagme a baixo
                  if (value!.isEmpty) {
                    return "Insira sua idade";
                  }
                },
              ),
              //pading
              Padding(
                //distancia entre o campo idade e o botao calcular
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                //child carregando um container coim a criacao do botao calcular...
                child: Container(
                  //altura do botao
                  height: 50.0,
                  child: RaisedButton(
                    //ao precionar o botao ele verifica se o valor e valido, caso sim, chama a funcao calcular
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calculate();
                      }
                    },
                    //child com o texto dentro do botao... e caracteristicas de design
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    //cor do botao
                    color: Colors.green,
                  ),
                ),
              ),
              //criando campo para texto
              Text(
                //pegando o texto q ta dentro de _infoText (informe seus dados)
                _infoText,
                //alinhando no centro o texto
                textAlign: TextAlign.center,
                //parametros como tamanho do texto e cor...
                style: TextStyle(color: Colors.green, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
