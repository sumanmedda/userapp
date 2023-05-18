import 'package:flutter/material.dart';
import 'package:userapp/view/user_details.dart';

nextPage(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

backPage(context) {
  Navigator.pop(context);
}

ListView userListView(state) {
  return ListView.builder(
    itemCount: state.users.length,
    itemBuilder: (context, index) {
      var path = state.users[index];
      return ListTile(
        onTap: () {
          nextPage(
              context,
              UserDetails(
                name: path.name!,
                username: path.username!,
                email: path.email!,
                phone: path.phone!,
              ));
        },
        title: Text(path.name!),
      );
    },
  );
}
