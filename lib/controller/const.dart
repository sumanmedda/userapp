import 'package:flutter/material.dart';
import 'package:userapp/view/user_details.dart';

// to go to next page
nextPage(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

// to go to previous page
backPage(context) {
  Navigator.pop(context);
}

// colors
var whiteColor = const Color(0xFFEFEEEE);

// list view method to show user details
ListView userListView(state) {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemCount: state.users.length,
    itemBuilder: (context, index) {
      var path = state.users[index];
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black.withOpacity(0.1)),
          ),
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(
                Icons.people,
                size: 20,
              ),
            ),
            trailing: const Icon(
              Icons.navigate_next_sharp,
              size: 25,
            ),
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
            title: Text(
              path.name!,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      );
    },
  );
}
