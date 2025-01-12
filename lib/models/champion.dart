// this is the model for the champion data. it represents the data that is returned from the API
class Champion {
  final String id;
  final String name;
  final String title;
  final String blurb;
  final ChampionInfo info;
  final ChampionImage image;
  final List<String> tags;
  final String partype;
  final ChampionStats stats;

  Champion({
    required this.id,
    required this.name,
    required this.title,
    required this.blurb,
    required this.info,
    required this.image,
    required this.tags,
    required this.partype,
    required this.stats,
  });

  factory Champion.fromJson(Map<String, dynamic> json) {
    return Champion(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      blurb: json['blurb'],
      info: ChampionInfo.fromJson(json['info']),
      image: ChampionImage.fromJson(json['image']),
      tags: List<String>.from(json['tags']),
      partype: json['partype'],
      stats: ChampionStats.fromJson(json['stats']),
    );
  }
}

class ChampionInfo {
  final int attack;
  final int defense;
  final int magic;
  final int difficulty;

  ChampionInfo({
    required this.attack,
    required this.defense,
    required this.magic,
    required this.difficulty,
  });

  factory ChampionInfo.fromJson(Map<String, dynamic> json) {
    return ChampionInfo(
      attack: json['attack'],
      defense: json['defense'],
      magic: json['magic'],
      difficulty: json['difficulty'],
    );
  }
}

class ChampionImage {
  final String full;
  final String sprite;
  final String group;
  final int x;
  final int y;
  final int w;
  final int h;

  ChampionImage({
    required this.full,
    required this.sprite,
    required this.group,
    required this.x,
    required this.y,
    required this.w,
    required this.h,
  });

  factory ChampionImage.fromJson(Map<String, dynamic> json) {
    return ChampionImage(
      full: json['full'],
      sprite: json['sprite'],
      group: json['group'],
      x: json['x'],
      y: json['y'],
      w: json['w'],
      h: json['h'],
    );
  }
}

class ChampionStats {
  final double hp;
  final double hpperlevel;
  final double mp;
  final double mpperlevel;
  final double movespeed;
  final double armor;
  final double armorperlevel;
  final double spellblock;
  final double spellblockperlevel;
  final double attackrange;
  final double hpregen;
  final double hpregenperlevel;
  final double mpregen;
  final double mpregenperlevel;
  final double crit;
  final double critperlevel;
  final double attackdamage;
  final double attackdamageperlevel;
  final double attackspeedperlevel;
  final double attackspeed;

  ChampionStats({
    required this.hp,
    required this.hpperlevel,
    required this.mp,
    required this.mpperlevel,
    required this.movespeed,
    required this.armor,
    required this.armorperlevel,
    required this.spellblock,
    required this.spellblockperlevel,
    required this.attackrange,
    required this.hpregen,
    required this.hpregenperlevel,
    required this.mpregen,
    required this.mpregenperlevel,
    required this.crit,
    required this.critperlevel,
    required this.attackdamage,
    required this.attackdamageperlevel,
    required this.attackspeedperlevel,
    required this.attackspeed,
  });

  factory ChampionStats.fromJson(Map<String, dynamic> json) {
    return ChampionStats(
      hp: json['hp']?.toDouble() ?? 0.0,
      hpperlevel: json['hpperlevel']?.toDouble() ?? 0.0,
      mp: json['mp']?.toDouble() ?? 0.0,
      mpperlevel: json['mpperlevel']?.toDouble() ?? 0.0,
      movespeed: json['movespeed']?.toDouble() ?? 0.0,
      armor: json['armor']?.toDouble() ?? 0.0,
      armorperlevel: json['armorperlevel']?.toDouble() ?? 0.0,
      spellblock: json['spellblock']?.toDouble() ?? 0.0,
      spellblockperlevel: json['spellblockperlevel']?.toDouble() ?? 0.0,
      attackrange: json['attackrange']?.toDouble() ?? 0.0,
      hpregen: json['hpregen']?.toDouble() ?? 0.0,
      hpregenperlevel: json['hpregenperlevel']?.toDouble() ?? 0.0,
      mpregen: json['mpregen']?.toDouble() ?? 0.0,
      mpregenperlevel: json['mpregenperlevel']?.toDouble() ?? 0.0,
      crit: json['crit']?.toDouble() ?? 0.0,
      critperlevel: json['critperlevel']?.toDouble() ?? 0.0,
      attackdamage: json['attackdamage']?.toDouble() ?? 0.0,
      attackdamageperlevel: json['attackdamageperlevel']?.toDouble() ?? 0.0,
      attackspeedperlevel: json['attackspeedperlevel']?.toDouble() ?? 0.0,
      attackspeed: json['attackspeed']?.toDouble() ?? 0.0,
    );
  }
}