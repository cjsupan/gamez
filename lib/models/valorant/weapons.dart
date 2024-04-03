// uuid string
// displayName string (localized)
// category string
// defaultSkinUuid string
// displayIcon string
// killStreamIcon string
// assetPath string
// weaponStats object {15}
// fireRate single
// magazineSize int32
// runSpeedMultiplier single
// equipTimeSeconds single
// reloadTimeSeconds single
// firstBulletAccuracy single
// shotgunPelletCount int32
// wallPenetration string
// feature string
// fireMode string
// altFireType string
// adsStats object {5}
// zoomMultiplier single
// fireRate single
// runSpeedMultiplier single
// burstCount int32
// firstBulletAccuracy single
// altShotgunStats object {2}
// shotgunPelletCount int32
// burstRate single
// airBurstStats object {2}
// shotgunPelletCount int32
// burstDistance single
// damageRanges object[] {5}
// rangeStartMeters single
// rangeEndMeters single
// headDamage single
// bodyDamage single
// legDamage single
// shopData object {10}
// cost int32
// category string
// shopOrderPriority int32
// categoryText string (localized)
// gridPosition object {2}
// row int32
// column int32
// canBeTrashed boolean
// image string
// newImage string
// newImage2 string
// assetPath string
// skins object[] {9}
// uuid string
// displayName string (localized)
// themeUuid string
// contentTierUuid string
// displayIcon string
// wallpaper string
// assetPath string
// chromas object[] {7}
// uuid string
// displayName string (localized)
// displayIcon string
// fullRender string
// swatch string
// streamedVideo string
// assetPath string
// levels object[] {6}
// uuid string
// displayName string (localized)
// levelItem string
// displayIcon string
// streamedVideo string
// assetPath string

class Weapons {
  final String uuid;
  final String displayName;
  final String category;
  final String defaultSkinUuid;
  final String displayIcon;
  final String killStreamIcon;
  final String assetPath;
  final WeaponStats weaponStats;
  final ShopData shopData;
  final List<Skins> skins;

  Weapons({
    required this.uuid,
    required this.displayName,
    required this.category,
    required this.defaultSkinUuid,
    required this.displayIcon,
    required this.killStreamIcon,
    required this.assetPath,
    required this.weaponStats,
    required this.shopData,
    required this.skins,
  });

  factory Weapons.fromJson(Map<String, dynamic> json) {
    return Weapons(
      uuid: json['uuid'],
      displayName: json['displayName'],
      category: json['category'],
      defaultSkinUuid: json['defaultSkinUuid'],
      displayIcon: json['displayIcon'],
      killStreamIcon: json['killStreamIcon'],
      assetPath: json['assetPath'],
      weaponStats: json['weaponStats'] == null
          ? WeaponStats(
              fireRate: 0,
              magazineSize: 0,
              runSpeedMultiplier: 0,
              equipTimeSeconds: 0,
              reloadTimeSeconds: 0,
              firstBulletAccuracy: 0,
              shotgunPelletCount: 0,
              wallPenetration: '',
              feature: '',
              fireMode: '',
              altFireType: '',
              adsStats: AdsStats(
                zoomMultiplier: 0,
                fireRate: 0,
                runSpeedMultiplier: 0,
                burstCount: 0,
                firstBulletAccuracy: 0,
              ),
              altShotgunStats:
                  AltShotgunStats(shotgunPelletCount: 0, burstRate: 0),
              airBurstStats:
                  AirBurstStats(shotgunPelletCount: 0, burstDistance: 0),
              damageRanges: [],
            )
          : WeaponStats.fromJson(json['weaponStats']),
      shopData: json['shopData'] == null
          ? ShopData(
              cost: 0,
              category: '',
              shopOrderPriority: 0,
              categoryText: '',
              gridPosition: GridPosition(row: 0, column: 0),
              canBeTrashed: false,
              image: '',
              newImage: '',
              newImage2: '',
              assetPath: '',
            )
          : ShopData.fromJson(json['shopData']),
      skins: json['skins'] == null
          ? []
          : List<Skins>.from(json['skins'].map((x) => Skins.fromJson(x))),
    );
  }

  toJson() {}
}

class WeaponStats {
  final double fireRate;
  final int magazineSize;
  final double runSpeedMultiplier;
  final double equipTimeSeconds;
  final double reloadTimeSeconds;
  final double firstBulletAccuracy;
  final int shotgunPelletCount;
  final String wallPenetration;
  final String feature;
  final String fireMode;
  final String altFireType;
  final AdsStats adsStats;
  final AltShotgunStats altShotgunStats;
  final AirBurstStats airBurstStats;
  final List<DamageRanges> damageRanges;

