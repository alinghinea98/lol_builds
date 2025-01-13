import 'package:flutter/material.dart';
import '../models/champion.dart';
import '../models/rune.dart';
import '../services/runes_service.dart';

class RunesDialog extends StatefulWidget {
  final Champion champion;

  const RunesDialog({
    Key? key,
    required this.champion,
  }) : super(key: key);

  @override
  _RunesDialogState createState() => _RunesDialogState();
}

class _RunesDialogState extends State<RunesDialog> {
  final RunesService _runesService = RunesService();
  List<RunePath> _runes = [];
  bool _isLoading = true;

  // Add this method to format the rune image URL
  String _formatRuneImageUrl(String iconPath) {
    return 'https://ddragon.leagueoflegends.com/cdn/img/$iconPath';
  }

  @override
  void initState() {
    super.initState();
    _loadRunes();
  }

  Future<void> _loadRunes() async {
    try {
      final runes = await _runesService.getRunes();
      setState(() {
        _runes = runes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load runes')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        constraints: BoxConstraints(maxWidth: 400, maxHeight: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.network(
                  'https://ddragon.leagueoflegends.com/cdn/15.1.1/img/champion/${widget.champion.image.full}',
                  width: 50,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) => 
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey[300],
                      child: Icon(Icons.error),
                    ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.champion.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'Recommended Runes',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: _runes.length,
                      itemBuilder: (context, index) {
                        final runePath = _runes[index];
                        return ExpansionTile(
                          leading: Image.network(
                            _formatRuneImageUrl(runePath.icon),
                            width: 32,
                            height: 32,
                            errorBuilder: (context, error, stackTrace) => 
                              Container(
                                width: 32,
                                height: 32,
                                color: Colors.grey[300],
                                child: Icon(Icons.error, size: 16),
                              ),
                          ),
                          title: Text(runePath.name),
                          children: runePath.slots
                              .expand((slot) => slot.runes)
                              .map((rune) => ListTile(
                                    leading: Image.network(
                                      _formatRuneImageUrl(rune.icon),
                                      width: 32,
                                      height: 32,
                                      errorBuilder: (context, error, stackTrace) => 
                                        Container(
                                          width: 32,
                                          height: 32,
                                          color: Colors.grey[300],
                                          child: Icon(Icons.error, size: 16),
                                        ),
                                    ),
                                    title: Text(rune.name),
                                    subtitle: Text(
                                      rune.shortDesc.replaceAll(RegExp(r'<[^>]*>'), ''),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}