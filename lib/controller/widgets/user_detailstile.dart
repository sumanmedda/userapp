import 'package:flutter/material.dart';

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
