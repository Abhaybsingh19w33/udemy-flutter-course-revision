import 'package:flutter/material.dart';

class Guesture extends StatelessWidget {
  final String title;
  // String title = "title here";

  // const Guesture({Key? key, String? title}) : super(key: key);
  // adding constructor to our Gesture
  const Guesture({Key? key, this.title = "title here"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          // every time we tap on the custom button snack bar will then appear
          // which will have text hello gestures
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          CustomButton(),
          Text("Press button to see Snackbar on bottom"),
        ],
      )),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // adding gesturesDetector widget
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: const Text("Hello Gestures"),
          // changing the back ground color of the snackbar
          backgroundColor: Theme.of(context).backgroundColor,
          duration: const Duration(
              hours: 0,
              minutes: 0,
              seconds: 0,
              milliseconds: 1000,
              microseconds: 0),
        );

        // context is passed when we are going to buid any view or widget
        // whihc will give us access to everything else we need in order to work for us
        // snack bar is like a pop up message which displays our desired output
        // Scaffold.of(context).showSnackBar(snackBar);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },

      // Creating the actual button
      child: Container(
        // to add padding the container
        // this padding will occurs at all around the container
        // size of the button increases with the padding increase
        padding: const EdgeInsets.all(18.0),
        // decorating our box
        decoration: BoxDecoration(
            // Theme
            // every material design has a theme that governa the entire application
            // by usign ytheme here we are going to the top level
            // and passing the econtext so that we have access to our
            // build context which knows exactly what to do build anything
            // in the container any object or widget

            // ignore: deprecated_member_use
            color: Theme.of(context).buttonColor,

            // color: Theme.of(context).button,
            //borderRadius we want to have a circular border radius
            borderRadius: BorderRadius.circular(5.5)),
        // this text will be the title of our button
        child: const Text("First button!"),
      ),
    );
  }
}
