class Game {
  final String homeTeam;
  final String awayTeam;
  final DateTime date;
  final String score;

  Game({required this.homeTeam, required this.awayTeam, required this.date, this.score = ''});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      homeTeam: json['home_team'],
      awayTeam: json['away_team'],
      date: DateTime.parse(json['date']),
      score: json['score'] ?? '',
    );
  }
}