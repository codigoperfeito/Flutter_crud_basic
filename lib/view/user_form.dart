import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/user.dart';
import 'package:provider/provider.dart';

import '../data/dummy_user.dart';

class UserForm extends StatelessWidget {
  UserForm({Key? key}) : super(key: key);

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  final Map<String, User> _item = {...dummyUsers};

  void _loadFormData(User user) {
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarURL;
  }

  @override
  Widget build(BuildContext context) {
    String id = '';
    if (ModalRoute.of(context)?.settings.arguments.runtimeType == User) {
      final user = ModalRoute.of(context)?.settings.arguments as User;
      _loadFormData(user);
      id = user.id;
    } else {
      id = (_item.length + 1).toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de usuarios'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final isValidat = _form.currentState!.validate();
              if (isValidat) {
                _form.currentState!.save();
                Provider.of<UserProvider>(context, listen: false).put(
                  User(
                    id: _formData['id'] = id,
                    name: _formData['name']!,
                    email: _formData['email']!,
                    avatarURL: _formData['avatarUrl']!,
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.save),
            color: Colors.green,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(children: <Widget>[
            TextFormField(
              initialValue: _formData['name'],
              decoration: const InputDecoration(labelText: 'Nome'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Nome invalido';
                }
                if (value.trim().length < 3) {
                  return 'Nome precisa ter mais de 3 caracteres';
                }
                return null;
              },
              onSaved: (value) => _formData['name'] = value.toString(),
            ),
            TextFormField(
              initialValue: _formData['email'],
              decoration: const InputDecoration(labelText: 'E-mail'),
              onSaved: (value) => _formData['email'] = value.toString(),
            ),
            TextFormField(
              initialValue: _formData['avatarUrl'],
              decoration: const InputDecoration(labelText: 'Avatar URL'),
              onSaved: (value) => _formData['avatarUrl'] = value.toString(),
            )
          ]),
        ),
      ),
    );
  }
}
