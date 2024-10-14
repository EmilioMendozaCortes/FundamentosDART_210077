// Clase de persona
abstract class Persona {
  int ID;
  String? cortesyTitle;
  String name;
  String firstLastName;
  String? secondLastName;
  String gender;
  String bloodGroup;
  DateTime birthdate;
  bool isActive;
  DateTime createdAt;
  DateTime? updatedAt;
  
  Persona({
    required this.ID,
    this.cortesyTitle,
    required this.name,
    required this.firstLastName,
    this.secondLastName,
    required this.gender,
    required this.bloodGroup,
    required this.birthdate,
    this.isActive = true,
    DateTime? createdAt,
    this.updatedAt
  }) : createdAt = createdAt ?? DateTime.now();

  void cancelaSuscripcion(); // Método abstracto

  @override  
  String toString() {
    final String formatedBirtDate = "${birthdate.day.toString().padLeft(2, '0')}/${birthdate.month.toString().padLeft(2, '0')}/${birthdate.year}";
    final String formatedCreatedDate = "${createdAt.day.toString().padLeft(2, '0')}/${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year} ${createdAt.hour.toString().padLeft(2, '0')}:${createdAt.minute.toString().padLeft(2, '0')}:${createdAt.second.toString().padLeft(2, '0')}";

    return """
    ------------------------------------------------------------
    DATOS DE LA PERSONA
    ------------------------------------------------------------
    ID: $ID
    Nombre: $name $firstLastName ${secondLastName ?? ''}
    Género: $gender
    Grupo Sanguíneo: $bloodGroup
    Fecha de Nacimiento: $formatedBirtDate
    Estatus: ${isActive ? "Activo" : "Inactivo"}
    Fecha de Registro: $formatedCreatedDate
    ------------------------------------------------------------
    """;
  }
}

// Clase de miembro extendida de persona
class Miembro extends Persona {
  String NSS;
  String tipoSeguro;
  String estatusVida;
  String fueTrabajador; 
  String estatusMedico;
  DateTime fechaRegistro;
  DateTime? fechaUltimaCita;

  Miembro({
    required this.NSS,
    required this.tipoSeguro,
    required this.estatusVida,
    required this.fueTrabajador, 
    required this.estatusMedico,
    required this.fechaRegistro,
    this.fechaUltimaCita,
    required int ID,
    String? cortesyTitle,
    required String name,
    required String firstLastName,
    String? secondLastName,
    required String gender,
    required String bloodGroup,
    required DateTime birthdate,
    bool isActive = true,
    DateTime? createdAt,
    DateTime? updatedAt
  }) : super(
    ID: ID,
    cortesyTitle: cortesyTitle,
    name: name,
    firstLastName: firstLastName,
    secondLastName: secondLastName,
    gender: gender,
    bloodGroup: bloodGroup,
    birthdate: birthdate,
    isActive: isActive,
    createdAt: createdAt,
    updatedAt: updatedAt
  );

  // Método para limpiar todos los datos (simulación de eliminación)
  void limpiaDatos() {
    ID = 0;
    cortesyTitle = null;
    name = "";
    firstLastName = "";
    secondLastName = null;
    gender = "";
    bloodGroup = "";
    birthdate = DateTime(1900, 01, 01); 
    isActive = false;
    fechaUltimaCita = null;
    NSS = "";
    tipoSeguro = "";
    estatusVida = "";
    fueTrabajador = "";
    estatusMedico = "";
    fechaRegistro = DateTime(1900, 01, 01); 
    print("Todos los datos del miembro han sido eliminados.");
  }

  // Método para actualizar todos los datos
  void actualizaDatos({
    required int nuevoID,
    String? nuevaCortesyTitle,
    required String nuevoName,
    required String nuevoFirstLastName,
    String? nuevoSecondLastName,
    required String nuevoGender,
    required String nuevoBloodGroup,
    required DateTime nuevoBirthdate,
    required bool nuevoIsActive,
    required DateTime nuevoFechaRegistro,
    DateTime? nuevaFechaUltimaCita,
    required String nuevoNSS,
    required String nuevoTipoSeguro,
    required String nuevoEstatusVida,
    required String nuevoFueTrabajador,
    required String nuevoEstatusMedico
  }) {
    ID = nuevoID;
    cortesyTitle = nuevaCortesyTitle;
    name = nuevoName;
    firstLastName = nuevoFirstLastName;
    secondLastName = nuevoSecondLastName;
    gender = nuevoGender;
    bloodGroup = nuevoBloodGroup;
    birthdate = nuevoBirthdate;
    isActive = nuevoIsActive;
    NSS = nuevoNSS;
    tipoSeguro = nuevoTipoSeguro;
    estatusVida = nuevoEstatusVida;
    fueTrabajador = nuevoFueTrabajador;
    estatusMedico = nuevoEstatusMedico;
    fechaRegistro = nuevoFechaRegistro;
    fechaUltimaCita = nuevaFechaUltimaCita;
    print("Todos los datos del miembro han sido actualizados.");
  }

