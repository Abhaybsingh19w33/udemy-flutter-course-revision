import 'package:flutter/material.dart';

// this tie we have to exteds the stateful widgets
class MakeItRain extends StatefulWidget {
  const MakeItRain({Key? key}) : super(key: key);

  // over riding the create state
  @override
  State<StatefulWidget> createState() {
    // returninng the make it rain state
    return MakeItRainState();
  }
}

// because createstate returns state type
// so we have to make a state type
// we are passing make it rain type
class MakeItRainState extends State<MakeItRain> {
  int _moneyCounter = 0;
  // List<MaterialAccentColor> _colors = [Colors.redAccent, Colors.blueAccent];

  // here directly calling rainmoney will not work
  //  we hava to add setstate function to re draw the screen or state
  void _rainMoney() {
    //Important - setState is called each time we need to update the UI
    setState(() {
      _moneyCounter = _moneyCounter + 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // adding app bar with text and colour
      appBar: AppBar(
        title: const Text("Make It Rain!"),
        backgroundColor: Colors.amber,
      ),
      // creating container to store the widgets
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // storing the widgets in list
          children: <Widget>[
            //title
            // alligning them to center of the screen
            const Center(
              child: Text(
                "Get Rich!",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 29.9),
              ),
            ),

            // Expanded will enlarge the size of the child text
            // like increasing the padding of the text
            Expanded(
                child: Center(
              // printing money to the output
              child: Text(
                // in order to add symbol we need to use \ with single quote
                '\$$_moneyCounter',
                style: const TextStyle(
                    color: Colors
                        .greenAccent, // _moneyCounter > 2000 ? Colors.blueAccent : Colors.red,//Challenge solution
                    fontSize: 46.9,
                    fontWeight: FontWeight.w800),
              ),
            )),

            Expanded(
                child: Center(
              child: Card(
                color: Colors.lightGreen,
                child: TextButton(
                    onPressed: _rainMoney,
                    child: const Text(
                      "Let It Rain!",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 19.9,
                      ),
                    )),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
