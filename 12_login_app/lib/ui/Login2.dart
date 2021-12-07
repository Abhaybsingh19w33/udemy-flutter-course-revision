import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _welcomeString = "";

  void _erase() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
      _welcomeString = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
      ),
      backgroundColor: Colors.amber[50],
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            //image/profile
            Image.asset(
              'images/face.png',
              width: 90.0,
              height: 90.0,
              color: Colors.lightGreen,
            ),
            const SizedBox(
              height: 30,
            ),
            //form
            Container(
              height: 180.0,
              width: 380.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _userController,
                    decoration: const InputDecoration(
                        hintText: 'Username', icon: Icon(Icons.person)),
                  ),

                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),

                  const Padding(padding: EdgeInsets.all(10.5)), //add padding
                  Center(
                    child: Row(
                      children: <Widget>[
                        // Login button
                        Container(
                          margin: const EdgeInsets.only(left: 38.0),
                          child: ElevatedButton(
                              onPressed: _showWelcome,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent, // background
                                // onPrimary: Colors.white, // foreground
                              ),
                              // color: Colors.redAccent,
                              child: const Text("Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.9))),
                        ),

                        // Clear button
                        Container(
                          margin: const EdgeInsets.only(left: 120.0),
                          child: ElevatedButton(
                              onPressed: _erase,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent, // background
                                // onPrimary: Colors.white, // foreground
                              ),
                              // color: Colors.redAccent,
                              child: const Text("Clear",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.9))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ), //form ends here

            const Padding(padding: EdgeInsets.all(14.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _welcomeString,
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showWelcome() {
    setState(() {
      if (_userController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        _welcomeString = "Welcome, " + _userController.text;
      } else {
        _welcomeString = "Please enter credentials!";
      }
    });
  }
}
