import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = TextEditingController();

  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC = false;
  int? radioValue = 0;
  bool switchValue = false;
  double _finalResult = 0.0;
  String _planetName = "";

  void handleRadioValueChanged(int? value) {
    /*
    Source: https://www.livescience.com/33356-weight-on-planets-mars-moon.html
      Mercury: 0.38
      Venus: 0.91
      Earth: 1.00
      Mars: 0.38
      Jupiter: 2.34
      Saturn: 1.06
      Uranus: 0.92
      Neptune: 1.19
      Pluto: 0.06
     */
    // it will refresh each time the state change
    setState(() {
      radioValue = value!;
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          // to string as fixed will fixed the number of digits after the decimal point
          _planetName =
              "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _planetName =
              "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";

          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _planetName =
              "Your Venus on Pluto is ${_finalResult.toStringAsFixed(1)}";

          break;
        default:
          print("Nothing selected!");
      }

      //  print("Value is ${radioValue.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // adding appbar
      appBar: AppBar(
        // adding title
        title: const Text("Weight On Planet X"),
        // centralizing title
        centerTitle: true,
        // adding back ground color
        backgroundColor: Colors.black38,
      ),
      // adding background color of body
      backgroundColor: Colors.blueGrey,
      // this container will contain all widgets
      body: Container(
        // alling to top center
        alignment: Alignment.topCenter,
        // adding list view
        child: ListView(
          // adding padding
          padding: const EdgeInsets.all(1.5),
          // adding children to add the further widgets
          children: <Widget>[
            // addding images
            Image.asset(
              // image path, width, height
              'images/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            // another container to add textfield
            Container(
              // adding margin to the textfield
              margin: const EdgeInsets.all(3.0),
              // aling to center
              alignment: Alignment.center,
              // adding column view
              child: Column(
                // adding children to add the further widgets
                children: <Widget>[
                  // adding textfileds to enter data in textfields
                  TextField(
                    //
                    controller: _weightController,
                    // textfield should show only number
                    keyboardType: TextInputType.number,
                    // decorating the textfield
                    decoration: const InputDecoration(
                        // adding label
                        // adding text hint
                        labelText: 'Your Weight on Earth',
                        hintText: 'In pounds',
                        // adding icon of a person
                        icon: Icon(Icons.person_outline)),
                  ),

                  // this is created for radio buttons
                  const Padding(padding: EdgeInsets.all(5.0)),
                  //three toggle buttons
                  Row(
                    // alignment for center
                    mainAxisAlignment: MainAxisAlignment.center,
                    // adding children to add further widgtes
                    children: <Widget>[
                      //radiobuttons go here
                      Radio<int?>(
                          // when button is selected it will change the color in this active color
                          activeColor: Colors.brown,
                          // giving value to identify the radio
                          value: 0,
                          // grouping them into each other
                          groupValue: radioValue,
                          // if value is cahnging the fucntion is called
                          onChanged: handleRadioValueChanged),
                      const Text(
                        // adding text to radio it will shown just below the button
                        "Pluto",
                        // addding color to text
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<int?>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      const Text(
                        "Mars",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<int?>(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      const Text(
                        "Venus",
                        style: TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),

                  //Result text
                  const Padding(padding: EdgeInsets.all(15.0)),

                  Text(
                    _weightController.text.isEmpty
                        ? "Please enter weight"
                        : _planetName + " lbs",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19.4,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// function to calculate the weight
  double calculateWeight(String weight, double multiplier) {
    // now the data is coming in string , we need to check if the data id empty
    // then convert to string then to int
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      print("Wrong!");
      return int.parse("180") * 0.38; // give a default weight! Be creative!
    }
  }
}
