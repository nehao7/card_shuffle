import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SequentialSlideIn extends StatefulWidget {
  const SequentialSlideIn({super.key});

  @override
  State<SequentialSlideIn> createState() => _SequentialSlideInState();
}

class _SequentialSlideInState extends State<SequentialSlideIn> {
  List<int> items = List.generate(12, (index) => index);
  bool triggerAnimation = false;

  void _triggerSlideIn() {
    setState(() {
      triggerAnimation = false;
    });
    Future.delayed(Duration(milliseconds: 50), () {
      setState(() {
        triggerAnimation = true;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    _triggerSlideIn(); // Trigger on launch
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sequential Grid Animation")),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1),
              itemBuilder: (context, index) {
                return SequentialAnimatedItem(
                  key: ValueKey(items[index]),
                  index: index,
                  delay: index * 100,
                  trigger: triggerAnimation,
                  number: items[index],
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                items.shuffle();
                _triggerSlideIn();
              },
              child: Text("Shuffle & Animate"))
        ],
      ),
    );
  }
}

class SequentialAnimatedItem extends StatefulWidget {
  final int number;
  final int index;
  final int delay;
  final bool trigger;

  const SequentialAnimatedItem({
    required Key key,
    required this.number,
    required this.index,
    required this.delay,
    required this.trigger,
  }) : super(key: key);

  @override
  State<SequentialAnimatedItem> createState() => _SequentialAnimatedItemState();
}

class _SequentialAnimatedItemState extends State<SequentialAnimatedItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _offsetAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    if (widget.trigger) {
      _startAnimation();
    }
  }

  @override
  void didUpdateWidget(covariant SequentialAnimatedItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.trigger && !oldWidget.trigger) {
      _startAnimation();
    }
  }

  void _startAnimation() async {
    _controller.reset();
    await Future.delayed(Duration(milliseconds: widget.delay));
    if (mounted) _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.primaries[widget.number % Colors.primaries.length],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: Text(
              widget.number.toString(),
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
