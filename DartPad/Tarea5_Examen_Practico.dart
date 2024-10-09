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

  void cancelaSuscripcion(); // Método abstracto a sobrescribir en las clases derivadas

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
  String fueTrabajador; // corregido
  String estatusMedico;
  DateTime fechaRegistro;
  DateTime? fechaUltimaCita;

  Miembro({
    required this.NSS,
    required this.tipoSeguro,
    required this.estatusVida,
    required this.fueTrabajador, // corregido
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

  @override
  void cancelaSuscripcion() {
    isActive = false;
    print("Suscripción cancelada para el miembro $name $firstLastName.");
  }
}

void main() {
    // Casos de prueba 1
    print("CASO DE PRUEBA 1");
    final nuevoMiembro = Miembro(
        NSS: "123456789",
        tipoSeguro: "IMSS",
        estatusVida: "Vivo",
        fueTrabajador: "No", // corregido
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
        fueTrabajador: "Fue trabajador", // corregido
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
    print("CASO DE PRUEBA 3");
    final miembro = Miembro(
        NSS: "1122334455",
        tipoSeguro: "Privado",
        estatusVida: "Vivo",
        fueTrabajador: "No", // corregido
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
    miembro.cancelaSuscripcion();
    print(miembro);
}
