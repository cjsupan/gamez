import 'package:flutter/material.dart';
import 'package:gamerz/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';
import '../../providers/valorant/maps.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'map_details.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});
  static const routeName = '/maps';

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  void initState() {
    _fetchData(context);
    super.initState();
  }

  Future<void> _fetchData(BuildContext context) async {
    await Provider.of<MapsProvider>(context, listen: false)
        .fetchMaps(context: context);

    try {
      if (!mounted) return;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final maps = Provider.of<MapsProvider>(context).maps;

    return Scaffold(
      appBar: const MyAppBar(title: 'Maps'),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: maps.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      final mapId = maps[index].uuid;
                      Provider.of<MapsProvider>(context, listen: false)
                          .findById(mapId: mapId);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const MapDetails();
                      }));
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                            width: double.infinity,
                            height: 250,
                            child: CachedNetworkImage(
                              imageUrl: maps[index].splash,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, progress) => Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            )),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Text(
                            maps[index].displayName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'valorant',
                            ),
                          ),
                        ),
                      ],
                    ));
              },
            )),
      ),
    );
  }
}
