abstract class Animal {}

abstract class Mamifero extends Animal {}
abstract class Ave extends Animal {}
abstract class Pez extends Animal {}

mixin Volador {
  void volar() => print('estoy volando');
  void planear(int distanciaMaxima) => print('Este animal puede planear hasta: ${distanciaMaxima} km/h');
  void ascender(double alturaMaxima) => print('Este animal puede ascender hasta una altura de ${alturaMaxima} mts. sobre el nivel del mar.');
  void descender(String velocidadMax) => print('Este animal puede descender a una velocidad de hasta: ${velocidadMax}');
}

mixin Caminante {
  void caminar() => print('estoy caminando');
  void correr(String velocidadMax) => print('Este animal puede correr a una velocidad de hasta: ${velocidadMax}');
  void trotar(bool puedeTrotando) => print('Este animal  ${puedeTrotando} puede trotar.');
  void saltar(bool puedeSaltar) => print('Este animal ${puedeSaltar} puede saltar ');
}

mixin Nadador {
  void nadar() => print('estoy nadando');
  void sumergir(int profundidadMaxima) => print('Este animal se puede semergir a una profundidad de hasta: ${profundidadMaxima} mts.');
  void respirar(bool puedeRespirar) => print('Este animal ${puedeRespirar} puede respirar sobre el agua.');
}

class Delfin extends Mamifero with Nadador {}
class Gato extends Mamifero with Caminante {}
class Murcielago extends Mamifero with Volador, Caminante {}
class MurcielagoFruta extends Mamifero with Volador, Caminante {}

class Paloma extends Ave with Caminante,Volador {}
class Pato extends Ave with Caminante, Volador, Nadador {}
class PatoArlequin extends Ave with Caminante, Volador, Nadador {}

class Tiburon extends Pez with Nadador {}
class PezVolador extends Pez with Nadador,Volador {}


void main() {
  final fliper = Delfin();
  print("Instanciando la clase Delfin, y accediendo a sus funciones.");
  fliper.nadar();

  print("-------------------------------------------------------------");
  print("Instanciando la clase Murcielago y accediendo a sus unciones");
  final chupacabras = Murcielago();
  chupacabras.caminar();
  chupacabras.volar();

  print("-------------------------------------------------------------");
  print("Instanciando la clase de Pato, y accediendo a sus funciones");
  final pekines = Pato();
  pekines.caminar();
  pekines.planear(100);
  pekines.ascender(30);
  pekines.descender("5 km/h");
  pekines.volar();
  pekines.nadar();

  print("-------------------------------------------------------------");
  print("Instanciando la clase de Pato Arlequín, y accediendo a sus funciones");
  final partoAr = PatoArlequin();
  partoAr.volar();
  partoAr.planear(80);
  partoAr.ascender(1500);
  partoAr.descender("50 km/h");
  partoAr.caminar();
  partoAr.correr('10 km/h');
  partoAr.trotar(false);
  partoAr.saltar(false);
  partoAr.nadar();
  partoAr.sumergir(2);
  partoAr.respirar(true);

  print("-------------------------------------------------------------");
  print("Instanciando la clase de Murcielago eclipse de fruta, y accediendo a sus funciones");
  final nurcielagoEclipsedeFruta = MurcielagoFruta();
  nurcielagoEclipsedeFruta.planear(50); 
  nurcielagoEclipsedeFruta.ascender(1000); 
  nurcielagoEclipsedeFruta.descender('30 km/h');
  nurcielagoEclipsedeFruta.caminar();
  nurcielagoEclipsedeFruta.correr('hasta 10 km/h');
  nurcielagoEclipsedeFruta.trotar(true);
  nurcielagoEclipsedeFruta.saltar(false);
}