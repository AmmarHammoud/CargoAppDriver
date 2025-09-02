import 'package:cargo_app_driver/shared/constants/constants.dart';
import 'package:dio/dio.dart';
import 'end_points.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: '${Constants.baseUrl}/api',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> login({
    required String email,
    required String password,
  }) async {
    return await dio.post(
      Endpoints.loginEndpoints,
      data: {
        'email': email,
        'password': password,
      },
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> signUp({
    required String email,
    required String password,
    required String phone,
  }) async {
    return await dio.post(Endpoints.signUpEndpoints,
        data: {
          'email': email,
          'mobile': phone,
          'password': password,
        },
        options: Options(
            headers: {'Accept': 'application/json'},
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
  }

  static Future<Response> logout() async {
    return await dio.get('logout',
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
  }

  static Future<Response> getAnnouncements() async {
    return await dio.get(
      Endpoints.announcement,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> getProduct() async {
    return await dio.get(
      Endpoints.getProducts,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> getOffers({
    required String token,
  }) async {
    return await dio.get(
      Endpoints.getOffers,
      queryParameters: {'status': 'pending'},
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> acceptOrRejectShipment({
    required int id,
    required String token,
    required bool isAccepted,
  }) async {
    return await dio.post(
      '${Endpoints.getOffers}/$id/${isAccepted ? 'accept' : 'reject'}',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> getAcceptedShipments({
    required String token,
  }) async {
    return await dio.get(
      Endpoints.getOffers,
      queryParameters: {'status': 'accepted'},
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> confirmPickup({
    required String token,
    required String barcode,
  }) async {
    return await dio.post(
      '${Endpoints.shipments}/$barcode/confirm-pickup',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> handOverToCenter({
    required String token,
    required String id,
  }) async {
    return await dio.post(
      '${Endpoints.shipments}/$id/hand-over-to-center',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }
}
