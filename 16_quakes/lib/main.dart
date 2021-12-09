import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

// ignore: prefer_typing_uninitialized_variables
// Map<dynamic,dynamic> _data;
//  = <dynamic,dynamic>{};
// List<Map> _features ; // features object list
// ignore: prefer_typing_uninitialized_variables
var _data;
// ignore: prefer_typing_uninitialized_variables
var _features;
void main() async {
  _data = await getQuakes();

  _features = _data['features'];

  //print(_data['features'][0]['properties']);

  runApp(const MaterialApp(
    title: 'Quakes',
    home: Quakes(),
  ));
}

class Quakes extends StatelessWidget {
  const Quakes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quakes'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        // creating list builder
        child: Card(
          child: ListView.builder(
              // here we if we use _data length whihc is a map we are unable to get the correct data
              // itemCount: _data.length,
              // placing the count of the item
              itemCount: _features.length,
              padding: const EdgeInsets.all(15.0),
              //Date format: https://pub.dartlang.org/packages/intl#-readme-tab-
              //DateFormat: https://www.dartdocs.org/documentation/intl/0.15.1/intl/DateFormat-class.html
              //https://stackoverflow.com/questions/45357520/dart-converting-milliseconds-since-epoch-unix-timestamp-into-human-readable

              itemBuilder: (BuildContext context, int position) {
                //crating the rows for our listview
                if (position.isOdd) return const Divider();
                final index = position ~/ 2; // we are dividing position by 2 and returning an integer result
                // we must add the intl package to use dateFormat
                // we must add this dependencies to pubspec file
                var format = DateFormat.yMMMMd("en_US").add_jm();
                //var dateString = format.format(date);
                // here time returned in map is in unix
                // after formating we multiply by 1000 to change it into seconds
                // so we have to convert it into human readable time
                var date = format.format(DateTime.fromMicrosecondsSinceEpoch(
                    _features[index]['properties']['time'] * 1000,
                    isUtc: true));

                // listTile  creating the row for our listview
                return Card(
                  child: ListTile(
                    title: Text(
                      " $date",
                      //title:  Text("Date: $date",
                      style: const TextStyle(
                          fontSize: 15.5,
                          color: Colors.orange,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      // we can directly use map for the data parsing here
                      // "$_data['features'][position]['properties']['place']"
                      // therfore we created this feature list
                      "${_features[index]['properties']['place']}",
                      style: const TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                        // display magnitude of earth quake
                        "${_features[index]['properties']['mag'].toStringAsFixed(3)}",
                        style: const TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                    onTap: () {
                      _showAlertMessage(context,
                          "${_features[index]['properties']['title']}");
                    },
                  ),
                );
              }),
        ),
      ),
    );
  }

  void _showAlertMessage(BuildContext context, String message) {
    var alert = AlertDialog(
      title: const Text('Quakes'),
      content: Text(message),
      actions: <Widget>[
        Card(
          child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK')),
        )
      ],
    );
    showDialog(
        context: context,
        // child: alert,
        builder: (context) {
          return alert;
        });
  }
}

// here in the api
// api returns map not list
// so we have to change the future with map not list
Future<Map> getQuakes() async {
  Uri apiUrl = Uri.parse(
      'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson');

  http.Response response = await http.get(apiUrl);

  return json.decode(response.body);
}
