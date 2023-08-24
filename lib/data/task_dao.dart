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

  void save(TaskCard tarefa) async {}

  Future<List<TaskCard>> findAll() async {}

  Future<TaskCard> find(String tarefa) async {}

  void delete(String tarefa) async {}
}
