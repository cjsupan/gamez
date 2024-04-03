class Maps {
  final String uuid;
  final String displayName;
  final String narrativeDescription;
  final String tacticalDescription;
  final String coordinates;
  final String displayIcon;
  final String listViewIcon;
  final String listViewIconTall;
  final String splash;
  final String stylizedBackgroundImage;
  final String premierBackgroundImage;
  final String assetPath;
  final String mapUrl;
  final double xMultiplier;
  final double yMultiplier;
  final double xScalarToAdd;
  final double yScalarToAdd;

  Maps({
    required this.uuid,
    required this.displayName,
    required this.narrativeDescription,
    required this.tacticalDescription,
    required this.coordinates,
    required this.displayIcon,
    required this.listViewIcon,
    required this.listViewIconTall,
    required this.splash,
    required this.stylizedBackgroundImage,
    required this.premierBackgroundImage,
    required this.assetPath,
    required this.mapUrl,
    required this.xMultiplier,
    required this.yMultiplier,
    required this.xScalarToAdd,
    required this.yScalarToAdd,
  });

  factory Maps.fromJson(Map<String, dynamic> json) {
    return Maps(
      uuid: json['uuid'],
      displayName: json['displayName'],
      narrativeDescription: json['narrativeDescription'] ?? '',
      tacticalDescription: json['tacticalDescription'] ?? '',
      coordinates: json['coordinates'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
      listViewIcon: json['listViewIcon'] ?? '',
      listViewIconTall: json['listViewIconTall'] ?? '',
      splash: json['splash'] ?? '',
      stylizedBackgroundImage: json['stylizedBackgroundImage'] ?? '',
      premierBackgroundImage: json['premierBackgroundImage'] ?? '',
      assetPath: json['assetPath'] ?? '',
      mapUrl: json['mapUrl'] ?? '',
      xMultiplier: double.parse(json['xMultiplier'].toString()),
      yMultiplier: double.parse(json['yMultiplier'].toString()),
      xScalarToAdd: double.parse(json['xScalarToAdd'].toString()),
      yScalarToAdd: double.parse(json['yScalarToAdd'].toString()),
    );
  }
}
