import "package:cached_network_image/cached_network_image.dart";
import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../../widgets/my_app_bar.dart";

import "../../providers/valorant/weapons.dart";

class WeaponDetails extends StatelessWidget {
  const WeaponDetails({super.key});

  static const routeName = '/weapon-details';

  @override
  Widget build(BuildContext context) {
    final weapon = Provider.of<WeaponsProvider>(context).selectedWeapon.first;

    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: MyAppBar(title: weapon.displayName),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: mediaQuery.size.width,
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/valorant/valorant_bg.jpg'),
                    opacity: 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(40),
                width: mediaQuery.size.width,
                height: 250,
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  imageUrl: weapon.displayIcon,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Details',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: Text(
                          'Cost: ${weapon.shopData.cost}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: Text(
                          'Category: ${weapon.shopData.categoryText}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                const SizedBox(height: 20),
                const Padding(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    child: Text(
                      'Damage',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: Text(
                          'Head: ${weapon.weaponStats.damageRanges[0].headDamage}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: Text(
                          'Body: ${weapon.weaponStats.damageRanges[0].bodyDamage}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: Text(
                          'Leg: ${weapon.weaponStats.damageRanges[0].legDamage}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Skins',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'valorant',
            ),
          ),
          const SizedBox(height: 20),
          CarouselSlider(
            items: weapon.skins
                .map<Widget>((e) => Stack(
                      children: [
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/valorant/weapon_bg.jpg'),
                                  fit: BoxFit.cover,
                                  opacity: 0.8,
                                ),
                              ),
                              child: AspectRatio(
                                aspectRatio: 2,
                                child: CachedNetworkImage(
                                  imageUrl: e.displayIcon,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                            ),
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              e.displayName,
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
                    ))
                .toList(),
            options: CarouselOptions(
              height: 200,
              aspectRatio: 1,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(height: 40),
        ],
      )),
    );
  }
}
