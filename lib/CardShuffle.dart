
import 'dart:math';

import 'package:card_shuffle/MyListViewEffect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CardShuffle extends StatefulWidget {
  const CardShuffle({super.key});

  @override
  State<CardShuffle> createState() => _CardShuffleState();
}


class _CardShuffleState extends State<CardShuffle> {
  List<int> items = List.generate(9, (index) => index);  void _shuffleItems() {
    setState(() {
      items.shuffle(Random());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Grid Shuffle")),
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final itemSize = constraints.maxWidth / 3;

                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: GridView.count(
                    key: ValueKey(items.toString()), // Triggers animation
                    crossAxisCount: 3,
                    children: items
                        .map((e) => AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      width: itemSize,
                      height: itemSize,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        // color: Colors.primaries[e % Colors.primaries.length],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Item $e',
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
                        .toList(),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                items.shuffle(Random());
              });
            },
            child: Text("Shuffle"),
          ),
          ElevatedButton(
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>MyListViewEffect()));
            },
            child: Text("ListView Animation"),
          )
        ],
      ),
    );
  }
}

//
//
//       Scaffold(
//       appBar: AppBar(title: Text('Shuffling Grid')),
//       body: Column(
//         children: [
//           Expanded(
//             child: AnimationLimiter(
//               child: GridView.count(
//                 crossAxisCount: 3,
//                 padding: EdgeInsets.all(8),
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 children: List.generate(items.length, (index) {
//                   final item = items[index];
//                   return AnimationConfiguration.staggeredGrid(
//                     position: index,
//                     duration: const Duration(milliseconds: 500),
//                     columnCount: 3,
//                     child: ScaleAnimation(
//                       child: FadeInAnimation(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.blueAccent,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           alignment: Alignment.center,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text('Item $item',
//                                   style: TextStyle(
//                                       fontSize: 18, color: Colors.white)),
//                               Text('Pos ${index + 1}',
//                                   style: TextStyle(color: Colors.white70)),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: _shuffleItems,
//               child: Text('Shuffle Items'),
//               style: ElevatedButton.styleFrom(
//                   minimumSize: Size(double.infinity, 50)),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

//
//       Scaffold(
//       appBar: AppBar(title: Text('Shuffling Grid')),
//       body: Column(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ImplicitlyAnimatedReorderableList<int>(
//                 items: items,
//                 areItemsTheSame: (oldItem, newItem) => oldItem == newItem,
//                 itemBuilder: (context, itemAnimation, item, index) {
//                   return  Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: Material(
//                         color: Colors.blueAccent,
//                         elevation: 2,
//                         child: Container(
//                           height: 100,
//                           alignment: Alignment.center,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text('Item ${item + 1}',
//                                   style: TextStyle(color: Colors.white)),
//                               Text('Pos ${index + 1}',
//                                   style: TextStyle(color: Colors.white70)),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//
//                 },
//
//                 onReorderFinished: (int item, int from, int to, List<int> newItems) {  },
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: _shuffleItems,
//               child: Text('Shuffle with Animation'),
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(double.infinity, 50),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//




//     Scaffold(
//       appBar: AppBar(title: Text('Animated Grid Shuffle')),
//       body: Column(
//         children: [
//           Expanded(
//             child: AnimatedSwitcher(
//               duration: Duration(milliseconds: 500),
//               child: GridView.count(
//                 key: ValueKey(items),
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 padding: EdgeInsets.all(10),
//                 children: List.generate(items.length, (index) {
//                   final item = items[index];
//                   return AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     color: Colors.blueAccent,
//                     alignment: Alignment.center,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Item ${item}',
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                         Text(
//                           'Pos ${index}',
//                           style: TextStyle(color: Colors.white70),
//                         )
//                       ],
//                     ),
//                   );
//                 }),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: _shuffleItems,
//               child: Text('Shuffle Items'),
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(double.infinity, 50),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






//       Scaffold(
//       appBar: AppBar(title: Text("Shuffle Cards")),
//       body: Column(
//         children: [
//           Expanded(
//             child:
//             AnimatedSwitcher(duration: Duration(microseconds: 2000),
//            child:  Padding(
//               padding: EdgeInsets.all(20),
//               child: GridView.count(
//                 key: ValueKey(items),
//                 crossAxisCount: 5,
//                 // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 // crossAxisCount: 3, // Number of columns
//                 // crossAxisSpacing: 10,
//                 // mainAxisSpacing: 10,
//                 // )
//               //   children: items.map((items){
//               //     return Container(
//               //       margin: EdgeInsets.all(10),
//               //       child: Image(image: AssetImage("assets/images/img.png"),width: 20,height: 20,),
//               //     );
//               // }).toList(),
//                 children: List.generate(items.length, (index) {
//                   final item = items[index];
//                   return AnimatedContainer(
//                     duration: Duration(microseconds: 2000),
//                     // color: Colors.white,
//                     margin: EdgeInsets.all(10),
//                     child:
//                     Image(image: AssetImage('assets/images/img.png'),width: 20,height: 20,),
//                     // Image(image: AssetImage('assets/images/img.png'),width: MediaQuery.of(context).size.width * 0.4,),
//
//                     // child: Text(
//                     //   "Item $index",
//                     //   style: TextStyle(
//                     //     color: Colors.white,
//                     //     fontSize: 20,
//                     //     fontWeight: FontWeight.bold,
//                     //   ),
//                     // ),
//                   );
//                 }),
//               ),
//             )
//     ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: ElevatedButton(
//               style: ButtonStyle(
//                 // backgroundColor: WidgetStateProperty.resolveWith<Color?>((
//                 //     Set<WidgetState> states,
//                 //     ) {
//                 //   if (states.contains(WidgetState.pressed)) {
//                 //     return Theme.of(context).colorScheme.primary.withOpacity(0.5);
//                 //   }
//                 //   return null; // Use the component's default.
//                 // }),
//                 backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
//               ),
//               onPressed:_shuffleItems,
//               child: Text(
//                 "Shuffle Cards",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

