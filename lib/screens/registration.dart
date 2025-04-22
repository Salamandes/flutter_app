import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import 'hi.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _register() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showMessage('Заполните все поля');
      return;
    }

    try {
      await DatabaseHelper.instance.registerUser(name, email, password);
      _showMessage('Регистрация успешна!');

      // Переход на hi.dart
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HiScreen(userName: name),
        ),
      );
    } catch (e) {
      _showMessage('Ошибка: ${e.toString()}');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 375,
          height: 812,
          child: Stack(
            children: [
              // Фон
              Positioned.fill(
                child: Image.asset(
                  'assets/phon.png',
                  fit: BoxFit.cover,
                ),
              ),

              const Positioned(
                top: 93,
                left: 20,
                child: Text(
                  'WONDER',
                  style: TextStyle(
                    fontFamily: 'AbhayaLibre',
                    fontSize: 76,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8DC034),
                  ),
                ),
              ),

              const Positioned(
                top: 228,
                left: 60,
                child: Text(
                  'РЕГИСТРАЦИЯ',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // Поля
              Positioned(
                top: 300,
                left: 20,
                right: 20,
                child: textFieldWithIcon(
                  controller: nameController,
                  icon: Icons.person,
                  hint: 'Имя',
                ),
              ),
              Positioned(
                top: 370,
                left: 20,
                right: 20,
                child: textFieldWithIcon(
                  controller: emailController,
                  icon: Icons.email,
                  hint: 'Почта',
                ),
              ),
              Positioned(
                top: 440,
                left: 20,
                right: 20,
                child: textFieldWithIcon(
                  controller: passwordController,
                  icon: Icons.lock,
                  hint: 'Пароль',
                  obscure: true,
                ),
              ),

              // Кнопка "Зарегистрироваться"
              Positioned(
                bottom: 60,
                left: 40,
                right: 40,
                child: GestureDetector(
                  onTap: _register,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFFCD29), Color(0xFFD0FF00)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Зарегистрироваться',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Colors.white,
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

  Widget textFieldWithIcon({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    bool obscure = false,
  }) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscure,
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                controller.text = value.trim();
                controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: controller.text.length),
                );
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white70,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
