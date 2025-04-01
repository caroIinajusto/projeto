class Club {
  final String name;
  final String logoUrl;
  final String stadium;
  final List<Player> players;
  final Coach coach;

  Club({required this.name, required this.logoUrl, required this.stadium, required this.players, required this.coach});

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      name: json['name'],
      logoUrl: json['logo_url'],
      stadium: json['stadium'],
      players: (json['players'] as List).map((player) => Player.fromJson(player)).toList(),
      coach: Coach.fromJson(json['coach']),
    );
  }
}

class Player {
  final String name;
  final String position;
  final int number;

  Player({required this.name, required this.position, required this.number});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['name'],
      position: json['position'],
      number: json['number'],
    );
  }
}

class Coach {
  final String name;
  final String nationality;

  Coach({required this.name, required this.nationality});

  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(
      name: json['name'],
      nationality: json['nationality'],
    );
  }
}