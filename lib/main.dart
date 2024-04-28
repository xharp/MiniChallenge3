import 'package:flutter/material.dart';
import 'package:mini_challenge_kelompok1/customPainter.dart';

void main() {
  runApp(DigitalCardApp());
}

class DigitalCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Card',
      home: DigitalCardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DigitalCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Card'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Lebar > 600 pixel: Layout horizontal
            return HorizontalDigitalCard();
          } else {
            // Lebar < 600 pixel: Layout vertikal
            return VerticalDigitalCard();
          }
        },
      ),
    );
  }
}

class HorizontalDigitalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Colors.indigo[700]!,
              Colors.indigo[300]!,
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: CustomPaint(
            size: Size(
              MediaQuery.of(context).size.width * 0.8,
              MediaQuery.of(context).size.height * 0.7,
            ),
            painter: HorizontalCustomPainter(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 20),
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'SIMON PETRUS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        left: 20,
                        child: Image.asset(
                          'assets/2.png',
                          width: MediaQuery.of(context).size.width * 0.7,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 10),
                      detailWidget(
                        icon: Icons.work,
                        text: 'Ojol Driver',
                      ),
                      detailWidget(
                        icon: Icons.call,
                        text: '+62 851 5774 1740',
                      ),
                      detailWidget(
                        icon: Icons.email,
                        text: 'simonmeng@gmail.com',
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VerticalDigitalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Colors.indigo[700]!,
              Colors.indigo[300]!,
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width * 0.8,
                MediaQuery.of(context).size.height * 0.7),
            painter: VerticalCustomPainter(),
            child: Stack(
              children: [
                Positioned(
                  bottom: 30,
                  left: 20,
                  child: Image.asset(
                    'assets/2.png',
                    width: MediaQuery.of(context).size.width * 0.7,
                    color: Colors.white70,
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 30),
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'SIMON PETRUS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 60),
                    detailWidget(
                      icon: Icons.work,
                      text: 'Ojol Driver',
                    ),
                    detailWidget(
                      icon: Icons.call,
                      text: '+62 851 5774 1740',
                    ),
                    detailWidget(
                      icon: Icons.email,
                      text: 'simonmeng@gmail.com',
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget detailWidget({required IconData icon, required String text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: Colors.white70,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.white30.withOpacity(0.2),
        ),
      ],
    ),
  );
}
