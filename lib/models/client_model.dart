class ClientModel {
  String? id;
  String? name;
  String? phone;

  ClientModel({this.id, this.name, this.phone});

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
      };
}
