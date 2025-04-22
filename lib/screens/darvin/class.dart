import 'package:flutter/material.dart';
import 'darvin.dart';

class dClassScreen extends StatelessWidget {
  const dClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 375,
          height: 812,
          child: Stack(
            children: [
              // 📷 Фон с градиентом
              Positioned.fill(
                child: Image.asset(
                  'assets/class_bg.png', // общий фон
                  fit: BoxFit.cover,
                ),
              ),

              // 🔵 Прямоугольник под шапкой
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 176, // до начала картинки
                child: Container(
                  color: const Color(0xFF1C18F2), // основной синий цвет
                ),
              ),

              // 🔙 Кнопка "назад"
              Positioned(
                top: 32,
                left: 21,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const DarvinScreen()),
                    );
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

              // 🏷 Заголовок
              const Positioned(
                top: 102,
                left: 17,
                child: Text(
                  'Классификация',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // 🌍 Иконка
              Positioned(
                top: 93,
                left: 302,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/famicons_earth-sharp.png',
                    width: 32,
                    height: 32,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // 🖼 Картинка
              Positioned(
                top: 176,
                left: 0,
                child: Image.asset(
                  'assets/card2_2.png',
                  width: 375,
                  height: 211,
                  fit: BoxFit.cover,
                ),
              ),

              // 📋 Текст классификации
              const Positioned(
                top: 397,
                left: 17,
                right: 17,
                child: Text(
                  'Домен: Эукариоты\n'
                  'Царство: Животные\n'
                  'Тип: Хордовые\n'
                  'Класс: Лучепёрые рыбы\n'
                  'Отряд: Удильщикообразные\n'
                  'Семейство: Нетопырёвые\n',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    color: Colors.white,
                    height: 1.6,
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
