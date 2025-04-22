import 'package:flutter/material.dart';
import 'akse.dart';

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
            // 🔵 Синий фон
            Container(
              color: const Color(0xFF1C18F2),
            ),

            // 🔙 Кнопка "назад"
            Positioned(
              top: 32,
              left: 21,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const AkseScreen()),
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

            // 🏷 Заголовок и иконка
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
               'assets/card3_2.png',
                width: 375,
                height: 211,
                fit: BoxFit.cover,
              ),
            ),

            // 🧬 Текст классификации
            const Positioned(
              top: 397,
              left: 17,
              right: 17,
              child: Text(
                'Домен: Эукариоты\n'
                'Царство: Животные\n'
                'Тип: Хордовые\n'
                'Класс: Амфибии\n'
                'Отряд: Хвостатые земноводные\n'
                'Семейство: Амбисомые\n',
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
      )
        );
  }
}
