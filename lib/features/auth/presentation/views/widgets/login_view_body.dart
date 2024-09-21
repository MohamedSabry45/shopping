import 'package:flutter/material.dart';
import 'package:shopapp/features/auth/presentation/views/widgets/custom_form_login.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "LOGIN",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text('Login to your account',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 30),
              const CustomFormLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
