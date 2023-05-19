import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/logic/internet_cubits/internet_cubits.dart';
import '../controller/logic/internet_cubits/internet_state.dart';
import '../controller/widgets/user_details_list.dart';

class UserDetails extends StatelessWidget {
  final String name;
  final String username;
  final String email;
  final String phone;
  const UserDetails({
    super.key,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('User Details'),
      ),
      body: SafeArea(
        child: BlocBuilder<InternetCubit, InternetState>(
            builder: (context, internetState) {
          // When internet is not connected
          if (internetState is InternetLostState) {
            return const Center(
              child: Text('No Internet Connected'),
            );
          }
          // when intenet is connected
          if (internetState is InternetGainedState) {
            // when intenet is connected
            return UserDetailsWidget(
                name: name, username: username, email: email, phone: phone);
          }
          // If Something went Wrong / No Data
          return const Center(
            child: Text('No Data Found'),
          );
        }),
      ),
    );
  }
}
