import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/core/functions/show_tost.dart';
import 'package:shopapp/core/functions/sign_out_functions.dart';
import 'package:shopapp/features/settings/presentation/controllers/cubit/get_profile_cubit.dart';
import 'package:shopapp/features/settings/presentation/views/widgets/u_i_profile_success.dart';

class GetProfileBlocConsumer extends StatefulWidget {
  const GetProfileBlocConsumer({
    super.key,
  });

  @override
  State<GetProfileBlocConsumer> createState() => _GetProfileBlocConsumerState();
}

class _GetProfileBlocConsumerState extends State<GetProfileBlocConsumer> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProfileCubit, GetProfileState>(
      listener: (context, state) {
        if (state is GetProfileSuccess) {
          nameController.text = state.getProfileModel.data!.name!;
          emailController.text = state.getProfileModel.data!.email!;
          phoneController.text = state.getProfileModel.data!.phone!;
        }
        if (state is UpdateProfileSuccess) {
          nameController.text = state.updateProfileModel.data!.name!;
          emailController.text = state.updateProfileModel.data!.email!;
          phoneController.text = state.updateProfileModel.data!.phone!;
          showTost(
              message: state.updateProfileModel.message.toString(),
              state: ToastStates.SUCCESS);
        }
        if (state is UpdateProfileFailure) {
          showTost(
              message: state.errMessage.toString(), state: ToastStates.ERROR);
        }if (state is LogoutSuccess) {
          signOutFunctions(context);
        }else if (state is LogoutFailure) {
          showTost(
              message: state.errMessage.toString(), state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        if (state is GetProfileSuccess ||
            state is UpdateProfileSuccess ||
            state is UpdateProfileLoading) {
          return UIProfileSuccess(
              emailController: emailController,
              nameController: nameController,
              phoneController: phoneController);
        } else if (state is GetProfileFailure) {
          return Center(child: Text(state.errMessage.toString()));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
