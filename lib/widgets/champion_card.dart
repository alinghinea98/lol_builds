import 'package:flutter/material.dart';
import 'package:lol_builds/models/champion.dart';
import 'package:lol_builds/widgets/runes_dialog.dart';


class ChampionCard extends StatelessWidget {
  final Champion champion;

  const ChampionCard({
    Key? key,
    required this.champion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showRunesDialog(context),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                'https://ddragon.leagueoflegends.com/cdn/15.1.1/img/champion/${champion.image.full}',
                fit: BoxFit.cover,
                width: 60,  // Reduced size for smaller cards
                height: 60,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4),  // Reduced padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    champion.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 12,  // Smaller font size
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    champion.title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 10,  // Smaller font size
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2),  // Reduced spacing
                  Wrap(
                    spacing: 2,  // Reduced spacing
                    runSpacing: 2,
                    children: champion.tags.map((tag) => Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),  // Reduced padding
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          fontSize: 8,  // Smaller font size
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    )).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRunesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => RunesDialog(champion: champion),
    );
  }
}