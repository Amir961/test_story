import 'package:test_story/api/base_provider.dart';
import 'package:test_story/models/models.dart';
import 'package:get/get.dart';

class ApiProvider extends BaseProvider {

  Future<Response> register(String path, RegisterRequest data) {
    return post(path, data.toJson());
  }


}
