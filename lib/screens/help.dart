import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  final String userName;
  final String userEmail;

  const HelpScreen({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 375,
          height: 812,
          child: Stack(
            children: [
              // 📱 Фон
              Positioned.fill(
                child: Image.asset(
                  'assets/phon.png',
                  fit: BoxFit.cover,
                ),
              ),

              // 🔙 Кнопка "Назад"
              Positioned(
                top: 40,
                left: 24,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 59,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/Vector.png',
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // 🟩 Заголовок
              const Positioned(
                top: 40,
                left: 165,
                child: Text(
                  'ПОМОЩЬ',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),

              // 🟫 Серый прямоугольник
              Positioned(
                left: 2,
                top: 117,
                child: Container(
                  width: 370,
                  height: 590,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(143, 196, 196, 196),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              // 🟩 Зеленый блок с сообщением
              Positioned(
                left: 31,
                top: 298,
                child: Container(
                  width: 316,
                  height: 228,
                  decoration: const BoxDecoration(
                    color: Color(0xFF78A119),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'Здравствуйте!\nЯ Бого - ваш виртуальный помощник!\nЧем я могу помочь?',
              
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17,
                      color: Colors.white,

                    ),
                  ),
                ),
              ),

              // 🤖 Ассистент (изображение)
              Positioned(
                left: 53,
                top: 502,
                child: Image.asset(
                  'assets/asistent.png',
                  width: 268,
                  height: 125,
                ),
              ),

              // 💬 Поле ввода сообщения
              Positioned(
                left: 9,
                top: 731,
                child: Container(
                  width: 356,
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFF559523),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    controller: messageController,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17,
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Ваше сообщение',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 17,
                        color: Colors.white70,
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
