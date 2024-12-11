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
  final loginForm = LoginForm();
  @override
  get init => () {};

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: NyForm(
          header: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Login to your account').bodyMedium(),
          ),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          form: loginForm,
          initialData: {
            "email": "user@demo.com",
          },
          footer: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Button.primary(
              text: "Login",
              skeletonizerLoading: false,
              showToastError: true,
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
    );
  }
}
