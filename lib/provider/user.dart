import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_user.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:provider/provider.dart';

class UserProvider with ChangeNotifier {
  final Map<String, User> _item = {...dummyUsers};

  List<User> get all {
    return [..._item.values];
  }

  int get count {
    return _item.length;
  }

  User byIndex(int i) {
    return _item.values.elementAt(i);
  }

  void put(User user) {
    //alterar
      if ( user.id.trim().isNotEmpty &&
          _item.containsKey(user.id)) {
        _item.update(
          user.id,
          (_) => User(
              id: user.id,
              name: user.name,
              email: user.email,
              avatarURL: user.avatarURL),
        );
      }else{
      final id = Random().nextDouble().toString();
      //add items
      _item.putIfAbsent(
        id,
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          avatarURL: user.avatarURL,
        ),
      );
    }
      notifyListeners();
  }

  void remover(User user) {
    _item.remove(user.id);
    notifyListeners();
  }
}
