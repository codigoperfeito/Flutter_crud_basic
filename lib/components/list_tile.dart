import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/user.dart';
import 'package:provider/provider.dart';

import '../routes/app_routes.dart';

// ignore: must_be_immutable
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
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.userForm,
                    arguments: user,
                  );
                },
                icon: const Icon(Icons.edit),
                color: const Color.fromARGB(255, 44, 35, 35)),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('você deseja excluir?'),
                      content: const Text('Os dados serão excluidos tem certeza?'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Provider.of<UserProvider>(context, listen: false)
                                .remover(user);
                                Navigator.of(context).pop();
                          },
                          child: const Text('SIM'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Não'),
                        )
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
                color: Colors.red),
          ],
        ),
      ),
    );
  }
}
