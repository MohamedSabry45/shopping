import 'package:flutter/material.dart';
import 'package:shopapp/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:shopapp/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:shopapp/features/settings/presentation/controllers/cubit/get_profile_cubit.dart';

class UIProfileSuccess extends StatelessWidget {
  const UIProfileSuccess({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextFormField(
              keyboardType: TextInputType.name,
              controller: nameController,
              prefixIcon: const Icon(Icons.person),
              labelText: 'Name',
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              prefixIcon: const Icon(Icons.email),
              labelText: 'Email',
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              prefixIcon: const Icon(Icons.phone),
              labelText: 'Phone',
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                    text: 'Update',
                    onPressed: () {
                      GetProfileCubit.get(context).updateProfile(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text);
                    })),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                    text: 'Logout',
                    onPressed: () {
                      GetProfileCubit.get(context).logout();

                    })),
          ],
        ),
      ),
    );
  }
}
