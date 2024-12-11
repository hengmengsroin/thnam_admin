import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  static StorageKey key = "user";
  final String id;
  final String name;
  final String email;
  final String role;
  final String organization;
  final String orgName;
  final String status;
  final int scheme;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.status = 'active',
    required this.organization,
    this.orgName = '',
    this.scheme = 8,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      status: json['status'] ?? 'active',
      organization: json['organization'] ?? "",
      scheme: json['scheme'] ?? 8,
      orgName: json['organization_name'] ?? "",
    );
  }

  // copy with
  User copyWith({
    String? id,
    String? name,
    String? email,
    String? role,
    String? organization,
    String? orgName,
    String? status,
    int? scheme,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      organization: organization ?? this.organization,
      orgName: orgName ?? this.orgName,
      status: status ?? this.status,
      scheme: scheme ?? this.scheme,
    );
  }

  @override
  toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'organization': organization,
      'organization_name': orgName,
      'scheme': scheme,
      'status': status,
    };
  }

  bool get isOwner {
    return role == 'owner';
  }

  bool get isUser {
    return role == 'user';
  }

  bool get isSeller {
    return role == 'seller';
  }

  bool get isAdmin {
    return role == 'admin';
  }

  bool get isStockist {
    return role == 'stockist';
  }

  bool get isPurchaser {
    return role == 'purchaser';
  }
}
