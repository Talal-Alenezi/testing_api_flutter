import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_api/pages/home_page.dart';
import 'package:todo_api/pages/signin.dart';
import 'package:todo_api/pages/signup.dart';
import 'package:todo_api/providers/auth_provider.dart';
import 'package:todo_api/providers/todo_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TodoProvider()),
    ChangeNotifierProvider(create: (context) => AuthPovider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // The route configuration.
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/homepage',
        builder: (BuildContext context, GoRouterState state) {
          return HomePage();
        },
      ),
      GoRoute(
        path: '/signup',
        builder: (BuildContext context, GoRouterState state) {
          return SignUpPage();
        },
      ),
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return SignInPage();
        },
      ),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
