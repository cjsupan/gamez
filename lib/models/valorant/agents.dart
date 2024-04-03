// uuid string
// displayName string (localized)
// description string (localized)
// developerName string
// characterTags string[] (localized)
// displayIcon string
// displayIconSmall string
// bustPortrait string
// fullPortrait string
// fullPortraitV2 string
// killfeedPortrait string
// background string
// backgroundGradientColors string[]
// assetPath string
// isFullPortraitRightFacing boolean
// isPlayableCharacter boolean
// isAvailableForTest boolean
// isBaseContent boolean
// role object {5}
// uuid string
// displayName string (localized)
// description string (localized)
// displayIcon string
// assetPath string
// recruitmentData object {7}
// counterId string
// milestoneId string
// milestoneThreshold int32
// useLevelVpCostOverride boolean
// levelVpCostOverride int32
// startDate dateTime
// endDate dateTime
// abilities object[] {4}
// slot string
// displayName string (localized)
// description string (localized)
// displayIcon string
// voiceLine object {3}
// minDuration single
// maxDuration single
// mediaList object[] {3}
// id int32
// wwise string
// wave string

class Agents {
  final String uuid;
  final String displayName;
  final String description;
  final String? developerName;
  // final List<String>? characterTags;
  final String displayIcon;
  final String displayIconSmall;
  final String bustPortrait;
  final String fullPortrait;
  final String fullPortraitV2;
  final String killfeedPortrait;
  final String background;
  // final List<String>? backgroundGradientColors;
  final String assetPath;
  final bool isFullPortraitRightFacing;
  final bool isPlayableCharacter;
  final bool isAvailableForTest;
  final bool isBaseContent;
  final Role? role;
  final RecruitmentData? recruitmentData;
  final List<Abilities>? abilities;

  Agents({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.developerName,
    // required this.characterTags,
    required this.displayIcon,
    required this.displayIconSmall,
    required this.bustPortrait,
    required this.fullPortrait,
    required this.fullPortraitV2,
    required this.killfeedPortrait,
    required this.background,
    // required this.backgroundGradientColors,
    required this.assetPath,
    required this.isFullPortraitRightFacing,
    required this.isPlayableCharacter,
    required this.isAvailableForTest,
    required this.isBaseContent,
    this.role,
    this.recruitmentData,
    this.abilities,
  });

  factory Agents.fromJson(Map<String, dynamic> json) {
    return Agents(
      uuid: json['uuid'],
      displayName: json['displayName'],
      description: json['description'],
      developerName: json['developerName'],
      // characterTags: List<String>.from(json['characterTags']),
      displayIcon: json['displayIcon'],
      displayIconSmall: json['displayIconSmall'],
      bustPortrait: json['bustPortrait'] ?? '',
      fullPortrait: json['fullPortrait'] ?? '',
      fullPortraitV2: json['fullPortraitV2'] ?? '',
      killfeedPortrait: json['killfeedPortrait'] ?? '',
      background: json['background'] ?? '',
      // backgroundGradientColors:
      //     List<String>.from(json['backgroundGradientColors']),
      assetPath: json['assetPath'],
      isFullPortraitRightFacing: json['isFullPortraitRightFacing'],
      isPlayableCharacter: json['isPlayableCharacter'],
      isAvailableForTest: json['isAvailableForTest'],
      isBaseContent: json['isBaseContent'],
      role: json['role'] != null ? Role.fromJson(json['role']) : null,
      recruitmentData: json['recruitmentData'] != null
          ? RecruitmentData.fromJson(json['recruitmentData'])
          : null,
      abilities: json['abilities'] != null
          ? List<Abilities>.from(
              json['abilities'].map((x) => Abilities.fromJson(x)))
          : null,
    );
  }

  toJson() {}
}

class Role {
  final String uuid;
  final String displayName;
  final String description;
  final String displayIcon;
  final String assetPath;

  Role({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.assetPath,
  });

  //past error Unhandled Exception: type 'Null' is not a subtype of type 'Map<String, dynamic>'
  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      uuid: json['uuid'],
      displayName: json['displayName'],
      description: json['description'],
      displayIcon: json['displayIcon'],
      assetPath: json['assetPath'],
    );
  }
}

class Abilities {
  final String? slot;
  final String? displayName;
  final String? description;
  final String? displayIcon;

  Abilities({
    this.slot,
    this.displayName,
    this.description,
    this.displayIcon,
  });

  factory Abilities.fromJson(Map<String, dynamic> json) {
    return Abilities(
      slot: json['slot'],
      displayName: json['displayName'],
      description: json['description'],
      displayIcon: json['displayIcon'],
    );
  }
}

class MediaList {
  final int id;
  final String wwise;
  final String wave;

  MediaList({
    required this.id,
    required this.wwise,
    required this.wave,
  });

  factory MediaList.fromJson(Map<String, dynamic> json) {
    return MediaList(
      id: json['id'],
      wwise: json['wwise'],
      wave: json['wave'],
    );
  }
}

class VoiceLine {
  final String id;
  final String value;
  final String type;

  VoiceLine({
    required this.id,
    required this.value,
    required this.type,
  });

  factory VoiceLine.fromJson(Map<String, dynamic> json) {
    return VoiceLine(
      id: json['id'],
      value: json['value'],
      type: json['type'],
    );
  }
}

class RecruitmentData {
  final String? counterId;
  final String? milestoneId;
  final int? milestoneThreshold;
  final bool? useLevelVpCostOverride;
  final int? levelVpCostOverride;
  final DateTime? startDate;
  final DateTime? endDate;

  RecruitmentData({
    this.counterId,
    this.milestoneId,
    this.milestoneThreshold,
    this.useLevelVpCostOverride,
    this.levelVpCostOverride,
    this.startDate,
    this.endDate,
  });

  factory RecruitmentData.fromJson(Map<String, dynamic> json) {
    return RecruitmentData(
      counterId: json['counterId'],
      milestoneId: json['milestoneId'],
      milestoneThreshold: json['milestoneThreshold'],
      useLevelVpCostOverride: json['useLevelVpCostOverride'],
      levelVpCostOverride: json['levelVpCostOverride'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }
}
