import 'package:flutter/material.dart';
import 'package:ligabpiapp/models/clubes_model.dart';

class ClubDetailScreen extends StatelessWidget {
  final Club club;

  ClubDetailScreen({required this.club});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(club.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(club.logoUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Estádio: ${club.stadium}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Treinador: ${club.coach.name} (${club.coach.nationality})',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Jogadoras',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: club.players.map((player) {
                return ListTile(
                  title: Text(player.name),
                  subtitle: Text(player.position),
                  trailing: Text('#${player.number}'),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}