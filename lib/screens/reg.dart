import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import 'hi.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showMessage('Пожалуйста, введите почту и пароль');
      return;
    }

    final user = await DatabaseHelper.instance.getUserByEmail(email);

    if (user == null) {
      _showMessage('Пользователь не найден');
      return;
    }

    if (user['password'] != password) {
      _showMessage('Неверный пароль');
      return;
    }

    // Успешный вход
    final name = user['name'];
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => HiScreen(userName: name),
      ),
    );
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
              // Градиентный фон
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF8DC034),
                        Color(0xFF409B16),
                        Color(0xFFFFD000),
                      ],
                      stops: [0.21, 0.43, 1.0],
                    ),
                  ),
                ),
              ),

              // Кнопка "Назад"
              Positioned(
                top: 40,
                left: 24,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 105,
                    height: 44,
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

              // Поля ввода
              Positioned(
                top: 300,
                left: 32,
                right: 32,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: 'Почта',
                        labelStyle: const TextStyle(color: Colors.white70),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white38),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: 'Пароль',
                        labelStyle: const TextStyle(color: Colors.white70),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white38),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Кнопка "Войти"
              Positioned(
                top: 470,
                left: 32,
                right: 32,
                child: GestureDetector(
                  onTap: _login,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF00AC87),
                          Color(0xFF728C00),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Войти',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900,
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              // Ссылка "Забыли пароль?"
              Positioned(
                top: 540,
                left: 0,
                right: 0,
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      // TODO: восстановление пароля
                    },
                    child: const Text(
                      'Забыли пароль?',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
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
