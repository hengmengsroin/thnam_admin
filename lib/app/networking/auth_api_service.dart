import 'dart:async';

import 'package:flutter/material.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AuthApiService extends NyApiService {
  AuthApiService({BuildContext? buildContext})
      : super(buildContext, decoders: modelDecoders);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  /// Example API Request
  FutureOr<Auth> login(
      {required String email, required String password}) async {
    return await network(
      request: (request) => request.post("/login", data: {
        "email": email,
        "password": password,
      }),
    );
  }
}
