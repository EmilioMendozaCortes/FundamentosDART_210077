void main() {
  // Clase con parametros posicionales, los parametros  deben respetar su orden para ser asignados en la propiedad
  final Hero wolverine = Hero('Logan', 'Regeneración');
  // Clase con parametros no posicionales, los puedo mandar en desorden
  final xmen = Team(Type:'Heroes', Name:'X-Men');
  final brotherhood = Team( Name: 'The Brotherhood of Evil Mutants');
  
  print(wolverine);
  print(wolverine.name);
  print(wolverine.power);
  print("--------------------------------------");
  print(xmen);
  print(xmen.Name);
  print(xmen.Type);
  // Invocación al metodo rescrito con @override
  print(xmen.toString());
  print("--------------------------------------");
  print(brotherhood);
  print(brotherhood.Name);
  print(brotherhood.Type);
  // Invocación al metodo rescrito con @override
  print(brotherhood.toString());
}

class Hero {
  String name;
  String power;
  Hero(String pName, String pPower)
    : name = pName,
      power = pPower;
}

class Team {
  String Name;
  String Type;
  Team({
    required this.Name, 
    this.Type = 'No definido'
  });

  @override
  String toString() {
    return 'Grupo: $Name - Tipo: $Type';
  }
}
