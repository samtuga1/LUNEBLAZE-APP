import 'dart:async';
import 'package:chopper/chopper.dart';

part 'api_services.chopper.dart';

@ChopperApi(baseUrl: '/app')
abstract class api_services extends ChopperService {
  @Post(path: 'profile.json')
  Future<Response> postPrivacyData(
    @Body() Map<String, String> body,
  );

  static api_services create() {
    final client = ChopperClient(
      baseUrl: 'http://luneblaze.com/new/Luneblaze-API/api',
      services: [
        _$api_services(),
      ],
      converter: JsonConverter(),
    );
    return _$api_services(client);
  }
}
