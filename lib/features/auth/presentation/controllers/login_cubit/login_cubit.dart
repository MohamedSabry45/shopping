import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopapp/core/constants/end_point_const.dart';
import 'package:shopapp/core/services/api_services.dart';
import 'package:shopapp/core/services/cache_helper_services.dart';
import 'package:shopapp/features/auth/data/models/shop_login_model/shop_login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  late ShopLoginModel shopLoginModel;
  void loginUser({required String email, required String password}) async {
    try {
      emit(LoginLoading());
      var response = await ApiServices.postData(
          url: login, data: {"email": email, "password": password});
      shopLoginModel = ShopLoginModel.fromJson(response.data);
      if (shopLoginModel.data == null) {
        throw Exception(shopLoginModel.message);
      }

      CacheHelper.saveData(key: token, value: shopLoginModel.data!.token).then(
        (value) {
          getToken = CacheHelper.getDataString(key: token) ?? "";
        },
      );
      log(response.data.toString());
      emit(LoginSuccess(shopLoginModel: shopLoginModel));
    } on Exception catch (e) {
      log(e.toString());
      emit(LoginFailure(e.toString()));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  bool isVisible = true;
  IconData icon = Icons.visibility_off;
  void visible() {
    isVisible = !isVisible;
    icon = isVisible ? Icons.visibility_off : Icons.visibility;
    emit(LoginVisiblePassword());
  }

  @override
  void onChange(Change<LoginState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
