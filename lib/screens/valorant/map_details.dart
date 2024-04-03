import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../../providers/valorant/maps.dart";
import "../../widgets/my_app_bar.dart";
import 'package:carousel_slider/carousel_slider.dart';

class MapDetails extends StatelessWidget {
  const MapDetails({super.key});

  static const routeName = '/map-details';

  @override
  Widget build(BuildContext context) {
    final map = Provider.of<MapsProvider>(context).selectedMap.first;
    return Scaffold(
      appBar: MyAppBar(title: map.displayName),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: [map.splash, map.displayIcon]
                  .map((e) => AspectRatio(
                        aspectRatio: 2,
                        child: CachedNetworkImage(
                          imageUrl: e,
                          fit: BoxFit.cover,
                        ),
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
            const SizedBox(height: 10),
            Text(
              map.displayName,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'valorant',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Text(
                      'Coordinates: ${map.coordinates}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 5),
                child: Text(
                  map.narrativeDescription,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                )),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
