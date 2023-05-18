import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/controller/logic/user_cubits/user_state.dart';

import '../../../model/user_model.dart';
import '../../repositories/user_repository.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoadingState()) {
    fetchUser();
  }

  UserRepository userRepository = UserRepository();

  fetchUser() async {
    try {
      List<UserModel> users = await UserRepository.fetchUserDetails();
      emit(UserLoadedState(users));
    } on DioError catch (e) {
      emit(UserErrorState(e.message.toString()));
    }
  }
}
