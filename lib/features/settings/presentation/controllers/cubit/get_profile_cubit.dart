import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopapp/core/services/api_services.dart';
import 'package:shopapp/features/settings/data/models/get_profile_model/get_profile_model.dart';

import '../../../../../core/constants/end_point_const.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit() : super(GetProfileInitial());

  static GetProfileCubit get(context) => BlocProvider.of(context);

  void getProfile() async {
    emit(GetProfileLoading());
    try {
      var response =
          await ApiServices.getData(url: profileEndPoint, token: getToken);
      GetProfileModel? getProfileModel =
          GetProfileModel.fromJson(response.data);
      log(response.data.toString());
      if (!getProfileModel.status!) {
        throw Exception(getProfileModel.message!);
      }
      emit(GetProfileSuccess(getProfileModel: getProfileModel));
    } on Exception catch (e) {
      emit(GetProfileFailure(e.toString()));
    } catch (e) {
      emit(GetProfileFailure(e.toString()));
    }
  }

  void updateProfile({
    required String name,
    required String email,
    required String phone,
  }) async {
    emit(UpdateProfileLoading());
    try {
      var response = await ApiServices.putData(
          url: updateProfileEndPoint,
          token: getToken,
          data: {"name": name, "email": email, "phone": phone});
      GetProfileModel updateProfileModel =
          GetProfileModel.fromJson(response.data);
      if (!updateProfileModel.status!) {
        throw Exception(updateProfileModel.message!);
      }
      emit(UpdateProfileSuccess(updateProfileModel: updateProfileModel));
    } on Exception catch (e) {
      emit(UpdateProfileFailure(e.toString()));
    } catch (e) {
      emit(UpdateProfileFailure(e.toString()));
    }
  }

  void logout() async {
    emit(LogoutLoading());
    try {
       await ApiServices.postData(
          url: logoutEndPoint, data: {
            "fcm_token": "SomeFcmToken"
          }, token: getToken);
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure(e.toString()));
    }
  }

  @override
  void onChange(Change<GetProfileState> change) {
    log(change.currentState.toString());
    super.onChange(change);
  }
}
