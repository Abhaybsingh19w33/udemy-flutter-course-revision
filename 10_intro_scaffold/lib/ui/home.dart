import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // part 1---------------------------------------------------
  void _onPress() {
    print("Search Tapped!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // change the nackground colour of the top bar
        backgroundColor: Colors.amberAccent.shade700,
        title: const Text("Scaffold App"),
        // actions are typed widgets which are inside of the list
        // a list of widgets we can add
        actions: <Widget>[
          IconButton(
              // adding icon to our button
              icon: const Icon(Icons.send),
              // onpressed means what to be happen when we press the button
              // we are going to passs the anonymous function
              onPressed: () => debugPrint("Icon Tapped!")),
          IconButton(
              // adding icon to our button
              icon: const Icon(Icons.search),
              // when we call the function, we do not need to add method operatot()
              // we can directly call them by their name
              onPressed: _onPress)
        ],
      ),

      // Other properties
      // part 2 ---------------------------------------------------
      backgroundColor: Colors.grey.shade300,
      // body of the entire  scafold
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Abhay Singh",
              style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.deepOrange),
            ),
            // inkwell is a widget which allows to attach a ontap property
            InkWell(
              // we may not need to add textdirection
              child: const Text("Button!"),
              onTap: () => debugPrint("Button Tapped!"),
            ),
          ],
        ),
      ),

      // // part 4 ------------------------------------------------
      // // adding the floating button
      // floatingActionButton: FloatingActionButton(
      //   //  on pressed will call the assigned function when we press the floating button
      //   onPressed: () => debugPrint("Pressed!"),
      //   backgroundColor: Colors.lightGreen,
      //   // tool tip
      //   tooltip: 'Going Up!',
      //   child: Icon(Icons.call_missed),
      // ),

      // part 3 ----------------------------------------
      // adding bottom navigator
      bottomNavigationBar: BottomNavigationBar(
        // passing list of bottom navigation bar items
        items: const [
          // adding icon, title now changed to label
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Hey"),
          BottomNavigationBarItem(icon: Icon(Icons.print), label: "Nope"),
          BottomNavigationBarItem(icon: Icon(Icons.call_missed), label: "Hello")
        ],
        // here printing the index of the button which we had tapped
        // first button has index 1 and so on
        onTap: (int i) => debugPrint("Hey Touched $i"),
      ),
    );
  }
}
