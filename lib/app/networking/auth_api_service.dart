import 'dart:async';
import '/config/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/auth.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AuthApiService extends NyApiService {
  AuthApiService({BuildContext? buildContext})
      : super(buildContext, decoders: modelDecoders);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  /// Example API Request
  FutureOr<AuthModel> login(
      {required String email, required String password}) async {
    return await network(
      handleFailure: (error) {
        printError(error);
        throw error.message ?? "An error occurred";
      },
      handleSuccess: (response) {
        final auth = AuthModel.fromJson(response.data);
        Backpack.instance.save(Keys.auth, auth.token.accessToken);
        return auth;
      },
      request: (request) => request.post("/auth/login", data: {
        "email": email,
        "password": password,
      }),
    );
  }
}
