import 'package:get_storage/get_storage.dart';
import '../../models/user_model.dart';

abstract class StorageHelper {
  static late GetStorage _storage;

  static init() async {
    await GetStorage.init();
    _storage = GetStorage();
    // _storage.remove('token');
  }

  static storeUser(UserModel user) async {
    await _storage.write('id', user.id);
    await _storage.write('userName', user.userName);
    await _storage.write('email', user.email);
    await _storage.write('phone', user.phone);
    await _storage.write('token', user.token);
  }

  static UserModel getUser() {
    return UserModel(
        userName: _storage.read('userName'),
        email: _storage.read('email'),
        phone: _storage.read('phone'));
  }

  static String? getUserToken() {
    return _storage.read('token');
  }
}
