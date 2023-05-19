import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/controller/logic/user_cubits/user_state.dart';
import '../../../model/user_model.dart';
import '../../repositories/user_repository.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoadingState()) {
    fetchUser();
  }

  UserRepository userRepository =
      UserRepository(); // used to get fetchUser function from user repository

  fetchUser() async {
    try {
      List<UserModel> users = await userRepository.fetchUser();
      emit(UserLoadedState(
          users)); // when app is loaded user data is sent to UserLoadedState
    } on DioError catch (e) {
      emit(UserErrorState(e.message
          .toString())); // if something wrong happens this will print out the issue
    }
  }
}
