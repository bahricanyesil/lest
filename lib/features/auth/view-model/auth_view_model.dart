import 'package:animated_login/animated_login.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:lest/core/dialog/dialog_builder.dart';
import 'package:lest/core/extensions/iterable_extensions.dart';
import 'package:lest/core/extensions/string_extensions.dart';
import 'package:lest/core/managers/local_storage_manager.dart';
import 'package:lest/product/constants/local_storage_keys.dart';
import 'package:lest/product/constants/navigation_types.dart';
import 'package:lest/product/models/user_model.dart';

class AuthViewModel extends ChangeNotifier {
  final List<User> _users = User.dummyList;

  CancelableOperation<String?>? _operation;

  List<User> get users => _users;

  Future<String?> operationWrapper(
    BuildContext context,
    Future<String?> Function() func,
  ) async {
    await _operation?.cancel();
    _operation = CancelableOperation<String?>.fromFuture(func());
    final res = await _operation?.valueOrCancellation();
    if (_operation?.isCompleted ?? false) {
      if (res == null) {
        await LocalStorage().setValue<String>(
          LocalStorageKeys.signInDate,
          DateTime.now().toIso8601String(),
        );
        if (context.mounted) NavigationTypes.home.go(context);
      } else {
        if (context.mounted) await DialogBuilder(context).showResultDialog(res);
      }
    }
    return res;
  }

  Future<String?> signUp(SignUpData data) async {
    if (data.password != data.confirmPassword) {
      return 'The passwords you entered do not match, check again.';
    }
    await Future<void>.delayed(const Duration(seconds: 1));
    if (_users.exist((User u) => u.email.uncaseEqual(data.email))) {
      return 'Email already exists';
    }
    final newUser =
        User(name: data.name, email: data.email, password: data.password);
    _users.add(newUser);
    notifyListeners();
    return null;
  }

  Future<String?> login(LoginData data) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final signedUser =
        _users.findFirst((User u) => u.email.uncaseEqual(data.email));
    if (signedUser == null) {
      return 'There is no user with the given email.';
    } else if (signedUser.password != data.password) {
      return 'The password you entered is not correct';
    }
    return null;
  }
}
