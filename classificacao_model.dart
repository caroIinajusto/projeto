class Standings {
  final String teamName;
  final int position;
  final int points;

  Standings({required this.teamName, required this.position, required this.points});

  factory Standings.fromJson(Map<String, dynamic> json) {
    return Standings(
      teamName: json['team_name'],
      position: json['position'],
      points: json['points'],
    );
  }
}