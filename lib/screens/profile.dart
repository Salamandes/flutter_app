import 'package:flutter/material.dart';
import 'registration.dart'; // Импортируем экран регистрации

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 375,
          height: 812,
          child: Stack(
            children: [
              // Фон с изображением
              Positioned.fill(
                child: Image.asset(
                  'assets/phon.png', // Путь к загруженному фону
                  fit: BoxFit.cover,
                ),
              ),

              // Кнопка "назад"
              Positioned(
                top: 32,
                left: 21,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Возвращаемся на предыдущий экран
                  },
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

              // Заголовок профиля
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

              // Аватар пользователя
              Positioned(
                top: 176,
                left: 140,
                child: ClipOval(
                  child: Image.asset(
                    'assets/ava.png', // Путь к аватарке
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Имя пользователя
              const Positioned(
                top: 296,
                left: 17,
                right: 17,
                child: Text(
                  'Дмитрий',  // Имя пользователя
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Кнопка "Настройки приложения"
              Positioned(
                top: 396, // Отступ от имени пользователя
                left: 17,
                child: GestureDetector(
                  onTap: () {
                    // Логика перехода на экран настроек
                  },
                  child: Container(
                    width: 340, // На всю ширину
                    height: 89,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const Text(
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

              // Кнопка "Помощь и поддержка"
              Positioned(
                top: 493, // Отступ от кнопки Настройки приложения
                left: 17,
                child: GestureDetector(
                  onTap: () {
                    // Логика перехода на экран помощи
                  },
                  child: Container(
                    width: 340, // На всю ширину
                    height: 89,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Icon(
                            Icons.help_outline,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const Text(
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

              // Кнопка "Выход"
              Positioned(
                bottom: 26, // Расстояние от нижнего края
                left: 85, // Центрируем кнопку
                child: GestureDetector(
                  onTap: () {
                    // Переход на экран регистрации при выходе
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 204, // Ширина кнопки
                    height: 52, // Высота кнопки
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
