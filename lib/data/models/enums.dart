enum UserRole {
  observer('Observador'),
  admin('Administrador'),
  manager('Gestionador'),
  responsible('Responsable');

  final String label;
  const UserRole(this.label);

    bool get isPasswordRequired => this != UserRole.responsible;
}