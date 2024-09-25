void main() {
  // FUNCIONES
  // 1. Llamado de una Función  Basica
  greetEveryone();

  // 2. Llamado de una función que retorna un valor
  // 2.1 Si no deseas almacenar el valor, se invoca normalmente
  print("Hoy es el dia número ${getDayNumber()}");
  // 2.2 Necesitamos almacenar el valor retornado para utilizar su valor en otras opciones del programa
  final numeroDia = getDayNumber();
  print("En 3 dias estaremos a: ${numeroDia+3}"); 

  // 3. Llamado de una función con parametros
  print( greetSomeone("Emilio"));
  // 3.1 Y que pasa si intentamos
  print( greetSomeone(45));
  print( greetSomeone(-15));
  print( greetSomeone(3.141516));
  print( greetSomeone(true));
  // 3.2 
  // print( greetSomeoneTyped(45));
  // print( greetSomeoneTyped(-15));
  // print( greetSomeoneTyped(3.141516));
  // print( greetSomeoneTyped(true));
  print( greetSomeoneTyped("Hugo Sanchez"));
  
  // 4. Llamado de funciones con varios parametros posicionales
  print(greetSomeoneHourOfDay("Emilio", 10));
  // ¿Qué pasa si solo envio un solo parametro?
  // print(greetSomeoneHourOfDay(null, null));
  // print(greetSomeoneHourOfDay("Emilio"));
  // print(greetSomeoneHourOfDay(10));
  // Analizando la función determinamos que la hora del dia puede ser nulo, y se puede definir como la hora actual del SO.
  print(greetSomeoneHourOfDay("Adalid", null));
  print(greetSomeoneHourOfDay("Maria"));

  // 5. FUNCIONES LAMBDA, ANONIMAS, ARROW FUNCTIONS, FUNCIONES FLECHA
  // Las funciones lambda, tambien conocidas como funciones anonimas o funciones flecha, se ejecutan de manera simple y no frecuentemente en la ejecución de un programa o sistema, en DART estas funciones solo pueden tener una sola instrucción para usar el operador =>
  final double costoTotal;
  var calcularTotalCarrito = (double productQuantity, double productPrice, double percentageDiscount) => (productQuantity * productPrice)*((100-percentageDiscount)/100);

  double cantidad = 3.180;
  double precio = 1725.10;
  double descuento = 8;

  print("""
  Costo del producto: ${precio}
  Cantidad solicitada: ${cantidad}
  Descuento definido: ${descuento} 
  ---------------------------------------------------------------
  Costo total: ${calcularTotalCarrito(cantidad, precio, descuento)}""");

  // 6. Llamado de una Función con parámetros nombredos
  print(infoCarListStatus(buyerName: "Gabriela"));
  // 6.1 Llamado de luna función con los parametros en desorden posicional
  print(infoCarListStatus(status: "En espera de pago",
                          amountCarList: 2614.2,
                          buyerName: "Alexia"  ));
}

// 1. FUNCIONES SIN PARAMETROS Y SIN RETORNO DE VALOR
greetEveryone () { // <-- dynamic
  print("Hola a Todos y Todas desde DART");
}

// 2. FUNCIONES QUE RETORNAN VALORES
int getDayNumber() {
  DateTime now = DateTime.now();
  return now.day;
}

// 3. FUNCIONES QUE REQUIEREN AL MENOS UN PARAMETRO (Sin Tipificación)
String greetSomeone (personName) {
  return "Hola ${personName}";
}

// 3. FUNCIONES QUE RECIBE PARAMETROS TIPIFICADOS
String greetSomeoneTyped (String personName) {
  return "Hola ${personName}";
}

// 4. FUNCIONES QUE RECIBEN MAS DE UN PARAMETRO
// int? - Puede ser vacio
// [] - Puede ser opcional
String greetSomeoneHourOfDay(String personName, [int? hourDay]) {
  String greeting;
  // El opeador ??= significa que sies nulo lo inicialice como, en caso de que tenga valor ignora la instrucción
  hourDay ??= DateTime.now().hour;
  print("Hora ${hourDay}");

  if(hourDay >= 6 && hourDay < 12){
    greeting = "Buenos dias";
  } else if(hourDay >= 12 && hourDay < 18){
    greeting= "Buenas Tardes";
  } else {
    greeting = "Buenas Noches";
  }
  return "${greeting}, ${personName}";
}

// 6. FUNCIONES CON PARAMETROS NOMBREDOS
String infoCarListStatus({required String buyerName, double amountCarList=0.0, String status="Selección de productos"}) {
  return "El carrito de compras de: ${buyerName}, tiene un total de \$${amountCarList} y actualmente esta en estatus ${status}";
}