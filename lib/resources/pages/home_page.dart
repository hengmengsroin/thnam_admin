import '/resources/widgets/theme_toggle_widget.dart';
import '/bootstrap/extensions.dart';
import '/resources/widgets/logo_widget.dart';
import '/resources/widgets/safearea_widget.dart';
import '/app/controllers/home_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class HomePage extends NyStatefulWidget<HomeController> {
  static RouteView path = ("/home", (_) => HomePage());

  HomePage({super.key}) : super(child: () => _HomePageState());
}

class _HomePageState extends NyPage<HomePage> {
  int? _stars;

  @override
  get init => () async {
        /// Uncomment the code below to fetch the number of stars for the Nylo repository
        // Map<String, dynamic>? githubResponse = await api<ApiService>(
        //         (request) => request.githubInfo(),
        // );
        // _stars = githubResponse?["stargazers_count"];
      };

  /// Define the Loading style for the page.
  /// Options: LoadingStyle.normal(), LoadingStyle.skeletonizer(), LoadingStyle.none()
  /// uncomment the code below.
  @override
  LoadingStyle get loadingStyle => LoadingStyle.normal();

  /// The [view] method displays your page.
  @override
  Widget view(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // showToastSuccess(title: "Hello 👋", description: "Welcome to Nylo");
          // Uncomment the code below to send a push notifications
          await PushNotification.sendNotification(
            title: "Hello 👋",
            body: "Welcome to Nylo",
          );
        },
        child: const Icon(Icons.notifications),
      ),
      body: SafeAreaWidget(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Logo(),
              Text(
                getEnv("APP_NAME"),
              ).displayMedium(color: context.color.content),
              const Text("Micro-framework for Flutter",
                      textAlign: TextAlign.center)
                  .titleMedium(color: context.color.primaryAccent),
              const Text("Build something amazing 💡",
                      textAlign: TextAlign.center)
                  .bodyMedium()
                  .alignCenter(),
              const Text(
                "Framework Version: $nyloVersion",
              ).bodyMedium().setColor(context, (color) => Colors.grey),
              ThemeToggle(),
            ],
          ),
        ),
      ),
    );
  }
}
