import 'package:flutter/material.dart';
import 'package:lol_builds/models/champion.dart';
import 'package:lol_builds/services/champions_service.dart';
import 'package:lol_builds/widgets/champion_card.dart';

class ChampionsGrid extends StatefulWidget {
  @override
  _ChampionsGridState createState() => _ChampionsGridState();
}

class _ChampionsGridState extends State<ChampionsGrid> {
  final ChampionsService _championsService = ChampionsService();
  List<Champion> _champions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadChampions();
  }

  Future<void> _loadChampions() async {
    try {
      final champions = await _championsService.getChampions();
      setState(() {
        _champions = champions;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load champions')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('League of Legends Champions'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,  // Changed to 4 items per row
                childAspectRatio: 0.7,  // Adjusted for narrower cards
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _champions.length,
              itemBuilder: (context, index) {
                final champion = _champions[index];
                return ChampionCard(champion: champion);
              },
            ),
    );
  }
}