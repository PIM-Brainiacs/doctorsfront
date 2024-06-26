class User {
  //final String id;
  final String? username; 
  final String? email;
  final String? numTel;
  final String? password; 
  final String? specialty;
  final String? role; 
  final bool termsAccepted; 

  const User({
    //required this.id,
    required this.username,
    required this.email,
    required this.numTel,
    required this.password,
    required this.specialty, 
    this.role = 'DOCTOR', 
    required this.termsAccepted, 
  });

  factory User.fromJson(Map<String, dynamic> json) {
  
    final String role = json['role']?.toLowerCase() ?? 'DOCTOR'; 
    final validRoles = ['AUTISTE', 'DOCTOR'];
    final selectedRole = validRoles.contains(role) ? role : 'DOCTOR';

    return User(
      //id: json['id'],
      username: json['username'],
      email: json['email'],
      numTel: json['numTel'],
      password: json['password'],
      specialty: json['specialty'],
      role: selectedRole,
      termsAccepted: json['termsAccepted'] ?? false, 
    );
  }
}