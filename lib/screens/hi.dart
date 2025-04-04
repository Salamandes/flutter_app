import 'package:flutter/material.dart';
import 'profile.dart'; // Импортируем экран профиля
import 'pagolin.dart';

class HiScreen extends StatelessWidget {
  const HiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 375,
          height: 812,
          child: Stack(
            children: [
              // 🌳 Фон
              Positioned.fill(
                child: Image.asset(
                  'assets/phon.png',
                  fit: BoxFit.cover,
                ),
              ),

              // 👋 Приветствие + аватарка
              Positioned(
                top: 64,
                left: 24,
                right: 24,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Добро пожаловать, Дмитрий',
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ),
                        );
                      },
                      child: ClipOval(
                        child: Image.asset(
                          'assets/ava.png',
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 🔍 Поисковая строка
              Positioned(
                top: 136,
                left: 3,
                child: Container(
                  width: 370,
                  height: 59,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0x4D000000),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFD000),
                    ),
                    cursorColor: Color(0xFFFFD000),
                    decoration: const InputDecoration(
                      hintText: 'Найди интересное животное...',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFD000),
                      ),
                      border: InputBorder.none,
                      isCollapsed: true,
                    ),
                  ),
                ),
              ),

              // 📢 Заголовки
              const Positioned(
                top: 252,
                left: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Следует посмотреть!',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Давайте исследовать',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFCD29),
                      ),
                    ),
                  ],
                ),
              ),

              // 🐠 Первая карточка
              Positioned(
                top: 345,
                left: 3,
                child: buildAnimalCard(
                  title: 'Морской чёрт',
                  subtitle: 'Неотопырь Дарвина',
                  imagePath: 'assets/photo_2025-04-03_22-40-02.jpg',
                ),
              ),

              // 🐺 Вторая карточка с новой картинкой
              Positioned(
                top: 563,
                left: 3,
                child: buildAnimalCard(
                  title: 'Броненосец и муравьед',
                  subtitle: 'Панголин',
                  imagePath: 'assets/photo_2025-04-03_22-40-03 (2).jpg',
                  onArrowTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PagolinScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔀 Карточка
  Widget buildAnimalCard({
    required String title,
    required String subtitle,
    required String imagePath,
    VoidCallback? onArrowTap,
  }) {
    return Stack(
      children: [
        Container(
          width: 370,
          height: 196,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 370,
          height: 196,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x00000000),
                Color(0xFF000000),
              ],
            ),
          ),
        ),
        Positioned(
          top: 123,
          left: 19,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 114,
          left: 288,
          child: GestureDetector(
            onTap: onArrowTap,
            child: Container(
              width: 59,
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
