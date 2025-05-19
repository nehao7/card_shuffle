import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardShuffleApp extends StatefulWidget {
  const CardShuffleApp({super.key});

  @override
  State<CardShuffleApp> createState() => _CardShuffleAppState();
}

class _CardShuffleAppState extends State<CardShuffleApp> with TickerProviderStateMixin {
  static const int columns = 3;
  final double spacing = 10.0;
  List<int> items = List.generate(9, (i) => i);
  bool distributed = false;

  late double itemSize;
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    _controllers = List.generate(
      items.length,
          (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400),
      ),
    );

    _animations = _controllers.map((c) => Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: c, curve: Curves.easeOut),
    )).toList();
  }

  void _distributeItems() async {
    for (int i = 0; i < _controllers.length; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      _controllers[i].forward();
    }
    setState(() {
      distributed = true;
    });
  }

  void _shuffleItems() {
    setState(() {
      items.shuffle();
    });
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    itemSize = (screenWidth - (spacing * (columns + 1))) / columns;

    return Scaffold(
      appBar: AppBar(title: Text("Animated Grid Shuffle")),
      body: Column(
        children: [
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              if (!distributed) {
                _distributeItems();
              } else {
                _shuffleItems();
              }
            },
            child: Text(distributed ? "Shuffle Items" : "Distribute Items"),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Stack(
              children: items.map((item) {
                int index = items.indexOf(item);
                final row = index ~/ columns;
                final col = index % columns;

                return AnimatedPositioned(
                  key: ValueKey(item),
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  left: col * (itemSize + spacing) + spacing,
                  top: row * (itemSize + spacing) + spacing,
                  child: FadeTransition(
                    opacity: _animations[item],
                    child: Container(
                      width: itemSize,
                      height: itemSize,
                      alignment: Alignment.center,
                      child: Transform.scale(
                        scale: _animations[item].value.clamp(1.0, 1.0),
                        child:
                // Container(
                //           width: 80,
                //           height: 80,
                //           decoration: BoxDecoration(
                //             border: Border.all(color: Colors.blue),
                //             borderRadius: BorderRadius.circular(12),
                //             gradient: LinearGradient(
                //               colors: [Colors.white, Colors.white54],
                //               begin: Alignment.topLeft,
                //               end: Alignment.bottomRight,
                //             ),
                //           ),
                //           child:
                        Image.asset(
                            "assets/images/img.png",
                            width: 80,
                            height: 80,
                          ),
                        // ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(title: Text("Animated Grid Shuffle")),
    //   body: Column(
    //     children: [
    //       SizedBox(height: 12),
    //       ElevatedButton(
    //         onPressed: () {
    //           if (!distributed) {
    //             _distributeItems();
    //           } else {
    //             _shuffleItems();
    //           }
    //         },
    //         child: Text(distributed ? "Shuffle Items" : "Distribute Items"),
    //       ),
    //       SizedBox(height: 20),
    //       Expanded(
    //         child: Stack(
    //           children: items.map((item) {
    //             int index = items.indexOf(item);
    //             final row = index ~/ columns;
    //             final col = index % columns;
    //
    //             return AnimatedPositioned(
    //               key: ValueKey(item),
    //               duration: Duration(milliseconds: 500),
    //               curve: Curves.easeInOut,
    //               left: col * (itemSize + spacing) + spacing,
    //               top: row * (itemSize + spacing) + spacing,
    //               child: FadeTransition(
    //                 opacity: _animations[item],
    //                 child: Transform.scale(
    //                   scale: _animations[item].value,
    //                   child: Container(
    //                     width: itemSize,
    //                     height: itemSize,
    //                     // decoration: BoxDecoration(
    //                     //   color: Colors.primaries[item % Colors.primaries.length],
    //                     //   borderRadius: BorderRadius.circular(16),
    //                     // ),
    //                     child: Center(
    //                       child:Image(image: AssetImage("assets/images/img.png"),width: 50,height: 50,),
    //
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             );
    //           }).toList(),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
