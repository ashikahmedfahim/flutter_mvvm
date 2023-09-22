abstract class BaseApiService {
  Future<dynamic> getGetApiRequest(String url);
  Future<dynamic> getPostApiRequest(String url, dynamic data);
  Future<dynamic> getPutApiRequest(String url, dynamic data);
  Future<dynamic> getDeleteApiRequest(String url);
}
