import 'package:flutter/material.dart';
import '../db/database_helper.dart';

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
      Navigator.pop(context); // Закрытие диалога
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
