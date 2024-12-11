import 'package:flutter_app/app/models/token.dart';
import 'package:flutter_app/app/models/user.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AuthModel extends Model {
  static StorageKey key = "auth";
  late User user;
  late Token token;

  AuthModel(this.user, this.token) : super(key: key);

  AuthModel.fromJson(dynamic data) {
    user = User.fromJson(data['user']);
    token = Token.fromJson(data['tokens']);
  }

  @override
  toJson() {
    return {
      'user': user.toJson(),
      'tokens': token.toJson(),
    };
  }
}
