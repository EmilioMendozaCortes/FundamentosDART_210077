void main () {
  // Practica 05: Tipo de Dato Dinamico (Dynamic - Comodín)
  dynamic errorMessage;
  print(""" El valor inicial de errorMessage es : $errorMessage
  Al ser dinamico permite la asignación de valores nulos. """);

  errorMessage = "El usuario y la contraseña no coinciden";
  print(""" --------------------------------------------------------
  El nuevo valor de errorMessage es: $errorMessage
  En algunos sistemas los errores son controlados por un código númerico. """);

  errorMessage=false;
  print(""" --------------------------------------------------------
  El nuevo valor de errorMessage es :$errorMessage 
  Cuando el sistema funciona correctamente el mensaje de error puede ser FALSO.
  """);

  errorMessage= [400,404,500,502,505];
  print(""" --------------------------------------------------------
  El nuevo valor de errorMessage es :$errorMessage 
  En caso de que el sistema detecte varios errores podria agregarlos a una Lista.
  """);

  errorMessage = {125, "Usuario no encontrado", true, -1025.16, 'A ' };
  print(""" --------------------------------------------------------
  El nuevo valor de errorMessage es :$errorMessage 
  o incluso como un conjunto (SET) de datos.
  """);

  errorMessage = () => true;
  print(""" --------------------------------------------------------
  El nuevo valor de errorMessage es :$errorMessage 
  Que en este caso es el resultado de una función.
  """);
}