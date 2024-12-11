import 'package:nylo_framework/nylo_framework.dart';

class Token extends Model {
  static StorageKey key = "token";
  late final String accessToken;
  late final DateTime accessExpires;
  late final String refreshToken;
  late final DateTime refreshExpires;

  Token({
    required this.accessToken,
    required this.accessExpires,
    required this.refreshToken,
    required this.refreshExpires,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      accessToken: json['access_token'],
      accessExpires: DateTime.parse(json['access_expires']),
      refreshToken: json['refresh_token'],
      refreshExpires: DateTime.parse(json['refresh_expires']),
    );
  }

  isAccessTokenExpired() {
    return accessExpires.isBefore(DateTime.now());
  }

  isRefreshTokenExpired() {
    return refreshExpires.isBefore(DateTime.now());
  }

  bool get isValid {
    if (accessToken.isEmpty) return false;
    if (refreshToken.isEmpty) return false;
    if (refreshExpires.isBefore(DateTime.now())) return false;
    return true;
  }

  bool get needRefreshToken {
    if (accessToken.isEmpty) return false;
    if (!isAccessTokenExpired()) return false;
    if (refreshToken.isEmpty) return false;
    if (isRefreshTokenExpired()) return false;
    return true;
  }

  @override
  toJson() {
    return {
      'access_token': accessToken,
      'access_expires': accessExpires.toIso8601String(),
      'refresh_token': refreshToken,
      'refresh_expires': refreshExpires.toIso8601String(),
    };
  }
}
