enum MiembroStatus { activo, inactivo }

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

  void cancelaSuscripcion();

  void actualizaDatos(Map<String, dynamic> nuevosDatos); // Método abstracto para actualizar datos

  @override  
  String toString() {
    final String formatedBirtDate = "${birthdate.day.toString().padLeft(2, '0')}/${birthdate.month.toString().padLeft(2, '0')}/${birthdate.year}";
    final String formatedCreatedDate = "${createdAt.day.toString().padLeft(2, '0')}/${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year} ${createdAt.hour.toString().padLeft(2, '0')}:${createdAt.minute.toString().padLeft(2, '0')}:${createdAt.second.toString().padLeft(2, '0')}";

    return """ID: $ID
    Nombre: $name $firstLastName ${secondLastName ?? ''}
    Título de Cortesía: ${cortesyTitle ?? 'N/A'}
    Género: $gender
    Grupo Sanguíneo: $bloodGroup
    Fecha de Nacimiento: $formatedBirtDate
    Estatus: ${isActive ? "Activo" : "Inactivo"}
    Fecha de Registro: $formatedCreatedDate""";
  }
}

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

  @override
  void cancelaSuscripcion() {
    isActive = false;
    print("Suscripción cancelada para el miembro $name $firstLastName.");
  }

  // Método para limpiar todos los datos
  void limpiaDatos() {
    ID = 0;
    cortesyTitle = null;
    name = '';
    firstLastName = '';
    secondLastName = null;
    gender = '';
    bloodGroup = '';
    birthdate = DateTime.now();
    isActive = false;
    NSS = '';
    tipoSeguro = '';
    estatusVida = '';
    fueTrabajador = '';
    estatusMedico = '';
    fechaRegistro = DateTime.now();
    fechaUltimaCita = null;
    print("Todos los datos del miembro han sido eliminados.");
  }

  @override
  void actualizaDatos(Map<String, dynamic> nuevosDatos) {
    if (nuevosDatos.containsKey('cortesyTitle')) cortesyTitle = nuevosDatos['cortesyTitle'];
    if (nuevosDatos.containsKey('name')) name = nuevosDatos['name'];
    if (nuevosDatos.containsKey('firstLastName')) firstLastName = nuevosDatos['firstLastName'];
    if (nuevosDatos.containsKey('secondLastName')) secondLastName = nuevosDatos['secondLastName'];
    if (nuevosDatos.containsKey('gender')) gender = nuevosDatos['gender'];
    if (nuevosDatos.containsKey('bloodGroup')) bloodGroup = nuevosDatos['bloodGroup'];
    if (nuevosDatos.containsKey('birthdate')) birthdate = nuevosDatos['birthdate'];
    if (nuevosDatos.containsKey('isActive')) isActive = nuevosDatos['isActive'];
    if (nuevosDatos.containsKey('NSS')) NSS = nuevosDatos['NSS'];
    if (nuevosDatos.containsKey('tipoSeguro')) tipoSeguro = nuevosDatos['tipoSeguro'];
    if (nuevosDatos.containsKey('estatusVida')) estatusVida = nuevosDatos['estatusVida'];
    if (nuevosDatos.containsKey('fueTrabajador')) fueTrabajador = nuevosDatos['fueTrabajador'];
    if (nuevosDatos.containsKey('estatusMedico')) estatusMedico = nuevosDatos['estatusMedico'];
    if (nuevosDatos.containsKey('fechaRegistro')) fechaRegistro = nuevosDatos['fechaRegistro'];
    if (nuevosDatos.containsKey('fechaUltimaCita')) fechaUltimaCita = nuevosDatos['fechaUltimaCita'];
    print("Datos actualizados para el miembro $name $firstLastName.");
  }

  @override  
  String toString() {
    final String formatedFechaRegistro = "${fechaRegistro.day.toString().padLeft(2, '0')}/${fechaRegistro.month.toString().padLeft(2, '0')}/${fechaRegistro.year}";
    final String formatedFechaUltimaCita = fechaUltimaCita != null
      ? "${fechaUltimaCita!.day.toString().padLeft(2, '0')}/${fechaUltimaCita!.month.toString().padLeft(2, '0')}/${fechaUltimaCita!.year}"
      : "N/A";

    return """
    ------------------------------------------------------------
    DATOS DEL MIEMBRO
    ------------------------------------------------------------
    ${super.toString()}
    NSS: $NSS
    Tipo de Seguro: $tipoSeguro
    Estatus de Vida: $estatusVida
    Fue Trabajador: $fueTrabajador
    Estatus Médico: $estatusMedico
    Fecha de Registro: $formatedFechaRegistro
    Fecha de Última Cita: $formatedFechaUltimaCita
    ------------------------------------------------------------
    """;
  }
}

void main() {
  // Caso de prueba 1
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
  
  // Caso de prueba 2
  print("CASO DE PRUEBA 2");
  final trabajador = Miembro(
    NSS: "987654321",
    tipoSeguro: "ISSSTE",
    estatusVida: "Retirado",
    fueTrabajador: "Sí", 
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

  // Caso de prueba 3
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

  // Caso de prueba 3 - Actualización de datos
  print("\nCASO DE PRUEBA 3 - Actualización");
  nuevoMiembro.actualizaDatos({
    'name': 'Maria',
    'firstLastName': 'Hernández',
    'gender': 'Mujer',
    'NSS': '987654321',
    'tipoSeguro': 'ISSSTE',
    'fechaUltimaCita': DateTime(2024, 10, 15),
  });
  print(nuevoMiembro);

  // Caso de prueba 3 - Limpieza de datos
  print("\nCASO DE PRUEBA 3 - Limpieza");
  nuevoMiembro.limpiaDatos();
  print(nuevoMiembro);
}
