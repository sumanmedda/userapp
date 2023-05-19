import 'package:flutter/material.dart';
import 'package:userapp/controller/widgets/user_detailstile.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({
    super.key,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
  });

  final String name;
  final String username;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    // userdetails page ui
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    // resueable widgets from user_detailstiel.dart page
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
}
