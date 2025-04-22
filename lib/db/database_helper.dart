import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  // Конструктор, который создаёт или использует существующий объект базы данных.
  DatabaseHelper._init();

  // Метод для получения базы данных
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('users.db');
    return _database!;
  }

  // Инициализация базы данных
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    // Открытие базы данных и создание таблиц
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // Создание таблицы в базе данных
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  // Регистрация пользователя (сохраняет имя, почту и пароль)
  Future<int> registerUser(String name, String email, String password) async {
    final db = await instance.database;
    final data = {
      'name': name,
      'email': email,
      'password': password,
    };
    return await db.insert('users', data);
  }

  // Получить пользователя по email
  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final db = await instance.database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty ? result.first : null;
  }

  // Получить последнего зарегистрированного пользователя
  Future<Map<String, dynamic>?> getLastUser() async {
    final db = await instance.database;
    final result = await db.query(
      'users',
      orderBy: 'id DESC',
      limit: 1,
    );
    return result.isNotEmpty ? result.first : null;
  }

  // Получить всех пользователей (для отладки) и вывод в терминал
  Future<void> printAllUsers() async {
    final db = await instance.database;
    final users = await db.query('users');
    
    // Выводим каждого пользователя в консоль
    users.forEach((user) {
      print('Name: ${user['name']}, Email: ${user['email']}, Password: ${user['password']}');
    });
  }

  // Обновление пароля пользователя по email
  Future<void> updatePassword(String email, String newPassword) async {
    final db = await instance.database;
    await db.update(
      'users',
      {'password': newPassword}, // Обновляем только пароль
      where: 'email = ?',
      whereArgs: [email], // Ищем по email
    );
  }
}
