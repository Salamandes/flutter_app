import 'package:flutter/material.dart';
import 'pagolin.dart';

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
              Container(
                color: const Color(0xFF034100), // Тёмно-зелёный фон
              ),

              // Кнопка "назад"
              Positioned(
                top: 32,
                left: 21,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const PagolinScreen()),
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

              // Заголовок
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

              // Иконка справа
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

              // Картинка панголина
              Positioned(
                top: 176,
                left: 0,
                child: Image.asset(
                  'assets/photo_2025-04-03_22-40-03 (2).jpg',
                  width: 375,
                  height: 211,
                  fit: BoxFit.cover,
                ),
              ),

              // Прокручиваемый блок текста
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
                        TextSpan(
                          text:
                              'Панголины — одни из самых необычных млекопитающих на планете! Вот несколько интересных фактов о них:\n\n',
                        ),
                        TextSpan(
                          text: 'Единственные млекопитающие с чешуей\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'Их тело покрыто прочными кератиновыми чешуями (такими же, как у ногтей и волос). Это защищает их от хищников: в случае опасности панголин сворачивается в крепкий шар, который почти невозможно развернуть.\n\n',
                        ),
                        TextSpan(
                          text: 'Живые «пылесосы» для насекомых\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'Панголины питаются почти исключительно муравьями и термитами. У них длинный липкий язык (до 40 см!), с помощью которого они вылизывают насекомых из гнёзд.\n\n',
                        ),
                        TextSpan(
                          text: 'Нет зубов — но это не проблема\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'Вместо зубов панголины используют мелкие камушки и жёсткие структуры в желудке для перетирания пищи.\n\n',
                        ),
                        TextSpan(
                          text: 'Ночной образ жизни\n',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text:
                              'Панголины активны в основном ночью и ведут одиночный образ жизни. Они ориентируются с помощью обоняния и слуха, так как зрение у них слабое.\n\n',
                        ),
                        TextSpan(
                          text: 'Могут лазить по деревьям и плавать\n',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text:
                              'Некоторые виды панголинов отлично лазают по деревьям, цепляясь за ветки своим хвостом. А ещё они хорошие пловцы!\n\n',
                        ),
                        TextSpan(
                          text: 'Выделяют зловонный секрет\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'Как и скунсы, панголины могут выпускать неприятно пахнущую жидкость из специальных желез, чтобы отпугнуть врагов.\n\n',
                        ),
                        TextSpan(
                          text: 'На грани исчезновения\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'Панголины — самые контрабандируемые млекопитающие в мире. Их чешуя ценится в традиционной медицине (особенно в Азии), а мясо считается деликатесом. Из-за этого они находятся под угрозой вымирания.',
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
