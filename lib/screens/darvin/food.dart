import 'package:flutter/material.dart';
import 'darvin.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 375,
          height: 812,
          child: Stack(
            children: [
              // 🌄 Фон с изображением
              Positioned.fill(
                child: Image.asset(
                  'assets/food_bg.png',
                  fit: BoxFit.cover,
                ),
              ),

              // 🟢 Заливка под шапкой
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 176,
                child: Container(
                  color: const Color(0xFF728C00),
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
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              // 🏷 Заголовок
              const Positioned(
                top: 102,
                left: 17,
                child: Text(
                  'Питание',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // 🍴 Иконка
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
                      'assets/food.png',
                      width: 32,
                      height: 32,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // 🐟 Картинка
              Positioned(
                top: 176,
                left: 0,
                child: Image.asset(
                  'assets/card2_4.png',
                  width: 375,
                  height: 211,
                  fit: BoxFit.cover,
                ),
              ),

              // 📄 Текст
              const Positioned(
                top: 406,
                left: 17,
                right: 17,
                child: Text(
                  'У многих глубоководных удильщиков эска светится благодаря бактериям, количество которых регулируется через кровоснабжение. Но у нетопыря Дарвина она не светится и спрятана в полости. Хотя приманка неэффективна для донной добычи, рыбы всё же используют её — вытягивают и трясут эску до двух минут.',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    color: Colors.white,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
