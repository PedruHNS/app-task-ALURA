import 'package:app_task_alura/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//! abaixo estamos abrindo o banco de dados.
Future<Database> getDatabase() async {
  //a linha abaixo esta criando um path(caminho)
  //para armazenar nossas informações
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(path, onCreate: (db, version) {
    //abaixo estamos executando o banco com uma table
    db.execute(TaskDao.tableSql);
  }, version: 1);
}


