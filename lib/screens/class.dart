import 'package:flutter/material.dart';
import 'pagolin.dart';

class ClassScreen extends StatelessWidget {
  const ClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 375,
          height: 812,
          child: Stack(
            children: [
              Container(
                color: const Color(0xFF1C18F2), // Синий фон
              ),

              // Кнопка "назад"
              Positioned(
                top: 32,
                left: 21,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const PagolinScreen()),
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

              // Заголовок
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

              // Иконка справа
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
                  child: Center(
                    child: Image.asset(
                      'assets/famicons_earth-sharp.png',
                      width: 32,
                      height: 32,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // Картинка панголина
              Positioned(
                top: 176,
                left: 0,
                child: Image.asset(
                  'assets/photo_2025-04-03_22-40-03 (2).jpg',
                  width: 375,
                  height: 211,
                  fit: BoxFit.cover,
                ),
              ),

              // Классификация текста
              Positioned(
                top: 401,
                left: 17,
                right: 17,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _richLine('Домен', 'Эукариоты'),
                    _richLine('Царство', 'Животные'),
                    _richLine('Тип', 'Хордовые'),
                    _richLine('Класс', 'Млекопитающие'),
                    _richLine('Отряд', 'Панголины'),
                    _richLine('Семейство', 'Ящеровые'),
                    _richLine('Род', 'Центральноафриканские панголины'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _richLine(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            color: Colors.white,
          ),
          children: [
            TextSpan(text: '$label: '),
            TextSpan(
              text: value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
