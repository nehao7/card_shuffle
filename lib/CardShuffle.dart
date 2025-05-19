
import 'dart:math';

import 'package:card_shuffle/AnimationPerGridItem.dart';
import 'package:card_shuffle/CardShuffleApp.dart';
import 'package:card_shuffle/CustomLayoutAnimation.dart';
import 'package:card_shuffle/EntryAnimationGrid.dart';
import 'package:card_shuffle/MultipleGridAnimation.dart';
import 'package:card_shuffle/MyListViewEffect.dart';
import 'package:card_shuffle/PositionSwitchingAnimation.dart';
import 'package:card_shuffle/ReOrderAnimations.dart';
import 'package:card_shuffle/SequentialSlideIn.dart';
import 'package:card_shuffle/ShuffleAnimationSwitcher.dart';
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
      body:Center(
     child:  Column(
        children: [
          // ElevatedButton(
          //   onPressed: () {
          //    Navigator.push(context,
          //        MaterialPageRoute(builder: (context)=>EntryAnimationGrid()));
          //   },
          //   child: Text("Entry Animation"),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //    Navigator.push(context,
          //        MaterialPageRoute(builder: (context)=>ShuffleAnimationSwitcher()));
          //   },
          //   child: Text("Shuffle Animation"),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //    Navigator.push(context,
          //        MaterialPageRoute(builder: (context)=>ReOrderAnimations()));
          //   },
          //   child: Text("Reorder Animation"),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //    Navigator.push(context,
          //        MaterialPageRoute(builder: (context)=>AnimationPerGridItem()));
          //   },
          //   child: Text("Per Item Grid Animation"),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //    Navigator.push(context,
          //        MaterialPageRoute(builder: (context)=>CustomLayoutAnimation()));
          //   },
          //   child: Text("Custom Layout Animation"),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //    Navigator.push(context,
          //        MaterialPageRoute(builder: (context)=>MultipleGridAnimation()));
          //   },
          //   child: Text("Multiple Grid Animation"),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //    Navigator.push(context,
          //        MaterialPageRoute(builder: (context)=>SequentialSlideIn()));
          //   },
          //   child: Text("Sequential Animation"),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //    Navigator.push(context,
          //        MaterialPageRoute(builder: (context)=>PositionSwitchingAnimation()));
          //   },
          //   child: Text("Position Animation"),
          // ),
          ElevatedButton(
            onPressed: () {
             Navigator.push(context,
                 MaterialPageRoute(builder: (context)=>CardShuffleApp()));
            },
            child: Text("Card Shuffle Game"),
          )
        ],
      ),
      )
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

