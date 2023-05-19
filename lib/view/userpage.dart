import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/controller/logic/user_cubits/user_cubits.dart';
import 'package:userapp/controller/logic/user_cubits/user_state.dart';

import '../controller/const.dart';
import '../controller/logic/internet_cubits/internet_cubits.dart';
import '../controller/logic/internet_cubits/internet_state.dart';

class Userpage extends StatelessWidget {
  const Userpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: whiteColor,
        centerTitle: true,
        title: const Text('Users'),
      ),
      body: SafeArea(
        child: BlocBuilder<InternetCubit, InternetState>(
          builder: (context, internetState) =>
              BlocBuilder<UserCubit, UserState>(builder: (context, userState) {
            // When internet is connected
            if (internetState is InternetGainedState) {
              // data is loading from api
              if (userState is UserLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              // data is loaded
              if (userState is UserLoadedState) {
                return userListView(userState);
              }

              if (userState is UserErrorState) {
                return Center(
                  child: Text(userState.error),
                );
              }
            }
            // When internet is not connected
            if (internetState is InternetLostState) {
              return const Center(
                child: Text('Internet Not Connected'),
              );
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
