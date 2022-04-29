import 'package:flutter/material.dart';
import 'package:flutter_crud/components/list_tile.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/user.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProvider users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
        actions: [
          IconButton(
            onPressed: () {
              users.put(
                const User(
                    id: '2',
                    name: 'jonas',
                    email: 'jonas@gm.net',
                    avatarURL: ''),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
