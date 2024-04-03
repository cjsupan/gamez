import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../models/valorant/maps.dart';

class MapsProvider extends ChangeNotifier {
  final List<Maps> _maps = [];
  final _selectedMap = [];

  Dio dio = Dio();

  List<Maps> get maps {
    return [..._maps];
  }

  get selectedMap {
    return [..._selectedMap];
  }

  Maps findById({required String mapId}) {
    // Find the map by ID
    //store the map in the selectedMap

    final map = _maps.firstWhere((d) => d.uuid == mapId);

    _selectedMap.clear(); // Clear previous selection (optional)
    _selectedMap.add(map);
    notifyListeners();
    return map;
  }

  Future<void> fetchMaps({
    required BuildContext context,
  }) async {
    const url = 'https://valorant-api.com/v1/maps';
    final response = await dio.get(url);
    final data = response.data['data'];

    _maps.clear();
    List<Maps> maps = [];

    for (final map in data) {
      maps.add(Maps.fromJson(map));
    }

    _maps.addAll(maps);

    notifyListeners();
  }
}
