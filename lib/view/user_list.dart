import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_user.dart';

class UserList extends StatelessWidget {
  static const users = {...dummyUsers};

  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (ctx, i) => Text(users.values.elementAt(i).name),
      ),
    );
  }
}
