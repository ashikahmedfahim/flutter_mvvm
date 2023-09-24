import 'package:flutter_mvvm/data/network/BaseApiService.dart';
import 'package:flutter_mvvm/data/network/NetworkApiService.dart';
import 'package:flutter_mvvm/res/app_url.dart';

class AuthRepository {
  BaseApiService _baseApiService = NetworkApiService();

  Future<dynamic> login(dynamic data) async {
    try {
      final response = await _baseApiService.getPostApiRequest(
          AppEndPoint.loginEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> register(dynamic data) async {
    try {
      final response = await _baseApiService.getPostApiRequest(
          AppEndPoint.registerEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
