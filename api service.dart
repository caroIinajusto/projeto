import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ligabpiapp/models/classificacao_model.dart';
import 'package:ligabpiapp/models/jogos_model.dart';
import 'package:ligabpiapp/models/clubes_model.dart';
import 'package:ligabpiapp/models/noticias_model.dart';
import 'package:ligabpiapp/models/marcadoras_model.dart';

class ApiService {
  final String apiUrl = 'http://10.0.2.2:3000';

  Future<List<News>> fetchNews() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/news'));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((news) => News.fromJson(news)).toList();
      } else {
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load news: $e');
    }
  }

  Future<List<Standings>> fetchStandings() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/classificacao'));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((standings) => Standings.fromJson(standings)).toList();
      } else {
        throw Exception('Failed to load standings: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load standings: $e');
    }
  }

  Future<List<TopScorer>> fetchTopScorers() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/top_scorers'));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((topScorer) => TopScorer.fromJson(topScorer)).toList();
      } else {
        throw Exception('Failed to load top scorers: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load top scorers: $e');
    }
  }

  Future<List<Game>> fetchGames() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/jogos'));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((game) => Game.fromJson(game)).toList();
      } else {
        throw Exception('Failed to load games: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load games: $e');
    }
  }

  Future<List<Club>> fetchClubs() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/clubes'));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((club) => Club.fromJson(club)).toList();
      } else {
        throw Exception('Failed to load clubs: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load clubs: $e');
    }
  }
}