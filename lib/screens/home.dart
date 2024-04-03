import 'package:flutter/material.dart';
import 'package:gamerz/screens/valorant/home.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Gamerz',
            style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () => {
              // Handle settings button press (e.g., navigate to a settings page)
              print('Settings button pressed!')
            },
          ),
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Valorant Tile
                GestureDetector(
                  onTap: () => {
                    // Handle Valorant tile tap (e.g., navigate to Valorant screen)
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ValHome();
                    })),
                  },
                  child: Stack(
                    // Use Stack to layer content
                    children: [
                      // Background Image with Opacity
                      Container(
                        width: 170,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            opacity: 0.8,
                            image: AssetImage(
                                'assets/images/valorant/valorant_bg.jpg'), // Replace with your image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Content on top with opacity
                      Container(
                        width: 170,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5), // 50% opacity
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Valorant',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'valorant'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 20.0), // Add spacing between tiles
                // League of Legends Tile
                GestureDetector(
                  onTap: () => {
                    // Handle League of Legends tile tap (e.g., navigate to LoL screen)
                    print('League of Legends tile tapped!'),
                  },
                  child: Stack(
                    // Use Stack to layer content
                    children: [
                      // Background Image with Opacity
                      Container(
                        width: 170,
                        height: 100,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            opacity: 0.8,
                            image: AssetImage(
                                'assets/images/lol/lol_bg.jpg'), // Replace with your image path
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      // Content on top with opacity
                      Container(
                        width: 170,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5), // 50% opacity
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Text(
                            'League of Legends',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'lol'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
