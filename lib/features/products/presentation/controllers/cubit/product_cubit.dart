import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopapp/core/constants/end_point_const.dart';
import 'package:shopapp/core/services/api_services.dart';
import 'package:shopapp/features/Home/data/models/home_model/home_model.dart';
import 'package:shopapp/main.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  static ProductCubit get(context) => BlocProvider.of<ProductCubit>(context);
  HomeModel? homeModel;

  void gitHomeData() async {
    try {
      emit(ProductLoading());
      var response = await ApiServices.getData(url: home, token: getToken);
      homeModel = HomeModel.fromJson(response.data);

      homeModel!.data!.products!.forEach((element) {
        favorites.addAll({element.id!: element.inFavorites!});
      });
      emit(ProductSuccess(homeModel: homeModel!));
    } catch (e) {
      log(e.toString());
      emit(ProductFailure(e.toString()));
    }
  }

  void onChange(Change<ProductState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
