import 'package:flutter/material.dart';

// part 3
// stateless widget os the sub class of the widget, it has the control of the entire
// app or widget
class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  // build builds a widget
  // when creating all ofthe states widget each widget
  // considers it own entity which has a place in the context of the application
  // context will come with all of the properties of what it means to be stateless widget

  @override
  Widget build(BuildContext context) {
    // returns the widget
    // here material placed our output to the corner left of the screen
    return const Material(
        color: Colors.blue,
        // by using center we place the text in the center
        child: Center(
          child: Text(
            "Welcome Home!",
            textDirection: TextDirection.ltr,
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                fontSize: 34.5),
          ),
        ));
  }
}
