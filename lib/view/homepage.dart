import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/controller/logic/user_cubits/user_cubits.dart';
import 'package:userapp/controller/logic/user_cubits/user_state.dart';

import '../controller/const.dart';
import '../controller/logic/internet_cubits/internet_cubits.dart';
import '../controller/logic/internet_cubits/internet_state.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<InternetCubit, InternetState>(
          builder: (context, internetState) =>
              BlocBuilder<UserCubit, UserState>(builder: (context, userState) {
            // When data is loading
            if (userState is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // When data is loaded
            if (userState is UserLoadedState) {
              return userListView(userState);
            }
            // When There is no internet occours
            if (userState is UserErrorState) {
              // When internet is not connected
              if (internetState is InternetLostState) {
                return const Center(
                  child: Text('Internet is not Connected'),
                );
              }
              // When internet is connected
              if (internetState is InternetGainedState) {
                return userListView(internetState);
              }
            }

            // If Something went Wrong / No Data
            return const Center(
              child: Text('No Data Found'),
            );
          }),
        ),
      ),
    );
  }
}
