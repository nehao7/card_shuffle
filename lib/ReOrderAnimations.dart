import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

class ReOrderAnimations extends StatefulWidget {
  const ReOrderAnimations({super.key});

  @override
  State<ReOrderAnimations> createState() => _ReOrderAnimationsState();
}

class _ReOrderAnimationsState extends State<ReOrderAnimations> {
  List<Widget> tiles = List.generate(6, (i) => buildTile(i));

  static Widget buildTile(int i) => Container(
    key: ValueKey(i),
    color: Colors.amber,
    padding: EdgeInsets.all(20),
    child: Center(child: Text('Tile $i')),
  );
  @override
  Widget build(BuildContext context) {
    return  ReorderableWrap(
      spacing: 8,
      runSpacing: 8,
      children: tiles,
      onReorder: (oldIndex, newIndex) {
        setState(() {
          final item = tiles.removeAt(oldIndex);
          tiles.insert(newIndex, item);
        });
      },
    );
  }
}

