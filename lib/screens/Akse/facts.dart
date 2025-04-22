import 'package:flutter/material.dart';
import 'akse.dart';

class FactsScreen extends StatelessWidget {
  const FactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 375,
          height: 812,
          child: Stack(
            children: [
              // 🌄 Фон с градиентом
              Positioned.fill(
                child: Image.asset(
                  'assets/facts_bg.png',
                  fit: BoxFit.cover,
                ),
              ),

              // 🟩 Цветовая заливка под шапкой
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 176,
                child: Container(
                  color: const Color(0xFF034100),
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
                  'Факты',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // 💡 Иконка
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
                      'assets/ic_outline-lightbulb.png',
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
                  'assets/card3_5.png',
                  width: 375,
                  height: 211,
                  fit: BoxFit.cover,
                ),
              ),

              // 📖 Текст
              Positioned(
                top: 401,
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        color: Colors.white,
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(text: 'У них нет век;\n\n'),
                        TextSpan(
                          text: 'Они практически слепые;\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'Большинство аксолотлей имеют чёрный, тёмно-зелёный и тёмно-серый окрас. Редкий вид — белый альбинос-мутант;\n\n',
                        ),
                        TextSpan(
                          text:
                              'Самые крупные аксолотли, обитающие в естественной среде, достигают по весу 3.5 кг, а длина может превышать 30 см;\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'Аксолотли любят жить в одиночестве, склонны к каннибализму, поэтому две особи противоположного пола содержат вместе только в периоды спаривания;\n\n',
                        ),
                      ],
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
