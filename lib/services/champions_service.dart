// this service is responsible for fetching the champions data from the Riot API
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lol_builds/models/champion.dart';

class ChampionsService {
  static const String baseUrl = 'https://ddragon.leagueoflegends.com/cdn/15.1.1/data/en_US';

  Future<List<Champion>> getChampions() async {
    final response = await http.get(Uri.parse('$baseUrl/champion.json'));
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, dynamic> championsData = data['data'];
      
      return championsData.values
          .map((championData) => Champion.fromJson(championData))
          .toList();
    } else {
      throw Exception('Failed to load champions');
    }
  }
}