  WeaponStats({
    required this.fireRate,
    required this.magazineSize,
    required this.runSpeedMultiplier,
    required this.equipTimeSeconds,
    required this.reloadTimeSeconds,
    required this.firstBulletAccuracy,
    required this.shotgunPelletCount,
    required this.wallPenetration,
    required this.feature,
    required this.fireMode,
    required this.altFireType,
    required this.adsStats,
    required this.altShotgunStats,
    required this.airBurstStats,
    required this.damageRanges,
  });

  factory WeaponStats.fromJson(Map<String, dynamic> json) {
    return WeaponStats(
      fireRate: double.parse(json['fireRate'].toString()),
      magazineSize: json['magazineSize'] as int,
      runSpeedMultiplier: double.parse(json['runSpeedMultiplier'].toString()),
      equipTimeSeconds: double.parse(json['equipTimeSeconds'].toString()),
      reloadTimeSeconds: double.parse(json['reloadTimeSeconds'].toString()),
      firstBulletAccuracy: double.parse(json['firstBulletAccuracy'].toString()),
      shotgunPelletCount: json['shotgunPelletCount'],
      wallPenetration: json['wallPenetration'],
      feature: json['feature'] ?? '',
      fireMode: json['fireMode'] ?? '',
      altFireType: json['altFireType'] ?? '',
      adsStats: json['adsStats'] == null
          ? AdsStats(
              zoomMultiplier: 0,
              fireRate: 0,
              runSpeedMultiplier: 0,
              burstCount: 0,
              firstBulletAccuracy: 0,
            )
          : AdsStats.fromJson(json['adsStats']),
      altShotgunStats: json['altShotgunStats'] == null
          ? AltShotgunStats(shotgunPelletCount: 0, burstRate: 0)
          : AltShotgunStats.fromJson(json['altShotgunStats']),
      airBurstStats: json['airBurstStats'] == null
          ? AirBurstStats(shotgunPelletCount: 0, burstDistance: 0)
          : AirBurstStats.fromJson(json['airBurstStats']),
      damageRanges: json['damageRanges'] == null
          ? []
          : List<DamageRanges>.from(
              json['damageRanges'].map((x) => DamageRanges.fromJson(x))),
    );
  }
}

class AdsStats {
  final double zoomMultiplier;
  final double fireRate;
  final double runSpeedMultiplier;
  final int burstCount;
  final double firstBulletAccuracy;

  AdsStats({
    required this.zoomMultiplier,
    required this.fireRate,
    required this.runSpeedMultiplier,
    required this.burstCount,
    required this.firstBulletAccuracy,
  });

  factory AdsStats.fromJson(Map<String, dynamic> json) {
    return AdsStats(
      zoomMultiplier: double.parse(json['zoomMultiplier'].toString()),
      fireRate: double.parse(json['fireRate'].toString()),
      runSpeedMultiplier: json['runSpeedMultiplier'],
      burstCount: json['burstCount'],
      firstBulletAccuracy: double.parse(json['firstBulletAccuracy'].toString()),
    );
  }
}

class AltShotgunStats {
  final int shotgunPelletCount;
  final double burstRate;

  AltShotgunStats({
    required this.shotgunPelletCount,
    required this.burstRate,
  });

  factory AltShotgunStats.fromJson(Map<String, dynamic> json) {
    return AltShotgunStats(
      shotgunPelletCount: json['shotgunPelletCount'],
      burstRate: json['burstRate'],
    );
  }
}

class AirBurstStats {
  final int shotgunPelletCount;
  final double burstDistance;

  AirBurstStats({
    required this.shotgunPelletCount,
    required this.burstDistance,
  });

  factory AirBurstStats.fromJson(Map<String, dynamic> json) {
    return AirBurstStats(
      shotgunPelletCount: json['shotgunPelletCount'],
      burstDistance: json['burstDistance'],
    );
  }
}

class DamageRanges {
  final double rangeStartMeters;
  final double rangeEndMeters;
  final double headDamage;
  final double bodyDamage;
  final double legDamage;

  DamageRanges({
    required this.rangeStartMeters,
    required this.rangeEndMeters,
    required this.headDamage,
    required this.bodyDamage,
    required this.legDamage,
  });

