import 'package:app_task_alura/data/task_dao.dart';

import 'package:app_task_alura/screens/home/components/card_task.dart';
import 'package:app_task_alura/shared/image_task.dart';
import 'package:flutter/material.dart';

import 'components/input_text.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController tarefaController = TextEditingController();
  final TextEditingController dificuldadeController = TextEditingController();
  final TextEditingController imagemController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void validacaoForm() {
    if (_formKey.currentState!.validate()) {
      TaskDao().save(TaskCard(
          tarefa: tarefaController.text,
          dificuldade: int.parse(dificuldadeController.text),
          urlImagem: imagemController.text));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("adicionado"),
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    tarefaController.dispose();
    dificuldadeController.dispose();
    imagemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("adicionar tarefa"),
        backgroundColor: const Color.fromARGB(255, 181, 139, 248),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 235, 222, 255),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 0.5,
                      offset: Offset(0, 0.5),
                      spreadRadius: 0.5,
                    )
                  ],
                ),
                width: double.infinity,
                height: 650,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InputText(
                          label: "Tarefa",
                          controller: tarefaController,
                          keyboard: TextInputType.text,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "digite o nome da tarefa";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InputText(
                          label: "Dificuldade",
                          controller: dificuldadeController,
                          keyboard: TextInputType.number,
                          validator: (text) {
                            if (text == null ||
                                text.isEmpty ||
                                int.parse(text) < 0 ||
                                int.parse(text) > 5) {
                              return "digite a dificuldade entre 1 e 5";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InputText(
                          onChanged: (value) => setState(() {}),
                          label: "Imagem",
                          controller: imagemController,
                          keyboard: TextInputType.url,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "digite uma url válida";
                            }
                            return null;
                          },
                        ),
                      ),
                      ImagemTask(url: imagemController.text),
                      SizedBox(
                        width: 145,
                        child: ElevatedButton(
                            onPressed: validacaoForm,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.save),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("salvar"),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
