import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/logic/internet_cubits/internet_cubits.dart';
import '../controller/logic/internet_cubits/internet_state.dart';

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
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        minRadius: 50,
                        child: Icon(
                          Icons.people,
                          size: 45,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        '@$username',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.white10,
                          offset: Offset(-6.0, -6.0),
                          blurRadius: 16.0,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(6.0, 6.0),
                          blurRadius: 16.0,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                            trailing: const Icon(Icons.email),
                            title: Text(email)),
                        ListTile(
                            trailing: const Icon(Icons.phone),
                            title: Text(phone)),
                      ],
                    ),
                  ),
                ],
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
