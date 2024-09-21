import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/settings/presentation/controllers/cubit/get_profile_cubit.dart';
import 'package:shopapp/features/settings/presentation/views/widgets/get_profile_bloc_consumer.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetProfileCubit()..getProfile(),
      child: const GetProfileBlocConsumer(),
    );
  }
}
