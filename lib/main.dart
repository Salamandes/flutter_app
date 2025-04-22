import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'screens/registration.dart';
import 'package:app/db/database_helper.dart'; // или твой путь

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ⚠️ ВАЖНО: сначала инициализация FFI
  if (!kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.windows ||
       defaultTargetPlatform == TargetPlatform.linux)) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  // ✅ Проверка подключения к базе (работает только после FFI)
  try {
    final db = await DatabaseHelper.instance.database;
    print('✅ База успешно открыта: ${db.path}');
  } catch (e) {
    print('❌ Ошибка базы данных: $e');
  }

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 375,
          height: 812,
          child: Stack(
            children: [
              // Фон
              SizedBox.expand(
                child: Image.asset(
                  'assets/photo_2025-04-03_22-40-03.jpg',
                  fit: BoxFit.cover,
                ),
              ),

              // Затемнение
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),

              // Надпись WONDER
              const Positioned(
                top: 93,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'WONDER',
                    style: TextStyle(
                      fontFamily: 'AbhayaLibre',
                      fontSize: 76,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8DC034),
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),

              // Логотип
              Positioned(
                top: 188,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/Mask group.png',
                    height: 100,
                  ),
                ),
              ),

              // Текст "Познай Животный Мир"
              const Positioned(
                top: 553,
                left: 32,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'познай',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Животный',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.0,
                      ),
                    ),
                    Text(
                      'Мир',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.0,
                      ),
                    ),
                  ],
                ),
              ),

              // Кнопка "Исследовать" с анимацией
              Positioned(
                top: 712,
                left: 32,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(_createRouteToAuth());
                  },
                  child: Container(
                    width: 289,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFFFCD29),
                          Color(0xFFD0FF00),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Исследовать',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900,
                        fontSize: 23,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Анимация перехода на экран регистрации
Route _createRouteToAuth() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const RegistrationScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
