import 'package:flutter/material.dart';
import 'dolgopat.dart';

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
              // 📷 Фон
              Positioned.fill(
                child: Image.asset(
                  'assets/food_bg.png',
                  fit: BoxFit.cover,
                ),
              ),

              // 🟩 Верхняя заливка
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 176,
                child: Container(
                  color: const Color(0xFF728C00),
                ),
              ),

              // 🔙 Кнопка назад
              Positioned(
                top: 32,
                left: 21,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const DolgopatScreen()),
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

              // 🖼 Картинка
              Positioned(
                top: 176,
                left: 0,
                child: Image.asset(
                  'assets/card5_4.png',
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
                  'Долгопят питается исключительно животной пищей — в основном насекомыми и мелкими позвоночными. Он ошеломляет добычу прыжками и съедает до 10% от своего веса в день. Это ночное животное, живёт в кронах деревьев и ловко передвигается по ним, используя длинные задние ноги для мощных прыжков, а хвост — как балансир.',
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
