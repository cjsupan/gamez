import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../models/valorant/weapons.dart';

class WeaponsProvider extends ChangeNotifier {
  final List<Weapons> _weapons = [];
  final _selectedWeapon = [];

  Dio dio = Dio();

  List<Weapons> get weapons {
    return [..._weapons];
  }

  get selectedWeapon {
    return [..._selectedWeapon];
  }

  Weapons findById({required String weaponId}) {
    // Find the weapon by ID
    //store the weapon in the selectedWeapon

    final weapon = _weapons.firstWhere((d) => d.uuid == weaponId);

    _selectedWeapon.clear(); // Clear previous selection (optional)
    _selectedWeapon.add(weapon);
    notifyListeners();
    return weapon;
  }

  Future<void> fetchWeapons({
    required BuildContext context,
  }) async {
    const url = 'https://valorant-api.com/v1/weapons';
    final response = await dio.get(url);
    final data = response.data['data'];

    _weapons.clear();
    List<Weapons> weapons = [];

    for (final weapon in data) {
      weapons.add(Weapons.fromJson(weapon));
    }

    _weapons.addAll(weapons);

    notifyListeners();
  }
}
