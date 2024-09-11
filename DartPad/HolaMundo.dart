void main() {
//   Declarando una variable generica para almacenar mi nombre
  var myName = 'Emi';
  String  myLastName = 'Mendoza';
  final int myDNI = 210077;
  late final int myAge;
  
//   Corregir mi nombre
  myName = 'Emilio';
//   myDNI =220000; Esocaciono un error porque la variable esta definida como final y no puede actualizar su valor
  print('Hola $myName $myLastName, tu matricula es: $myDNI y tu edad aún no la conozco, por que no se cuando naciste');
  
//   Interpretando el valor de las variables metodos de manipulación o transformación
  print('\nHola ${myName.toUpperCase()}  ${myLastName.toUpperCase()}, tu matricula es: $myDNI y tu edad aún no la conozco, por que no se cuando naciste');
}
