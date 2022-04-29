import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de usuarios'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
