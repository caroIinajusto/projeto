import 'package:flutter/material.dart';
import 'package:ligabpiapp/models/clubes_model.dart';
import 'package:ligabpiapp/services/api_service.dart';
import 'detalhesclubes_screen.dart';

class ClubsScreen extends StatefulWidget {
  @override
  _ClubsScreenState createState() => _ClubsScreenState();
}

class _ClubsScreenState extends State<ClubsScreen> {
  late Future<List<Club>> futureClubs;

  @override
  void initState() {
    super.initState();
    futureClubs = ApiService().fetchClubs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clubes'),
      ),
      body: FutureBuilder<List<Club>>(
        future: futureClubs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Club club = snapshot.data![index];
                return ListTile(
                  leading: Image.network(club.logoUrl),
                  title: Text(club.name),
                  subtitle: Text(club.stadium),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClubDetailScreen(club: club),
                      ),
                    );
                  },
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