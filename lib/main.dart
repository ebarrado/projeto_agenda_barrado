// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
//CLASSE MYAPP

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Agenda Barrado',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: PaginaPrincipal());
  }
}

//CLASSE COM ESTADO
class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalStatus();
}

class _PaginaPrincipalStatus extends State<PaginaPrincipal> {
  final List<Map<String, String>> _atividades = [];

  //MÉTODO ADICIONAR
  void _addatividades(
      String tipo, String descricao, String data, String imagem) {
    setState(() {
      _atividades.add({
        'tipo': tipo,
        'descricao': descricao,
        'data': data,
        'imagem': imagem,
      });
    });
  }

  //VARIAVEIS DO INPUT DO FORM
  final TextEditingController tipo = TextEditingController();
  final TextEditingController descricao = TextEditingController();
  final TextEditingController data = TextEditingController();
  final TextEditingController urlimagem = TextEditingController();

//MÉTODO ABRIR MODAL DE CADASTRO
  void modalCadastrar(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cadastrar Atividades',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context); // Fechar o modal
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Adiciona um espaçamento
                // Adicione mais conteúdo no modal, se necessário
                Text("Conteúdo do formulário de atividades"),
                TextField(
                  controller: tipo,
                  decoration: InputDecoration(labelText: 'Tipo de Atividade'),
                ),
                TextField(
                  controller: descricao,
                  decoration:
                      InputDecoration(labelText: 'Descrição da Atividade'),
                ),
                TextField(
                  controller: data,
                  decoration: InputDecoration(labelText: 'Data da Atividade'),
                ),
                TextField(
                  controller: urlimagem,
                  decoration: InputDecoration(labelText: 'Imagem'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _addatividades(
                        tipo.text, descricao.text, data.text, urlimagem.text);
                    Navigator.of(context).pop();
                  },
                  child: Text('Cadastrar'),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Agenda DS 2024',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Verdana', fontSize: 20.0),
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: [
          Atividades('Atividade 1',
              'https://miro.medium.com/v2/resize:fit:640/format:webp/1*ny9J-n57Ev3LhX8e58Okjg.png'),
          Atividades('Atividade 2',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuIZbU5T0ncHQY1T2fL0rgzMErgjZ7UK7ELw&s'),
          Atividades('Atividade 3',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjs2k0imizbrT016rYeZZasMLD46FMBWongg&s'),
          Atividades('Atividade 4',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqHNSSU6WTbVYXzjHUGxqYTtyh1fr6TTDKnw&s'),
          Atividades('Atividade 5',
              'https://thumbs.dreamstime.com/b/papai-noel-com-bandeiras-de-suor-presente-ca%C3%ADram-no-poste-personagem-presentes-flutter-na-ilustra%C3%A7%C3%A3o-do-vetor-polo-caracteres-157790801.jpg'),
          Atividades('Atividade 6',
              'https://miro.medium.com/v2/resize:fit:640/format:webp/1*ny9J-n57Ev3LhX8e58Okjg.png'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          modalCadastrar(context);
          //print('botão pressionado');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

//CLASSE ATIVIDADES
class Atividades extends StatelessWidget {
  //atributo = variavel
  final String nome;
  final String imagem_atv;

  const Atividades(this.nome, this.imagem_atv, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              color: Color.fromARGB(255, 115, 211, 214),
              height: 140,
            ),
            Container(
              color: Colors.white,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: Image.network(imagem_atv, fit: BoxFit.cover),
                    ),
                  ),
                  Text(nome),
                  ElevatedButton(
                    onPressed: () {
                      // modalCadastrar(context);
                    },
                    child: Icon(Icons.edit),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
