void main(){
  // Practica 04: Tipos de Datos en DART

  // Cadenas (String)
  final String pokemon = "Pikachu";

  // Enteros (Int)
  final int hp = 100;

  // Boleano (Boolean)
  final bool isAlive = true;

  // Listas (List)
  final abilities = ['Impact-Trueno', 'Cola de Hierro', 'Ataque Rápido'];
  final strites = <String>['Pikachu_font.png', 'Pikachu_back.png'];

  print(""" El pokemon que elegiste es: $pokemon 
  --------------------------------
  Las estadisticas de $pokemon son:
  Vida (HP) : $hp
  Estatus de Vida : $isAlive
  Habilidades : $abilities
  Imágenes : $strites
  """);
}