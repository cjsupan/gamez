import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gamerz/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

import '../../providers/valorant/weapons.dart';
import 'weapon_details.dart';

class Weapons extends StatefulWidget {
  const Weapons({super.key});
  static const routeName = '/weapons';

  @override
  State<Weapons> createState() => _WeaponsState();
}

class _WeaponsState extends State<Weapons> {
  @override
  void initState() {
    _fetchData(context);
    super.initState();
  }

  Future<void> _fetchData(BuildContext context) async {
    await Provider.of<WeaponsProvider>(context, listen: false)
        .fetchWeapons(context: context);

    try {
      if (!mounted) return;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final weapons = Provider.of<WeaponsProvider>(context).weapons;
    return Scaffold(
      appBar: const MyAppBar(title: 'Weapons'),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: weapons.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      final weaponId = weapons[index].uuid;
                      Provider.of<WeaponsProvider>(context, listen: false)
                          .findById(weaponId: weaponId);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const WeaponDetails();
                      }));
                    },
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: AspectRatio(
                                aspectRatio: 2,
                                child: CachedNetworkImage(
                                  imageUrl: weapons[index].displayIcon,
                                  progressIndicatorBuilder:
                                      (context, url, progress) => Center(
                                    child: CircularProgressIndicator(
                                        value: progress.progress),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(0, 0, 0, 0.3),
                                ),
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  weapons[index].displayName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ));
              },
            )),
      ),
    );
  }
}
