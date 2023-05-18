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
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.circular(12)),
          child: ListTile(
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
          ),
        ),
      );
    },
  );
}
