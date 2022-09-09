// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:appening/models/user.dart';

class AllUserScreen extends StatelessWidget {
  const AllUserScreen({
    Key? key,
    required this.users,
  }) : super(key: key);
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All user"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              foregroundImage: NetworkImage(user.avatar),
            ),
            title: Text("${user.fname} ${user.lname}"),
            subtitle: Text(user.email),
          );
        },
        itemCount: users.length,
      ),
    );
  }
}
