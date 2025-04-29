import 'package:flutter/material.dart';
import 'package:app/db/database_helper.dart'; // Подключаем DatabaseHelper
import 'settings.dart'; // Подключаем экран настроек
import 'help.dart';
import 'reg.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;
  final String userEmail;

  const ProfileScreen({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  // Метод для вывода всех пользователей в консоль при запуске экрана
  Future<void> _printUsersInConsole() async {
    await DatabaseHelper.instance.printAllUsers();  // Выводим данные из базы в терминал
  }

  @override
  Widget build(BuildContext context) {
    // Вызовим функцию вывода данных при старте экрана
    _printUsersInConsole();

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 375,
          height: 812,
          child: Stack(
            children: [
              // 🌄 Фон
              Positioned.fill(
                child: Image.asset(
                  'assets/phon.png',
                  fit: BoxFit.cover,
                ),
              ),

              // 🔙 Кнопка "Назад"
              Positioned(
                top: 32,
                left: 21,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 59,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                ),
              ),

              // 🧾 Заголовок
              const Positioned(
                top: 102,
                left: 17,
                child: Text(
                  'Профиль пользователя',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // 👤 Аватар
              Positioned(
                top: 176,
                left: 140,
                child: ClipOval(
                  child: Image.asset(
                    'assets/ava.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // 👨 Имя и 📧 почта
              Positioned(
                top: 296,
                left: 17,
                right: 17,
                child: Column(
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      userEmail,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // ⚙️ Кнопка Настройки
              Positioned(
                top: 396,
                left: 17,
                child: GestureDetector(
                  onTap: () {
                    // Навигация на экран настроек
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SettingsScreen(userEmail: userEmail),
                      ),
                    );
                  },
                  child: Container(
                    width: 340,
                    height: 89,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Icon(Icons.settings, color: Colors.white, size: 28),
                        ),
                        Text(
                          'Настройки приложения',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ❓ Кнопка Помощь
              Positioned(
                top: 493,
                left: 17,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) =>  HelpScreen(
      userName: userName,
      userEmail: userEmail,
    ),
  ),
);

                    },
                  child: Container(
                    width: 340,
                    height: 89,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Icon(Icons.help_outline, color: Colors.white, size: 28),
                        ),
                        Text(
                          'Помощь и поддержка',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // 🚪 Кнопка "Выход"
              Positioned(
                bottom: 26,
                left: 85,
                child: GestureDetector(
                  onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (_) =>  AuthScreen(),),
);
                  },
                  child: Container(
                    width: 204,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Выход',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
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
