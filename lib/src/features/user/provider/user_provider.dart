import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/src/core/provider.dart';
import 'package:riverpod_demo/src/features/user/data/api/user_api.dart';
import 'package:riverpod_demo/src/features/user/data/model/user_model.dart';
import 'package:riverpod_demo/src/features/user/data/model/user_state.dart';
import 'package:riverpod_demo/src/features/user/data/repository/user_repository.dart';
import 'package:riverpod_demo/src/features/user/provider/user_state_provider.dart';

final userApiProvider = Provider<UserApi>((ref) {
  return UserApi(ref.read(dioClientProvider));
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref.read(userApiProvider));
});

final userProvider =
    StateNotifierProvider<UsersNotifier, List<UserModel>>((ref) {
  return UsersNotifier(ref: ref);
});

final isLoadingUserProvider = StateProvider<bool>((ref) {
  return true;
});
