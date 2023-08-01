import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/src/features/user/data/model/user_model.dart';
import 'package:riverpod_demo/src/features/user/provider/user_provider.dart';

class UsersNotifier extends StateNotifier<List<UserModel>> {
  // Fetching all products whenever anyone starts listning.
  // Passing Ref, in order to access other providers inside this.
  UsersNotifier({required this.ref}) : super([]) {
    fetchUsers(ref: ref);
  }
  final Ref ref;

  Future fetchUsers({required Ref ref}) async {
    await ref
        .read(userRepositoryProvider)
        .fetchUser()
        .then((value) {
      state = value;
      ref.read(isLoadingUserProvider.notifier).state = false;
    });
  }

}