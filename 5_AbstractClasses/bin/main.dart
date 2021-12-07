abstract class Animal {
  void breathe(); // an abstract method

  void makeNoise() {
    print("Making animal noises!");
  }
}

abstract class IsFunny {
  void makePeopleLaugh(); //abstract method
}

class TVShow implements IsFunny {
  String name = "something";

  @override
  void makePeopleLaugh() {
    print("TV show is funny and makes people laugh!");
  }
}

class Person implements Animal {
  String name, nationality;

  Person(this.name, this.nationality);

  @override
  void breathe() {
    print("Person breathing through nostrils!");
  }

  @override
  void makeNoise() {
    print("Person shouting!");
  }

  @override
  String toString() => "$name $nationality";
}

class Comedian extends Person implements IsFunny {
  Comedian(String name, String nationality) : super(name, nationality);

  @override
  void makePeopleLaugh() {
    print("Comedian making people laugh!");
  }
}

main(List<String> arguments) {
  var jenny = new Person("Jenny", "Jamaican");
  print(jenny);
}
