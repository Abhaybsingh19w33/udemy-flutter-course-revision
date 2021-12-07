import 'package:flutter/material.dart';
import './ui/welcome_home.dart';

void main() {
  runApp(
      // here material is very generic
      // here using materialApp we are more specific
      const MaterialApp(
    // Assigning name to the title
    title: "Welcome App",
    // here is what we want to show
    home: Welcome(),
  ));
}
//           // part 2----------------------------------

//           // to use a material design component
//           home: Container(
//               // setting the color of the entire view
//               // in the output the text is placed at the corner left of the screen
//               color: Colors.blue,
//               // now adding center will be helpfull in placement of the text
//               child: const Center(
//                   child: Text(
//                 "hello Material!",
//                 textDirection: TextDirection.ltr,
//                 // increasing the font of the text
//                 // changing the font sty;e to italic
//                 style: TextStyle(
//                   fontWeight: FontWeight.w800,
//                   fontStyle: FontStyle.italic,
//                 ),
//               )))));
// }
          // // part 1 ---------------------------

          // // here we pass a contaier called center, which is going to put everything
          // //in the middle of the screen          passing properties
          // home: Center(
          //     // child is the property of the container
          //     child: Text(
          //   "hello, there",
          //   // for every text we add we need to add text direction for it'
          //   textDirection: TextDirection.ltr,
          // ))));
// }
