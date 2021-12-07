class Person {
  String name;

  Person(this.name);
}

main(List<String> arguments) {
  var james = new Person("James");
  var sheila = new Person("Sheila");
  var gloria = new Person("Gloria");
  var gina = new Person("Gina");

  var list = [10, 2, 13, 24, 10, 56];
  // var onlyStrings = new List<String>();
  var onlyStrings = <String>[];

  // var personList = new List<Person>();
  var personList = <Person>[];
  personList.add(james);
  personList.add(sheila);
  personList.add(gloria);
  personList.add(gina);

  for (int i = 0; i < personList.length; i++) {
    print(personList[i].name);
  }

  onlyStrings.add("Paulo");
  onlyStrings.add("James");

  //print(list.length);
  //print(list[list.length - 1]);

  for (int i = 0; i < onlyStrings.length; i++) {
    print(onlyStrings[i]);
  }

  for (int i = 0; i < list.length; i++) {
    if (list[i] % 2 == 0)
      print("${list[i]} is multiple of 2");
    else
      print("Index $i contains ${list[i]} and is  not multiple of 2");
  }
}
