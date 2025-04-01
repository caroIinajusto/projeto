import 'package:flutter/material.dart';
import 'package:ligabpiapp/models/noticias_model.dart';
import 'package:ligabpiapp/models/classificacao_model.dart';
import 'package:ligabpiapp/models/marcadoras_model.dart';
import 'package:ligabpiapp/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<News>> futureNews;
  late Future<List<Standings>> futureStandings;
  late Future<List<TopScorer>> futureTopScorers;

  @override
  void initState() {
    super.initState();
    futureNews = ApiService().fetchNews();
    futureStandings = ApiService().fetchStandings();
    futureTopScorers = ApiService().fetchTopScorers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liga BPI'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildNewsSection(),
            _buildStandingsSection(),
            _buildTopScorersSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsSection() {
    return FutureBuilder<List<News>>(
      future: futureNews,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: snapshot.data!.map((news) {
              return ListTile(
                title: Text(news.title),
                subtitle: Text(news.description),
                trailing: Text(news.date.toLocal().toString().split(' ')[0]),
              );
            }).toList(),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Widget _buildStandingsSection() {
    return FutureBuilder<List<Standings>>(
      future: futureStandings,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: snapshot.data!.take(5).map((standings) {
              return ListTile(
                title: Text(standings.teamName),
                trailing: Text('${standings.position} - ${standings.points} pts'),
              );
            }).toList(),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Widget _buildTopScorersSection() {
    return FutureBuilder<List<TopScorer>>(
      future: futureTopScorers,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: snapshot.data!.map((topScorer) {
              return ListTile(
                title: Text(topScorer.playerName),
                subtitle: Text(topScorer.teamName),
                trailing: Text('${topScorer.goals} goals'),
              );
            }).toList(),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}