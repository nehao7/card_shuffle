import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationPerGridItem extends StatefulWidget {
  const AnimationPerGridItem({super.key});

  @override
  State<AnimationPerGridItem> createState() => _AnimationPerGridItemState();
}

class _AnimationPerGridItemState extends State<AnimationPerGridItem> {
  List<bool> selected = List.generate(9, (_) => false);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: selected.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => setState(() => selected[index] = !selected[index]),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.all(8),
            color: selected[index] ? Colors.green : Colors.grey,
            child: Center(child: Text('Item $index')),
          ),
        );
      },
    );
  }
}

