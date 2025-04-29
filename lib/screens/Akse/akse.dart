import 'package:flutter/material.dart';
import '../hi.dart';
import '../Akse/place.dart';
import '../Akse/food.dart';
import '../Akse/class.dart';
import '../Akse/facts.dart';

class AkseScreen extends StatelessWidget {
  const AkseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 375,
          height: 812,
          child: Stack(
            children: [
              // 🌿 Фон
              Positioned.fill(
                child: Image.asset(
                  'assets/phon.png',
                  fit: BoxFit.cover,
                ),
              ),

              // 🖼 Картинка панголина
              Positioned(
                top: 115,
                left: 0,
                child: Container(
                  width: 380,
                  height: 214,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage('assets/card3_1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // ← Кнопка назад
              Positioned(
               top: 32,
                left: 21,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HiScreen(userName: '...')
),
                    );
                  },
                  child: Container(
                    width: 59,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                ),
              ),

              // 🔤 Название под картинкой
              const Positioned(
                top: 330,
                left: 19,
                child: Text(
                  'Аксолотль',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // 📘 Текст описания на всю ширину
              const Positioned(
                top: 370,
                left: 16,
                right: 16,
                child: Text(
                  'Многие, глядя на это задумчиво улыбающееся существо думают, что этот милый дракончик и есть водяная то ли ящерка, то ли головастик. На самом деле это личинка-неотения мексиканской саламандры под название амбистома. Превращение аксолотля в амбистому происходит при изменениях среды обитания, но в домашних условиях этого делать не рекомендуется, так как можно погубить животное.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ),

              // 🧭 Кнопки с иконками
              Positioned(
                bottom: 20,
                left: 14,
                child: Row(
                  children: [
                    _iconButtonWithLabel(context, 'assets/ri_tree-line.png', 'Место', Color(0xFFFFCD29), const PlaceScreen()),
                    const SizedBox(width: 14),
                    _iconButtonWithLabel(context, 'assets/food.png', 'Еда', Color(0xFF78A119), const FoodScreen()),
                    const SizedBox(width: 14),
                    _iconButtonWithLabel(context, 'assets/famicons_earth-sharp.png', 'Клас', Color(0xFF1C18F2), const ClassScreen()),
                    const SizedBox(width: 14),
                    _iconButtonWithLabel(context, 'assets/ic_outline-lightbulb.png', 'Факты', Color(0xFF034100), const FactsScreen()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconButtonWithLabel(BuildContext context, String assetPath, String label, Color color, Widget destination) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          },
          child: Container(
            width: 74,
            height: 74,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Image.asset(
                assetPath,
                width: 28,
                height: 28,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
