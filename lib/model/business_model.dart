// ignore_for_file: public_member_api_docs, sort_constructors_first
class BusinessModel {
  final String name;
  final String location;
  final String phone;

  BusinessModel({
    required this.name,
    required this.location,
    required this.phone,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    final name = json['biz_name']?.toString().trim();
    final location = json['bss_location']?.toString().trim();
    final phone = json['contct_no']?.toString().trim();

    if (name == null || location == null || phone == null) {
      throw FormatException("Invalid Business JSON: $json");
    }

    return BusinessModel(name: name, location: location, phone: phone);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'location': location,
        'phone': phone,
      };

  @override
  String toString() => 'BusinessModel(name: $name, location: $location, phone: $phone)';
}
