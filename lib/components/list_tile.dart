import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';

class UserTile extends StatelessWidget {
  UserTile(this.user, {Key? key}) : super(key: key);
  User user;

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarURL.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatarURL),
          );
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                color: Color.fromARGB(255, 44, 35, 35)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
                color: Colors.red),
          ],
        ),
      ),
    );
  }
}
