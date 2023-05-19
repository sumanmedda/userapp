import 'package:dio/dio.dart';
import 'package:userapp/controller/repositories/api/api.dart';
import 'package:userapp/model/user_model.dart';

class UserRepository {
  API api = API();

  Future<List<UserModel>> fetchUser() async {
    try {
      Response response = await api.sendReq
          .get('/users'); // response will store the data fetched from api
      List<dynamic> userMaps = response.data;

      return userMaps.map((userMap) => UserModel.fromJson(userMap)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
