import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false; //status mode gelap

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, 
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: const Color.fromARGB(255, 212, 222, 224), //mode terang
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFF1F0E9)),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: const Color(0xFF121212), //mode gelap
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF1F1F1F)),
      ),
      home: GamerScreen(
        isDarkMode: isDarkMode,
        onThemeChanged: (value) {
          setState(() {
            isDarkMode = value;
          });
        },
      ),
    );
  }
}

class GamerScreen extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const GamerScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "I AM GAMER",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: onThemeChanged, //tombol switch
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/hacker.png', width: 150),
            const SizedBox(height: 20),
            ..._buildGamerTraits(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildGamerTraits(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    List<Map<String, String>> traits = [
      {
        "emoji": "🎮",
        "title": "Rutinitas Harian",
        "description":
            "Bermain game lebih dari 6 jam sehari adalah hal yang biasa. Semakin seru permainannya, semakin lupa waktu!"
      },
      {
        "emoji": "🖥️",
        "title": "Setup Gaming",
        "description":
            "RGB everywhere! Semakin keren setup gaming, semakin puas rasanya bermain game favorit dengan pengalaman maksimal."
      },
      {
        "emoji": "🍕",
        "title": "Kebiasaan Buruk",
        "description":
            "Sering lupa makan atau malah makan sambil main game. Fast food dan camilan jadi teman setia di meja gaming."
      },
      {
        "emoji": "😴",
        "title": "Tidur Tidak Teratur",
        "description":
            "Begadang demi push rank atau grinding item langka. Tidur siang jadi solusi agar tetap bisa lanjut gaming di malam hari."
      },
      {
        "emoji": "💸",
        "title": "Boros",
        "description":
            "Sering menghabiskan uang untuk top-up game, beli skin keren, atau bahkan upgrade gear gaming yang lebih canggih."
      },
    ];

    return traits.map((trait) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : const Color.fromARGB(255, 175, 199, 205), 
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black54 : const Color.fromARGB(31, 225, 223, 223), 
              blurRadius: 5,
              spreadRadius: 2,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  trait["emoji"]!,
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    trait["title"]!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color.fromARGB(179, 0, 0, 0), 
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              trait["description"]!,
              style: TextStyle(
                fontSize: 14,
                color: isDark ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
