void main() {
  final pokemon = {
    'Name': 'Ditto',
    'HP': 100,
    'isAlive': true,
    'abilities': ['Impact Trueno', 'Cola de Hierro', 'Rapido'],
    'sprites': <int, String>{
      1: "pikachu/front.png",
      2: "pikachu/back.png",
    }
  };

  final Map<String, dynamic> trainer = {
    'Name': 'Ash Ketchup',
    'Gender': 'Male',
    'Age': 12,
    'isGymnasiumLeader': false
  };

  final Map<int, String> pokemons = {
    1: "Pikachu",
    2: "Carmander",
    3: "Squirttle",
    4: "Pidgeot"
  };

  print(""" 
    Los datos del pokemon usando el Mapa son:
    -----------------------------------------------------
    Pokemon = $pokemon
    Trainer = $trainer
    Pokemons = $pokemons
  """);
  print("*************************************************");
  
  print(""" 
  Accediendo a las propiedades del pokemon usando los corchetes []:
  -------------------------------------------------------
  Nombre = ${pokemon['Name']}
  HP = ${pokemon['HP']}
  Vivo = ${pokemon['isAlive']}
  """);
  print("*************************************************");
  final tmp_sprites = pokemon['sprites'] as Map<int,String>;
  print("""
  -------------------------------------------------------
  Back = ${tmp_sprites[2]}
  Front = ${tmp_sprites[1]}
  """);
  
}
