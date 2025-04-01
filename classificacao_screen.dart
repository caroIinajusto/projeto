import 'package:flutter/material.dart';
import 'package:ligabpiapp/models/classificacao_model.dart';
import 'package:ligabpiapp/services/api_service.dart';

class StandingsScreen extends StatefulWidget {
  @override
  _StandingsScreenState createState() => _StandingsScreenState();
}

class _StandingsScreenState extends State<StandingsScreen> {
  late Future<List<Standings>> futureStandings;

  @override
  void initState() {
    super.initState();
    futureStandings = ApiService().fetchStandings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classificação'),
      ),
      body: FutureBuilder<List<Standings>>(
        future: futureStandings,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Standings standings = snapshot.data![index];
                return ListTile(
                  leading: Text('${standings.position}'),
                  title: Text(standings.teamName),
                  trailing: Text('${standings.points} pts'),
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