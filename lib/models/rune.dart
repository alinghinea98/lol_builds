class RunePath {
  final int id;
  final String key;
  final String icon;
  final String name;
  final List<RuneSlot> slots;

  RunePath({
    required this.id,
    required this.key,
    required this.icon,
    required this.name,
    required this.slots,
  });

  factory RunePath.fromJson(Map<String, dynamic> json) {
    return RunePath(
      id: json['id'],
      key: json['key'],
      icon: json['icon'],
      name: json['name'],
      slots: (json['slots'] as List)
          .map((slot) => RuneSlot.fromJson(slot))
          .toList(),
    );
  }
}

class RuneSlot {
  final List<Rune> runes;

  RuneSlot({required this.runes});

  factory RuneSlot.fromJson(Map<String, dynamic> json) {
    return RuneSlot(
      runes: (json['runes'] as List)
          .map((rune) => Rune.fromJson(rune))
          .toList(),
    );
  }
}

class Rune {
  final int id;
  final String key;
  final String icon;
  final String name;
  final String shortDesc;
  final String longDesc;

  Rune({
    required this.id,
    required this.key,
    required this.icon,
    required this.name,
    required this.shortDesc,
    required this.longDesc,
  });

  factory Rune.fromJson(Map<String, dynamic> json) {
    return Rune(
      id: json['id'],
      key: json['key'],
      icon: json['icon'],
      name: json['name'],
      shortDesc: json['shortDesc'],
      longDesc: json['longDesc'],
    );
  }
}