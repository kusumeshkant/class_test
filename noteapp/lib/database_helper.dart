import 'package:noteapp/model/noteodel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Note _note = Note();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB('notes.db');
    return _database!;
  }

  Future<Database> initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    final database = await openDatabase(path, version: 1, onCreate: _createDB);
    return database;
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
        'CREATE TABLE "noteTable" (${_note.title} TEXT, ${_note.isImportant} bool)');
  }

  // Future<Note> create(Note note) async {
  //   final db = await instance.database;

  //   // final json = note.toJson();
  //   // final columns =
  //   //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
  //   // final values =
  //   //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
  //   // final id = await db
  //   //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

  //   final id = await db.insert(tableNotes, note.toJson());
  //   return note.copy(id: id);
  // }

  // Future<Note> readNote(int id) async {
  //   final db = await instance.database;

  //   final maps = await db.query(
  //     tableNotes,
  //     columns: NoteFields.values,
  //     where: '${NoteFields.id} = ?',
  //     whereArgs: [id],
  //   );

  //   if (maps.isNotEmpty) {
  //     return Note.fromJson(maps.first);
  //   } else {
  //     throw Exception('ID $id not found');
  //   }
  // }

  // Future<List<Note>> readAllNotes() async {
  //   final db = await instance.database;

  //   final orderBy = '${NoteFields.time} ASC';
  //   // final result =
  //   //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

  //   final result = await db.query(tableNotes, orderBy: orderBy);

  //   return result.map((json) => Note.fromJson(json)).toList();
  // }

  // Future<int> update(Note note) async {
  //   final db = await instance.database;

  //   return db.update(
  //     tableNotes,
  //     note.toJson(),
  //     where: '${NoteFields.id} = ?',
  //     whereArgs: [note.id],
  //   );
  // }

  // Future<int> delete(int id) async {
  //   final db = await instance.database;

  //   return await db.delete(
  //     tableNotes,
  //     where: '${NoteFields.id} = ?',
  //     whereArgs: [id],
  //   );
  // }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
