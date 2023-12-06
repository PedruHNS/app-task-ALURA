import 'dart:developer';

import 'package:app_task_alura/data/database.dart';
import 'package:app_task_alura/screens/home/components/card_task.dart';

class TaskDao {
  //! essas variaveis são apenas para
  //! dar nomes os campos da table
  static const String _tablename = 'taskTable';
  static const String _name = 'tarefa';
  static const String _difficulty = 'dificuldade';
  static const String _image = 'imagem';

//! aqui esta a table utilizada no db.execute(tableSql)
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  void save(TaskCard tarefa) async {
    final bd = await getDatabase();

    final itemExists = await find(tarefa.tarefa);
    final taskMap = toMap(tarefa);

    if (itemExists.isEmpty) {
      await bd.insert(_tablename, taskMap);
    } else {
      await bd.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.tarefa],
      );
    }

    log('save executado com sucesso');
  }

  Future<List<TaskCard>> findAll() async {
    final bd = await getDatabase();
    final result = await bd.query(_tablename);
    log('findAll executado com sucesso');
    return toList(result);
  }

  Future<List<TaskCard>> find(String tarefa) async {
    final bd = await getDatabase();
    final result = await bd.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [tarefa],
    );

    log('find executado com sucesso');
    return toList(result);
  }

  void delete(String tarefa) async {
    final bd = await getDatabase();
    bd.delete(_tablename, where: '$_name = ?', whereArgs: [tarefa]);
  }

  List<TaskCard> toList(List<Map<String, dynamic>> mapDeTarefas) {
    final tarefas = <TaskCard>[];
    for (var linha in mapDeTarefas) {
      final TaskCard tarefa = TaskCard(
        tarefa: linha[_name],
        dificuldade: linha[_difficulty],
        urlImagem: linha[_image],
      );
      tarefas.add(tarefa);
    }
    return tarefas;
  }

  Map<String, dynamic> toMap(TaskCard tarefa) {
    return {
      _name: tarefa.tarefa,
      _difficulty: tarefa.dificuldade,
      _image: tarefa.urlImagem,
    };
  }
}
