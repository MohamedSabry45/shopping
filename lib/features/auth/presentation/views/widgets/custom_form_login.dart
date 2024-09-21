import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/core/constants/end_point_const.dart';
import 'package:shopapp/core/functions/show_tost.dart';
import 'package:shopapp/core/services/cache_helper_services.dart';
import 'package:shopapp/features/Home/presentation/views/home_view.dart';
import 'package:shopapp/features/auth/presentation/controllers/login_cubit/login_cubit.dart';
import 'package:shopapp/features/auth/presentation/views/sign_up_view.dart';
import 'package:shopapp/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:shopapp/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:shopapp/features/auth/presentation/views/widgets/have_account_widget.dart';

class CustomFormLogin extends StatefulWidget {
  const CustomFormLogin({
    super.key,
  });

  @override
  State<CustomFormLogin> createState() => _CustomFormLoginState();
}

class _CustomFormLoginState extends State<CustomFormLogin> {
  late TextEditingController emailController;

  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showTost(
              message: state.shopLoginModel.message.toString(),
              state: ToastStates.SUCCESS);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
              (route) => false);
          CacheHelper.saveData(key: login, value: true);
          CacheHelper.saveData(
              key: token, value: state.shopLoginModel.data!.token);
        }
        if (state is LoginFailure) {
          showTost(message: state.message, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email),
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                obscureText: LoginCubit.get(context).isVisible,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                    onPressed: () {
                      LoginCubit.get(context).visible();
                    },
                    icon: Icon(LoginCubit.get(context).icon)),
              ),
              const SizedBox(height: 30),
              state is LoginLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.deepOrange,
                    ))
                  : SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: CustomButton(
                        text: "Login",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).loginUser(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                      ),
                    ),
              const SizedBox(height: 15),
              HaveAccountWidget(
                text: "Don't have an account?",
                textButton: "Sign up",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpView()));
                },
              )
            ],
          ),
        );
      },
    );
  }
}
