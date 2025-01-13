import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/rune.dart';

class RunesService {
  // 10.16.1 old version
  static const String baseUrl = 'https://ddragon.leagueoflegends.com/cdn/15.1.1/data/en_US';

  Future<List<RunePath>> getRunes() async {
    final response = await http.get(Uri.parse('$baseUrl/runesReforged.json'));
    
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((runeData) => RunePath.fromJson(runeData)).toList();
    } else {
      throw Exception('Failed to load runes');
    }
  }
}