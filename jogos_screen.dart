import 'package:flutter/material.dart';
import 'package:ligabpiapp/models/jogos_model.dart';
import 'package:ligabpiapp/services/api_service.dart';

class GamesScreen extends StatefulWidget {
  @override
  _GamesScreenState createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  late Future<List<Game>> futureGames;

  @override
  void initState() {
    super.initState();
    futureGames = ApiService().fetchGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogos'),
      ),
      body: FutureBuilder<List<Game>>(
        future: futureGames,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Game game = snapshot.data![index];
                return ListTile(
                  title: Text('${game.homeTeam} vs ${game.awayTeam}'),
                  subtitle: Text(game.date.toLocal().toString().split(' ')[0]),
                  trailing: Text(game.score.isEmpty ? 'No Score' : game.score),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}