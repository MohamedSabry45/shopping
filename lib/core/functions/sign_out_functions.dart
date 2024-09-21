import 'package:flutter/material.dart';
import 'package:shopapp/core/services/cache_helper_services.dart';
import 'package:shopapp/features/auth/presentation/views/login_view.dart';

void signOutFunctions(BuildContext context) {
  CacheHelper.clearData();
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
      (route) => false);
}
