import 'package:core/extensions/int_extension.dart';
import 'package:core/theme.dart';
import 'package:core/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/routes/routes.dart';
import 'package:go_router/go_router.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          "Screen Home".body,
          20.vertical,
          Button("Back", onPressed: () {
            context.go(routeRoot);
          })
        ],
      ),
    );
  }
}
