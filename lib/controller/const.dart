import 'package:flutter/material.dart';
import 'package:userapp/view/user_details.dart';

nextPage(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

backPage(context) {
  Navigator.pop(context);
}

var whiteColor = const Color(0xFFEFEEEE);
ListView userListView(state) {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemCount: state.users.length,
    itemBuilder: (context, index) {
      var path = state.users[index];
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
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
            color: whiteColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
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
