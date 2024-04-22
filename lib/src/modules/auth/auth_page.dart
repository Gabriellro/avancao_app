import 'package:flutter/material.dart';

import '../../shared/forms/auth_form.dart';

class AuthPage extends StatelessWidget {
  static String routeName = "/AuthPage";

  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
                bottom: MediaQuery.of(context).size.height * 0.3,
                left: 36,
              ),
              child: Text(
                'Olá. \nBem vindo de volta!',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              child: AuthForm(),
            ),
          ],
        ),
      ),
    );
  }
}
