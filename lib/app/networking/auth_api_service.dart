import 'dart:async';

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
        return null;
      },
      handleSuccess: (response) => AuthModel.fromJson(response.data),
      request: (request) => request.post("/auth/login", data: {
        "email": email,
        "password": password,
      }),
    );
  }
}
