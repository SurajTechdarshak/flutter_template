import 'package:core/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/routes/routes.dart';
import 'package:go_router/go_router.dart';

class ScreenRoot extends StatelessWidget {
  const ScreenRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Button("Login", onPressed: () {
            context.go(toRoute(routeLogin));
          }),
          Button("Home", onPressed: () {
            context.go(toRoute(routeHome));
          }),
        ],
      ),
    );
  }
}
