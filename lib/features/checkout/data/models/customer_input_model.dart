class CustomerInputModel {
  final String? name;
  final String? email;
  final String? phone;
  final Map<String, dynamic>? shipping;

  CustomerInputModel({this.name, this.email, this.phone, this.shipping});

  Map<String, dynamic> toMap() =>
      {'name': name, 'email': email, 'phone': phone};
}
