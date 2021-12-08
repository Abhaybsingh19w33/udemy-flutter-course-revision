// this help in decode the future to json
import 'dart:convert';

import 'package:flutter/material.dart';
// we must add dependecies to our file
// go to pubspec > dependencies
// add the dependencies there
import 'package:http/http.dart' as http;

//https://jsonplaceholder.typicode.com/posts
void main() async {
  // [{adlfasdfj;alfdal;fdjaldfja
  // to use await we must add the async to our main and other functions
  //
  // Sting _data = await getJSON();
  // this will store data in form of list
  List _data = await getJSON();
  // getting the specific data we want
  // just like list in python
  print(_data[1]["title"]);
  for (var i = 0; i < _data.length; i++) {
    print("Title: ${_data[i]["title"]}");
  }

  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
          title: const Text("JSON Parsing"),
          backgroundColor: Colors.amber,
        ),
        body: Card(
          // list view is bare bone scrollable widget
          // list view builder allows us to build a list view
          child: ListView.builder(
              // the list view builder is driven by item data
              // it must be known to the list builder to construct the listview
              itemCount: _data.length,
              padding: const EdgeInsets.all(4.4),
              // index is passed to the itembuilder
              // every list array has the data with the index
              itemBuilder: (BuildContext context, int position) {
                return Column(
                  children: <Widget>[
                    // divider will allows us to divide each item
                    // it will help us see the divider
                    const Divider(
                      height: 3.4,
                    ),
                    Card(
                      child: ListTile(
                          title: Text(
                            _data[position]["title"],
                            style: const TextStyle(
                                fontSize: 17.2, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(_data[position]["body"]),
                          //Paulo [P,a,u,l,o]
                          // circular Avatar
                          // this will add a cricle infront of the text
                          // with text in it
                          // just like a icon whihc consists of some text
                          leading: CircleAvatar(
                            // we can make it bigger while increasing the radius
                            //radius: 45.6,
                            backgroundColor: Colors.orange,
                            child: Text(_data[position]["title"][0]),
                          ),
                          // on tap this will show the title or any desired data from json
                          onTap: () => showTapMessage(
                              context,
                              _data[position]["title"],
                              _data[position]["body"])),
                    )
                  ],
                );
              }),
        )),
  ));
}

void showTapMessage(BuildContext context, String message, String body) {
  var alertDialog = AlertDialog(
    title: Text(message),
    content: Text(body),
    // its a widget list
    // it works like when we click something will pop out
    actions: <Widget>[
      // adding flat button
      Card(
        // child: TextButton(
        //     // naviagtor allow us to navigate arount the  windows
        //     // it will get the view from the top and remove it
        //     // just like a alert message with a ok button which will close the alrt when the button is closed
        //     onPressed: () => Navigator.of(context).pop(),
        //     child: const Text("OK"))
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFFFFC107),
                        Color(0xFFFFCA28),
                        Color(0xFFFFE082),
                        Colors.amber,
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      )
    ],
  );
  showDialog(
      context: context,
      builder: (context) {
        return alertDialog;
      });
}

// part 1 -------------------------------------------------
// now specifing the function to return the list
Future<List> getJSON() async {
  // String apiUrl = "https://jsonplaceholder.typicode.com/posts";
  Uri apiUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  // invoking the response class
  // and creating the respoonse class
  // .get() we should pass type url in it
  http.Response response = await http.get(apiUrl);

  // everything we get with response class we will return all that
  // this will return the future list
  // return response.body;
  // to return the list
  // now we will addingg json decode
  // print(Type(response.body));
  print("type of response.body ");
  print(response.body.runtimeType);
  return json.decode(response.body);
}
