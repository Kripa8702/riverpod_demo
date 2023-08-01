import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_demo/src/features/user/data/model/user_model.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  factory UserState({
    @Default(UserModel()) UserModel userModel,
    @Default(true) bool isLoading,
  }) = _UserState;
}