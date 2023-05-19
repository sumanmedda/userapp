import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/user_model.dart';
import '../../repositories/user_repository.dart';
import 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity =
      Connectivity(); //it is used to check network connectivity
  StreamSubscription? connectivitySubscription;
  UserRepository userRepository =
      UserRepository(); // used to get fetchUser function from user repository

  InternetCubit() : super(InternetLoadingState()) {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) async {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        List<UserModel> users = await userRepository.fetchUser();
        emit(InternetGainedState(
            users)); // if internet is connected then InternetGainedState will be emited
      } else {
        emit(InternetLostState(
            'Not Connected To Internet')); // if internet is not connected then InternetLostState will be emited
      }
    });
  }

  // after connectivity close function is used to cancel the connectivitySubscription
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
