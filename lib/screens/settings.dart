import 'package:flutter/material.dart';
import '../db/database_helper.dart'; // Подключаем DatabaseHelper

class SettingsScreen extends StatefulWidget {
  final String userEmail;

  const SettingsScreen({super.key, required this.userEmail});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true; // Состояние уведомлений

  // Метод для сохранения состояния уведомлений (можно в базе данных или SharedPreferences)
  Future<void> _saveNotificationSettings(bool value) async {
    setState(() {
      _notificationsEnabled = value;
    });

    // Здесь можно сохранить состояние в базе данных или SharedPreferences
    // Например, в SharedPreferences:
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool('notificationsEnabled', value);

    // Для демонстрации выводим сообщение
    _showMessage('Уведомления ${value ? 'включены' : 'выключены'}');
  }

  // Показать сообщение внизу экрана
  void _showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
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
              // 📱 Фон
              Positioned.fill(
                child: Image.asset(
                  'assets/phon.png',
                  fit: BoxFit.cover,
                ),
              ),

              // 🔙 Кнопка "Назад"
              Positioned(
                top: 32,
                left: 21,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
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

              // 🧾 Заголовок
              const Positioned(
                top: 102,
                left: 17,
                child: Text(
                  'Настройки',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // ⚙️ Список опций
              Positioned(
                top: 180,
                left: 17,
                right: 17,
                child: Column(
                  children: [
                    // Карточка с "Изменить пароль"
                    GestureDetector(
                      onTap: () {
                        _showChangePasswordDialog(context, widget.userEmail);
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: const [
                            Icon(Icons.lock_outline, color: Colors.white, size: 28),
                            SizedBox(width: 16),
                            Text(
                              'Изменить пароль',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Карточка с переключателем для уведомлений
                    GestureDetector(
                      onTap: () {
                        _saveNotificationSettings(!_notificationsEnabled);
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.notifications_none, color: Colors.white, size: 28),
                                SizedBox(width: 16),
                                Text(
                                  'Уведомления',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Switch(
                              value: _notificationsEnabled,
                              onChanged: (value) {
                                _saveNotificationSettings(value);
                              },
                              activeColor: Colors.lightGreenAccent,
                              inactiveThumbColor: Colors.grey.shade300,
                              inactiveTrackColor: Colors.grey.shade500,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Функция для показа диалога с полями для изменения пароля
  void _showChangePasswordDialog(BuildContext context, String userEmail) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF2E2E2E),
          title: const Text(
            'Сменить пароль',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          content: ChangePasswordDialog(userEmail: userEmail),
        );
      },
    );
  }
}

// Диалог для смены пароля
class ChangePasswordDialog extends StatefulWidget {
  final String userEmail;

  const ChangePasswordDialog({super.key, required this.userEmail});

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  bool _loading = false;

  Future<void> _savePassword() async {
    setState(() => _loading = true);

    final current = currentPasswordController.text.trim();
    final newPass = newPasswordController.text.trim();

    if (current.isEmpty || newPass.isEmpty) {
      _showMessage('Пожалуйста, заполните все поля');
      setState(() => _loading = false);
      return;
    }

    final user = await DatabaseHelper.instance.getUserByEmail(widget.userEmail);

    if (user == null) {
      _showMessage('Пользователь не найден');
    } else if (user['password'] != current) {
      _showMessage('Неверный текущий пароль');
    } else {
      await DatabaseHelper.instance.updatePassword(widget.userEmail, newPass);
      _showMessage('Пароль обновлён');
      Navigator.pop(context); 
    }

    setState(() => _loading = false);
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _passwordField(currentPasswordController, 'Текущий пароль'),
        const SizedBox(height: 16),
        _passwordField(newPasswordController, 'Новый пароль'),
        const SizedBox(height: 24),
        GestureDetector(
          onTap: _loading ? null : _savePassword,
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00AC87), Color(0xFF728C00)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: _loading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text(
                    'Сохранить',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _passwordField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      obscureText: true,
      style: const TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white38),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
