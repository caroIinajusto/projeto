import 'package:flutter/material.dart';
import 'package:ligabpiapp/models/marcadoras_model.dart';
import 'package:ligabpiapp/services/api_service.dart';

class TopScorersScreen extends StatefulWidget {
  @override
  _TopScorersScreenState createState() => _TopScorersScreenState();
}

class _TopScorersScreenState extends State<TopScorersScreen> {
  late Future<List<TopScorer>> futureTopScorers;

  @override
  void initState() {
    super.initState();
    futureTopScorers = ApiService().fetchTopScorers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Melhores Marcadoras'),
      ),
      body: FutureBuilder<List<TopScorer>>(
        future: futureTopScorers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                TopScorer topScorer = snapshot.data![index];
                return ListTile(
                  title: Text(topScorer.playerName),
                  subtitle: Text(topScorer.teamName),
                  trailing: Text('${topScorer.goals} goals'),
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