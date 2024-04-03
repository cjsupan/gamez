import 'package:flutter/material.dart';
import 'package:gamerz/widgets/my_app_bar.dart';

class ListItem {
  final String title;
  final String routeName; // Route name for navigation
  final String backgroundImage; // Path to the background image (String)

  const ListItem({
    required this.title,
    required this.routeName,
    required this.backgroundImage,
  });
}

final List<ListItem> listItems = [
  const ListItem(
      title: 'Agents',
      routeName: '/agents', // Replace with actual route name
      backgroundImage: 'assets/images/valorant/agents.jpg'),
  const ListItem(
    title: 'Maps',
    routeName: '/maps', // Replace with actual route name
    backgroundImage: 'assets/images/valorant/maps.jpg',
  ),
  const ListItem(
      title: 'Buddies',
      routeName: '/buddies', // Replace with actual route name
      backgroundImage: 'assets/images/valorant/buddies.jpg'),
  // Add similar items for buddies and bundles with appropriate route names and colors
];

class ValHome extends StatefulWidget {
  static const routeName = '/valorant';
  const ValHome({super.key});

  @override
  State<ValHome> createState() => _HomeState();
}

class _HomeState extends State<ValHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(title: 'Valorant'),
        body: ListView.separated(
          itemCount: 3,
          separatorBuilder: (context, index) => const SizedBox(height: 10.0),
          itemBuilder: (context, index) => GestureDetector(
            child: GestureDetector(
              onTap: () => {
                // Handle tile tap (e.g., navigate to the corresponding screen)
                Navigator.pushNamed(context, listItems[index].routeName),
              },
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        opacity: 0.5,
                        image: AssetImage(listItems[index].backgroundImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      listItems[index].title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'valorant',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
