import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PositionSwitchingAnimation extends StatefulWidget {
  const PositionSwitchingAnimation({super.key});

  @override
  State<PositionSwitchingAnimation> createState() => _PositionSwitchingAnimationState();
}

class _PositionSwitchingAnimationState extends State<PositionSwitchingAnimation> {
  static const int columns = 3;
  final double spacing = 10.0;
  List<int> items = List.generate(9, (i) => i);

  // Size constants
  late double itemSize;
  @override
  Widget build(BuildContext context) {
    // Calculate item size dynamically
    final screenWidth = MediaQuery.of(context).size.width;
    itemSize = (screenWidth - (spacing * (columns + 1))) / columns;

    return Scaffold(
      appBar: AppBar(title: Text("Position Shuffle Animation")),
      body:
      Stack(
        children: items.map((item) {
          int index = items.indexOf(item);
          final row = index ~/ columns;
          final col = index % columns;

          return AnimatedPositioned(
            key: ValueKey(item),
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            left: col * (itemSize + spacing) + spacing,
            top: row * (itemSize + spacing) + spacing + 20,
            child: Container(
              width: itemSize,
              height: itemSize,
              // decoration: BoxDecoration(
              //   color: Colors.primaries[item % Colors.primaries.length],
              //   borderRadius: BorderRadius.circular(16),
              // ),
              child: Center(
                child:Image(image: AssetImage("assets/images/img.png"),width: 50,height: 50,),
                // Text(
                //   item.toString(),
                //   style: TextStyle(fontSize: 24, color: Colors.white),
                // ),
              ),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            items.shuffle();
          });
        },
        child: Icon(Icons.shuffle),
      ),
    );
  }
}

