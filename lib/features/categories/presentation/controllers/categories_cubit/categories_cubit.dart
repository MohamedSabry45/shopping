import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopapp/core/constants/end_point_const.dart';
import 'package:shopapp/core/services/api_services.dart';
import 'package:shopapp/features/categories/data/models/categories_model/categories_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  void getCategories() async {
    try {
      emit(CategoriesLoading());
      var response =
          await ApiServices.getData(url: categoriesEndPoint, token: getToken);
      final CategoriesModel categoriesModel =
          CategoriesModel.fromJson(response.data);
      emit(CategoriesSuccess(categoriesModel: categoriesModel));
    } catch (e) {
      emit(CategoriesFailure(e.toString()));
    }
  }
}
