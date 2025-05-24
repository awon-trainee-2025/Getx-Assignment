class Contact {
  final String email;
  final String phone;

  Contact({required this.email, required this.phone});

  Map<String, dynamic> toJson() => {
    'email': email,
    'phone': phone,
  };
}
