part of 'get_profile_cubit.dart';

@immutable
sealed class GetProfileState {}

final class GetProfileInitial extends GetProfileState {}

final class GetProfileLoading extends GetProfileState {}

final class GetProfileSuccess extends GetProfileState {
  final GetProfileModel getProfileModel;

  GetProfileSuccess({required this.getProfileModel});
}

final class GetProfileFailure extends GetProfileState {
  final String errMessage;

  GetProfileFailure(this.errMessage);
}

final class UpdateProfileLoading extends GetProfileState {}

final class UpdateProfileSuccess extends GetProfileState {
  final GetProfileModel updateProfileModel;

  UpdateProfileSuccess({required this.updateProfileModel});
}

final class UpdateProfileFailure extends GetProfileState {
  final String errMessage;

  UpdateProfileFailure(this.errMessage);
}

final class LogoutLoading extends GetProfileState {}

final class LogoutSuccess extends GetProfileState {}

final class LogoutFailure extends GetProfileState {
  final String errMessage;

  LogoutFailure(this.errMessage);
}
