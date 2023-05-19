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
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      const CircleAvatar(
                        minRadius: 60,
                        child: Icon(
                          Icons.people,
                          size: 50,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
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
                    height: 35,
                  ),
                  const SizedBox(width: 320, child: Divider()),
                  const SizedBox(
                    height: 35,
                  ),
                  Expanded(
                    child: Material(
                      borderRadius: BorderRadius.circular(12),
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            UserDetailListTile(
                              type: 'Name',
                              email: name,
                              icon: Icons.person,
                            ),
                            UserDetailListTile(
                              type: 'Username',
                              email: username,
                              icon: Icons.contacts_rounded,
                            ),
                            UserDetailListTile(
                              type: 'Email',
                              email: email,
                              icon: Icons.email,
                            ),
                            UserDetailListTile(
                              type: 'Phone',
                              email: phone,
                              icon: Icons.phone,
                            ),
                          ],
                        ),
                      ),
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

class UserDetailListTile extends StatelessWidget {
  const UserDetailListTile({
    super.key,
    required this.email,
    required this.type,
    required this.icon,
  });

  final String email;
  final String type;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          child: Icon(
            icon,
            size: 20,
          ),
        ),
        title: Text('$type : $email'));
  }
}
