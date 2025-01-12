import 'package:flutter/material.dart';
import 'package:lol_builds/models/champion.dart';

class ChampionCard extends StatelessWidget {
  final Champion champion;

  const ChampionCard({
    Key? key,
    required this.champion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Image.network(
              'https://ddragon.leagueoflegends.com/cdn/15.1.1/img/champion/${champion.image.full}',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    champion.name,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    champion.title,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Wrap(
                    spacing: 4,
                    children: champion.tags.map((tag) => Chip(
                      label: Text(
                        tag,
                        style: TextStyle(fontSize: 10),
                      ),
                      padding: EdgeInsets.zero,
                    )).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}