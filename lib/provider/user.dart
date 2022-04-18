import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_user.dart';
import 'package:flutter_crud/models/user.dart';

class UserProvider with ChangeNotifier {
  final Map<String, User> _item = {...dummyUsers};

  List<User> get all {
    return [..._item.values];
  }

  int get count {
    return _item.length;
  }
}