  @override
  void cancelaSuscripcion() {
    isActive = false;
    print("Suscripción cancelada para el miembro $name $firstLastName.");
  }

  @override
  String toString() {
    final String formatedBirthDate = "${birthdate.day.toString().padLeft(2, '0')}/${birthdate.month.toString().padLeft(2, '0')}/${birthdate.year}";
    final String formatedCreatedDate = "${createdAt.day.toString().padLeft(2, '0')}/${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year} ${createdAt.hour.toString().padLeft(2, '0')}:${createdAt.minute.toString().padLeft(2, '0')}:${createdAt.second.toString().padLeft(2, '0')}";
    final String formatedFechaRegistro = "${fechaRegistro.day.toString().padLeft(2, '0')}/${fechaRegistro.month.toString().padLeft(2, '0')}/${fechaRegistro.year}";

    String formatedFechaUltimaCita = fechaUltimaCita != null
      ? "${fechaUltimaCita!.day.toString().padLeft(2, '0')}/${fechaUltimaCita!.month.toString().padLeft(2, '0')}/${fechaUltimaCita!.year}"
      : "No registrada";

    return """
    ------------------------------------------------------------
    DATOS DEL MIEMBRO
    ------------------------------------------------------------
    ID: $ID
    Nombre: $name $firstLastName ${secondLastName ?? ''}
    Género: $gender
    Grupo Sanguíneo: $bloodGroup
    Fecha de Nacimiento: $formatedBirthDate
    NSS: $NSS
    Tipo de Seguro: $tipoSeguro
    Estatus de Vida: $estatusVida
    Empleado: $fueTrabajador
    Estatus Médico: $estatusMedico
    Fecha de Registro: $formatedFechaRegistro
    Última Cita: $formatedFechaUltimaCita
    Estatus: ${isActive ? "Activo" : "Inactivo"}
    Fecha de Creación: $formatedCreatedDate
    ------------------------------------------------------------
    """;
  }
}

void main() {
  // Casos de prueba 1
  print("CASO DE PRUEBA 1");
  final nuevoMiembro = Miembro(
      NSS: "123456789",
      tipoSeguro: "IMSS",
      estatusVida: "Vivo",
      fueTrabajador: "No", 
      estatusMedico: "Sano",
      fechaRegistro: DateTime.now(),
      ID: 1,
      name: "Carlos",
      firstLastName: "García",
      secondLastName: "López",
      gender: "Hombre",
      bloodGroup: "A+",
      birthdate: DateTime(1990, 05, 12)
  );
  print(nuevoMiembro);
  
  // Casos de prueba 2
  print("CASO DE PRUEBA 2");
  final trabajador = Miembro(
      NSS: "987654321",
      tipoSeguro: "ISSSTE",
      estatusVida: "Retirado",
      fueTrabajador: "Fue trabajador", 
      estatusMedico: "Sano",
      fechaRegistro: DateTime(2020, 07, 15),
      fechaUltimaCita: DateTime(2023, 10, 05),
      ID: 2,
      name: "Ana",
      firstLastName: "Martínez",
      secondLastName: "Sánchez",
      gender: "Mujer",
      bloodGroup: "O-",
      birthdate: DateTime(1975, 03, 10)
  );
  print(trabajador);

  // Casos de prueba 3
  print("CASO DE PRUEBA 3 - Inicial");
  final miembro = Miembro(
      NSS: "1122334455",
      tipoSeguro: "Privado",
      estatusVida: "Vivo",
      fueTrabajador: "No",
      estatusMedico: "Enfermo",
      fechaRegistro: DateTime(2021, 01, 22),
      ID: 3,
      name: "Roberto",
      firstLastName: "Hernández",
      secondLastName: "Pérez",
      gender: "Hombre",
      bloodGroup: "B+",
      birthdate: DateTime(1985, 11, 05)
  );
  print(miembro);

  // Actualización de datos
  print("\nCASO DE PRUEBA 3 - Actualización");
  miembro.actualizaDatos(
    nuevoID: 3,
    nuevaCortesyTitle: "Sr.",
    nuevoName: "Maria",
    nuevoFirstLastName: "Hernández",
    nuevoSecondLastName: "Pérez",
    nuevoGender: "Mujer",
    nuevoBloodGroup: "A+",
    nuevoBirthdate: DateTime(1985, 12, 05),
    nuevoIsActive: true,
    nuevoFechaRegistro: DateTime(2021, 01, 22),
    nuevaFechaUltimaCita: DateTime(2024, 10, 12),
    nuevoNSS: "9988776655",
    nuevoTipoSeguro: "IMSS",
    nuevoEstatusVida: "Vivo",
    nuevoFueTrabajador: "No",
    nuevoEstatusMedico: "Sano"
  );
  print(miembro);

  // Limpieza de datos (eliminar)
  print("\nCASO DE PRUEBA 3 - Limpieza");
  miembro.limpiaDatos();
  print(miembro);
}
