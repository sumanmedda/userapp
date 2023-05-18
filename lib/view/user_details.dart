import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/logic/internet_cubits/internet_cubits.dart';
import '../controller/logic/internet_cubits/internet_state.dart';
import '../controller/widgets/custom_textbox.dart';

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
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.8),
                        offset: const Offset(-6.0, -6.0),
                        blurRadius: 16.0,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(6.0, 6.0),
                        blurRadius: 16.0,
                      ),
                    ],
                    color: const Color(0xFFEFEEEE),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextBox(title: 'Name', value: name),
                        CustomTextBox(title: 'Username', value: username),
                        CustomTextBox(title: 'Email', value: email),
                        CustomTextBox(title: 'Phone', value: phone),
                      ],
                    ),
                  ),
                ),
              ),
            );
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
