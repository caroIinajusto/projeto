class TopScorer {
  final String playerName;
  final String teamName;
  final int goals;

  TopScorer({required this.playerName, required this.teamName, required this.goals});

  factory TopScorer.fromJson(Map<String, dynamic> json) {
    return TopScorer(
      playerName: json['player_name'],
      teamName: json['team_name'],
      goals: json['goals'],
    );
  }
}