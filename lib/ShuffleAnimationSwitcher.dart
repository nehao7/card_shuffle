import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShuffleAnimationSwitcher extends StatefulWidget {
  const ShuffleAnimationSwitcher({super.key});

  @override
  State<ShuffleAnimationSwitcher> createState() => _ShuffleAnimationSwitcherState();
}
// Shuffle Animation with AnimatedSwitcher

class _ShuffleAnimationSwitcherState extends State<ShuffleAnimationSwitcher> {
  List<int> items = List.generate(9, (index) => index);
  void shuffle() {
    setState(() => items.shuffle());
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: items.map((i) {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 2000),
                child: Container(
                  key: ValueKey(i),
                  margin: EdgeInsets.all(8),
                  color: Colors.blue[100 * ((i % 8) + 1)],
                  child: Center(child: Text('$i')),
                ),
              );
            }).toList(),
          ),
        ),
        ElevatedButton(onPressed: shuffle, child: Text('Shuffle')),
      ],
    );
  }
}
