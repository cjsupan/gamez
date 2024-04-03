import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home.dart';
import './providers/valorant/agents.dart';
import './providers/valorant/maps.dart';
import './providers/valorant/weapons.dart';
import './screens/valorant/agents.dart';
import './screens/valorant/agent_details.dart';
import './screens/valorant/maps.dart';
import './screens/valorant/map_details.dart';
import './screens/valorant/weapons.dart';
import './screens/valorant/weapon_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AgentsProvider()),
          ChangeNotifierProvider(create: (_) => MapsProvider()),
          ChangeNotifierProvider(create: (_) => WeaponsProvider()),
        ],
        child: MaterialApp(
          home: const Home(),
          title: 'Gamerz',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                accentColor: Colors.blueGrey.shade800,
                cardColor: Colors.blueGrey.shade900,
                backgroundColor: Colors.blueGrey.shade900,
                errorColor: Colors.redAccent,
                brightness: Brightness.dark,
              ),
              useMaterial3: true),
          routes: {
            Home.routeName: (context) => const Home(),
            Agents.routeName: (context) => const Agents(),
            AgentDetails.routeName: (context) => const AgentDetails(),
            Maps.routeName: (context) => const Maps(),
            MapDetails.routeName: (context) => const MapDetails(),
            Weapons.routeName: (context) => const Weapons(),
            WeaponDetails.routeName: (context) => const WeaponDetails(),
          },
        ));
  }
}
