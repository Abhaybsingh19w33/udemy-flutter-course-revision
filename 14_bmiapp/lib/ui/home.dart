import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BmiState();
  }
}

class BmiState extends State<Bmi> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String _resultReading = "";

  String _finalResult = "";

  void _calculateBMI() {
    //Resourse 1: https://www.bcbst.com/providers/MPMTools/BMICalculator.shtm
    //Resource 2:  http://www.epic4health.com/bmiformula.html

    //
    //    BMI	Weight Status
    //    Below 18.5	Underweight
    //    18.5 – 24.9	Normal
    //    25.0 – 29.9	Overweight
    //    30.0 and Above	Obese

    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height * 12;
      double weight = double.parse(_weightController.text);

      if ((_ageController.text.isNotEmpty || age > 0) &&
          ((_heightController.text.isNotEmpty || inches > 0) &&
              (_weightController.text.isNotEmpty || weight > 0))) {
        result = weight / (inches * inches) * 703; // our BMI

        //Do the reading
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Underweight";
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          _resultReading = "Great Shape!"; // Normal
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 25.0 &&
            result < 30) {
          _resultReading = "Overweight";
        } else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
          _resultReading = "Obese";
        }
      } else {
        result = 0.0;
      }
    });

    _finalResult = "Your BMI: ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(5.0),
          children: <Widget>[
            Image.asset(
              'images/bmilogo.png',
              height: 85.0,
              width: 75.0,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              height: 265.0,
              width: 290.0,
              color: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Age',
                          hintText: 'e.g: 34',
                          icon: Icon(Icons.person_outline)),
                    ),

                    TextField(
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'Height in feet',
                            hintText: 'e.g 6.5',
                            icon: Icon(Icons.insert_chart))),
                    TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'Weight in lbs',
                            hintText: 'e.g 180',
                            icon: Icon(Icons.line_weight))),

                    const Padding(padding: EdgeInsets.all(10.6)),

                    //calculate button
                    Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: _calculateBMI,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pinkAccent, // background
                          // onPrimary: Colors.white, // foreground
                          textStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        child: const Text('Calculate'),
                        // textColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "$_finalResult ",
                  style: const TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9),
                ),
                const Padding(padding: EdgeInsets.all(5.0)),
                Text(
                  "$_resultReading ",
                  style: const TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
