class Microphone {
  //Instance variables, member variables
  //this = this object/class
  String name;
  String color;
  int model = 4536;

  //Syntactic sugar constructor
  Microphone(this.name, this.color, this.model);

// Named Constructor
  // Microphone.initialize() {
  //   name = "Blue Yeti 2nd Edition";
  //   model = 67;
  // }

  String get getName => name; // getter
  set setName(String value) => name = value; // setter

  //constructor
//   Microphone(String name, String color, int model) {
//
//       this.name = name;
//       this.color = color;
//       this.model = model;
//   }

  //Microphone(this.name, this.color, this.model);

  void turnOn() {
    print("$name is on!");
  }

  bool isOn() => true;

  int modelNumber() => model;

  void turnOff() {
    print("$name is turned off!");
  }

  void setVolume() {
    print("$name with color: $color volume is up!");
  }
}

main(List<String> arguments) {
  var mic = new Microphone("Blue Yeti", "Silver gray",
      1345); // we are crating the actual object of type mic

  mic.setName = "NewName";

  String name = "Paulo";

  print(mic.getName);

//  var micSecond = new Microphone.initialize(); // using the initialize named constructor
//
//  print(micSecond.model);
//  print(micSecond.name);
//
// // print(mic.model); //. (dot) access operator
//  mic.model = 8837647;
//
//  mic.turnOn();
//  mic.setVolume();
//  mic.turnOff();
//
//  print(mic.isOn());
//  print(mic.modelNumber());
}
