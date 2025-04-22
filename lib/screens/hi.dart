import 'package:flutter/material.dart';
import 'pagolin/pagolin.dart';
import 'profile.dart';
import 'genetta/genetta.dart';
import 'darvin/darvin.dart';
import 'Akse/akse.dart';
import 'dolgopat/dolgopat.dart';
import 'package:app/db/database_helper.dart'; // подключение базы данных

class HiScreen extends StatefulWidget {
  final String userName;

  const HiScreen({super.key, required this.userName});

  @override
  State<HiScreen> createState() => _HiScreenState();
}

class _HiScreenState extends State<HiScreen> {
  String searchText = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    _loadUserEmail();
  }

  Future<void> _loadUserEmail() async {
    final user = await DatabaseHelper.instance.getLastUser();
    if (user != null && mounted) {
      setState(() {
        email = user['email'] ?? '';
      });
    }
  }

  final List<Map<String, dynamic>> allCards = [
    {
      'title': 'Морской чёрт',
      'subtitle': 'Неотопырь Дарвина',
      'image': 'assets/photo_2025-04-03_22-40-02.jpg',
      'onTap': (BuildContext context) =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => const DarvinScreen())),
    },
    {
      'title': 'Броненосец и муравьед',
      'subtitle': 'Панголин',
      'image': 'assets/photo_2025-04-03_22-40-03 (2).jpg',
      'onTap': (BuildContext context) =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => const PagolinScreen())),
    },
    {
      'title': 'Земноводное',
      'subtitle': 'Аксолотль',
      'image': 'assets/card3_1.png',
      'onTap': (BuildContext context) =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => const AkseScreen())),
    },
    {
      'title': 'Не кошка',
      'subtitle': 'Генетта',
      'image': 'assets/card4_1.png',
      'onTap': (BuildContext context) =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => const GenettaScreen())),
    },
    {
      'title': 'Лемур и обезьяна',
      'subtitle': 'Долгопят',
      'image': 'assets/card5_1.png',
      'onTap': (BuildContext context) =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => const DolgopatScreen())),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredCards = allCards
        .where((card) =>
            card['subtitle'].toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 375,
          child: Stack(
            children: [
              // Фон
              Positioned.fill(
                child: Image.asset(
                  'assets/phon.png',
                  fit: BoxFit.cover,
                ),
              ),

              // Контент
              Positioned.fill(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 64),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Приветствие + аватар
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Добро пожаловать, ${widget.userName}',
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ProfileScreen(
                                      userName: widget.userName,
                                      userEmail: email,
                                    ),
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

                      const SizedBox(height: 40),

                      // Поиск
                      Container(
                        width: 370,
                        height: 59,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: const Color(0x4D000000),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              searchText = value;
                            });
                          },
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

                      const SizedBox(height: 40),

                      // Заголовки
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
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

                      const SizedBox(height: 40),

                      // Карточки
                      for (var card in filteredCards) ...[
                        buildAnimalCard(
                          title: card['title'],
                          subtitle: card['subtitle'],
                          imagePath: card['image'],
                          onArrowTap: card['onTap'] != null
                              ? () => card['onTap'](context)
                              : null,
                        ),
                        const SizedBox(height: 18),
                      ],

                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
        if (onArrowTap != null)
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
