import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListViewEffect extends StatefulWidget {
  @override
  _MyListViewEffectState createState() => _MyListViewEffectState();
}

class _MyListViewEffectState extends State<MyListViewEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )
      ..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: 4,
          itemBuilder: (context, index) {
            return FadeTransition(
              opacity: _animation,
              child: Container(
                margin: EdgeInsets.all(8),
                color: Colors.green,
              ),
            );
          },
        ),
          
          ElevatedButton(onPressed: ()=>{}, child: Text("Fade Transition"))
    ]);
  }
}