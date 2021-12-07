import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      // aligning to the center
      alignment: Alignment.center,

      // part 4 ----------------------------------
      // stack
      // it allows us to stack widgets on each other
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: const <Widget>[
          // in the output all the text are stacked on each other
          Text("Hello there"),
          Text("Hey Again!"),
          Text("1")
        ],
      ),
    );
  }
}

//       // part 3 --------------------------------------
//       // row
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: const <Widget>[
//           Text(
//             "Item 1",
//             textDirection: TextDirection.ltr,
//             style: TextStyle(fontSize: 12.9),
//           ),
//           Text("Item 2",
//               textDirection: TextDirection.ltr,
//               style: TextStyle(fontSize: 12.9)),
//           // expand will take the only space which is left
//           Expanded(child: Text("Item 3"))
//         ],
//       ),
//     );
//   }
// }

//       // part 2 -------------------------------------------------
//       // column
//       child: Column(
//         // to make it in the center of the screen
//         mainAxisAlignment: MainAxisAlignment.center,
//         // here because of the column which takes a lot of different children
//         // we will have all the different nodes whihc inside have other widgets
//         // children will contain the array of all the widgets
//         children: <Widget>[
//           const Text(
//             "First item",
//             textDirection: TextDirection.ltr,
//             style: TextStyle(color: Colors.white),
//           ),

//           const Text(
//             "Second item",
//             textDirection: TextDirection.ltr,
//             style: TextStyle(color: Colors.blue),
//           ),

//           // we can also put container here
//           // container can contain other layout widget
//           Container(
//             // shades of the colour
//             color: Colors.deepOrange.shade100,
//             // bottom left allignment
//             alignment: Alignment.bottomLeft,
//             child: const Text(
//               "Third item",
//               textDirection: TextDirection.ltr,
//               style: TextStyle(color: Colors.blue, fontSize: 10.1),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

//       // part 1 -----------------------------------------------------------------------
//       // ltr - left to right
//       // TextStyle chnaging the style of the text
//       child: const Text(
//         "Hello Container",
//         textDirection: TextDirection.ltr,
//         style: TextStyle(
//             color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18.3),
//       ),
//     );
//   }
// }
