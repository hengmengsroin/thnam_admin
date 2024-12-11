import 'package:flutter/material.dart';
import 'package:flutter_app/app/forms/login_form.dart';
import 'package:flutter_app/app/networking/auth_api_service.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/widgets/buttons/buttons.dart';
import 'package:nylo_framework/nylo_framework.dart';

class LoginPage extends NyStatefulWidget {
  static RouteView path = ("/login", (_) => LoginPage());

  LoginPage({super.key}) : super(child: () => _LoginPageState());
}

class _LoginPageState extends NyPage<LoginPage> {
  @override
  get init => () {};

  final loginForm = LoginForm();

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Container(
          child: NyForm(
            form: loginForm,
            footer: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Button.primary(
                text: "Login",
                skeletonizerLoading: false,
                submitForm: (
                  loginForm,
                  (data) async {
                    printInfo(data);
                    final auth = await AuthApiService().login(
                      email: data['email'],
                      password: data['password'],
                    );
                    printInfo(auth);
                    routeTo(HomePage.path);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