  factory DamageRanges.fromJson(Map<String, dynamic> json) {
    return DamageRanges(
      rangeStartMeters: double.parse(json['rangeStartMeters'].toString()),
      rangeEndMeters: double.parse(json['rangeEndMeters'].toString()),
      headDamage: double.parse(json['headDamage'].toString()),
      bodyDamage: double.parse(json['bodyDamage'].toString()),
      legDamage: double.parse(json['legDamage'].toString()),
    );
  }
}

class ShopData {
  final int cost;
  final String category;
  final int shopOrderPriority;
  final String categoryText;
  final GridPosition gridPosition;
  final bool canBeTrashed;
  final String image;
  final String newImage;
  final String newImage2;
  final String assetPath;

  ShopData({
    required this.cost,
    required this.category,
    required this.shopOrderPriority,
    required this.categoryText,
    required this.gridPosition,
    required this.canBeTrashed,
    required this.image,
    required this.newImage,
    required this.newImage2,
    required this.assetPath,
  });

  factory ShopData.fromJson(Map<String, dynamic> json) {
    return ShopData(
      cost: json['cost'],
      category: json['category'] ?? '',
      shopOrderPriority: json['shopOrderPriority'],
      categoryText: json['categoryText'] ?? '',
      gridPosition: json['gridPosition'] == null
          ? GridPosition(row: 0, column: 0)
          : GridPosition.fromJson(json['gridPosition']),
      canBeTrashed: json['canBeTrashed'],
      image: json['image'] ?? '',
      newImage: json['newImage'] ?? '',
      newImage2: json['newImage2'] ?? '',
      assetPath: json['assetPath'] ?? '',
    );
  }
}

class GridPosition {
  final int row;
  final int column;

  GridPosition({
    required this.row,
    required this.column,
  });

  factory GridPosition.fromJson(Map<String, dynamic> json) {
    return GridPosition(
      row: json['row'],
      column: json['column'],
    );
  }
}

class Skins {
  final String uuid;
  final String displayName;
  final String themeUuid;
  final String contentTierUuid;
  final String displayIcon;
  final String wallpaper;
  final String assetPath;
  final List<Chromas> chromas;
  final List<Levels> levels;

  Skins({
    required this.uuid,
    required this.displayName,
    required this.themeUuid,
    required this.contentTierUuid,
    required this.displayIcon,
    required this.wallpaper,
    required this.assetPath,
    required this.chromas,
    required this.levels,
  });

  factory Skins.fromJson(Map<String, dynamic> json) {
    return Skins(
      uuid: json['uuid'],
      displayName: json['displayName'] ?? '',
      themeUuid: json['themeUuid'] ?? '',
      contentTierUuid: json['contentTierUuid'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
      wallpaper: json['wallpaper'] ?? '',
      assetPath: json['assetPath'] ?? '',
      chromas:
          List<Chromas>.from(json['chromas'].map((x) => Chromas.fromJson(x))),
      levels: List<Levels>.from(json['levels'].map((x) => Levels.fromJson(x))),
    );
  }
}

class Chromas {
  final String uuid;
  final String displayName;
  final String displayIcon;
  final String fullRender;
  final String swatch;
  final String streamedVideo;
  final String assetPath;

  Chromas({
    required this.uuid,
    required this.displayName,
    required this.displayIcon,
    required this.fullRender,
    required this.swatch,
    required this.streamedVideo,
    required this.assetPath,
  });

  factory Chromas.fromJson(Map<String, dynamic> json) {
    return Chromas(
      uuid: json['uuid'],
      displayName: json['displayName'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
      fullRender: json['fullRender'] ?? '',
      swatch: json['swatch'] ?? '',
      streamedVideo: json['streamedVideo'] ?? '',
      assetPath: json['assetPath'] ?? '',
    );
  }
}

class Levels {
  final String uuid;
  final String displayName;
  final String levelItem;
  final String displayIcon;
  final String streamedVideo;
  final String assetPath;

  Levels({
    required this.uuid,
    required this.displayName,
    required this.levelItem,
    required this.displayIcon,
    required this.streamedVideo,
    required this.assetPath,
  });

  factory Levels.fromJson(Map<String, dynamic> json) {
    return Levels(
      uuid: json['uuid'],
      displayName: json['displayName'] ?? '',
      levelItem: json['levelItem'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
      streamedVideo: json['streamedVideo'] ?? '',
      assetPath: json['assetPath'] ?? '',
    );
  }
}
