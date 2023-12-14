import 'dart:ffi';

class PokeHub {
  List<Pokemon>? pokemon;

  PokeHub({this.pokemon});

  PokeHub.fromJson(Map<String, dynamic> json) {
    if (json["pokemon"] is List) {
      pokemon = json["pokemon"] == null
          ? null
          : (json["pokemon"] as List).map((e) => Pokemon.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (pokemon != null) {
      _data["pokemon"] = pokemon?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Pokemon {
  int? id;
  String? num;
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  String? candy;
  int? candyCount;
  String? egg;
  String? spawnChance;
  String? avgSpawns;
  String? spawnTime;
  List<double>? multipliers;
  List<String>? weaknesses;
  List<NextEvolution>? nextEvolution;

  Pokemon(
      {this.id,
      this.num,
      this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.candy,
      this.candyCount,
      this.egg,
      this.spawnChance,
      this.avgSpawns,
      this.spawnTime,
      this.multipliers,
      this.weaknesses,
      this.nextEvolution});

  Pokemon.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["num"] is String) {
      num = json["num"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["img"] is String) {
      img = json["img"];
    }
    if (json["type"] is List) {
      type = json["type"] == null ? null : List<String>.from(json["type"]);
    }
    if (json["height"] is String) {
      height = json["height"];
    }
    if (json["weight"] is String) {
      weight = json["weight"];
    }
    if (json["candy"] is String) {
      candy = json["candy"];
    }
    if (json["candy_count"] is int) {
      candyCount = json["candy_count"];
    }
    if (json["egg"] is String) {
      egg = json["egg"];
    }
    if (json["spawn_chance"] is double) {
      spawnChance = json["spawn_chance"].toString();
    }
    if (json["avg_spawns"] is Double) {
      avgSpawns = json["avg_spawns"].toString();
    }
    if (json["spawn_time"] is String) {
      spawnTime = json["spawn_time"];
    }
    if (json["multipliers"] is List) {
      multipliers = json["multipliers"] == null
          ? null
          : List<double>.from(json["multipliers"]);
    }
    if (json["weaknesses"] is List) {
      weaknesses = json["weaknesses"] == null
          ? null
          : List<String>.from(json["weaknesses"]);
    }
    if (json["next_evolution"] is List) {
      nextEvolution = json["next_evolution"] == null
          ? null
          : (json["next_evolution"] as List)
              .map((e) => NextEvolution.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["num"] = num;
    _data["name"] = name;
    _data["img"] = img;
    if (type != null) {
      _data["type"] = type;
    }
    _data["height"] = height;
    _data["weight"] = weight;
    _data["candy"] = candy;
    _data["candy_count"] = candyCount;
    _data["egg"] = egg;
    _data["spawn_chance"] = spawnChance;
    _data["avg_spawns"] = avgSpawns;
    _data["spawn_time"] = spawnTime;
    if (multipliers != null) {
      _data["multipliers"] = multipliers;
    }
    if (weaknesses != null) {
      _data["weaknesses"] = weaknesses;
    }
    if (nextEvolution != null) {
      _data["next_evolution"] = nextEvolution?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class NextEvolution {
  String? num;
  String? name;

  NextEvolution({this.num, this.name});

  NextEvolution.fromJson(Map<String, dynamic> json) {
    if (json["num"] is String) {
      num = json["num"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["num"] = num;
    _data["name"] = name;
    return _data;
  }
}
