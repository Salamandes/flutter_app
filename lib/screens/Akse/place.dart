import 'package:flutter/material.dart';
import 'akse.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'assets/place_bg.png',
                  fit: BoxFit.cover,
                ),
              ),

              // 🟨 Верхняя заливка
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 176,
                child: Container(
                  color: const Color(0xFFFFCD29),
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

              // 🏷 Заголовок
              const Positioned(
                top: 102,
                left: 17,
                child: Text(
                  'Место обитания',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // 🌳 Иконка
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
                    'assets/ri_tree-line.png',
                    width: 32,
                    height: 32,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // 🗺 Картинка
              Positioned(
                top: 176,
                left: 0,
                child: Image.asset(
                  'assets/card3_3.png',
                  width: 374,
                  height: 284,
                  fit: BoxFit.cover,
                ),
              ),

              // 📄 Текст
              const Positioned(
                top: 479,
                left: 17,
                right: 17,
                child: Text(
                  'В дикой природе аксолотли живут на территории Мексики и обитают в двух озерах - Ксочимайлко и Чилко. Эти водоемы располагаются на высоте 2000 метров над уровнем моря. Вода в них достаточно прохладная и не превышает температуры в 20 градусов, но может понижаться и до 7.',
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
