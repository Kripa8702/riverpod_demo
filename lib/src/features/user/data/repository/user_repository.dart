import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:riverpod_demo/src/core/network/dio_exceptions.dart';
import 'package:riverpod_demo/src/features/user/data/api/user_api.dart';
import 'package:riverpod_demo/src/features/user/data/model/user_model.dart';

class UserRepository{
  final UserApi _userApi;

  UserRepository(this._userApi);

  Future<List<UserModel>> fetchUser() async {
    try {
      final res = await _userApi.fetchUserApiRequest();
      final userModelList =
      (res['results'] as List).map((e) => UserModel.fromJson(e)).toList();
      return userModelList;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

}