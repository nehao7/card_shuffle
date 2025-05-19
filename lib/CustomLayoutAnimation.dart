import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLayoutAnimation extends StatefulWidget {
  const CustomLayoutAnimation({super.key});

  @override
  State<CustomLayoutAnimation> createState() => _CustomLayoutAnimationState();
}
//  Custom Layout Animation (Positioned)
// 6. Scroll-triggered Animation (Basic Scroll Listener)


class _CustomLayoutAnimationState extends State<CustomLayoutAnimation> {
  ScrollController controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() => setState(() => offset = controller.offset));
  }


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text('Scroll Offset: ${offset.toStringAsFixed(1)}'),
        Expanded(
          child: GridView.builder(
            controller: controller,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: 20,
            itemBuilder: (_, i) => Card(child: Center(child: Text('Item $i'))),
          ),
        ),
      ],
    );
  }
}

