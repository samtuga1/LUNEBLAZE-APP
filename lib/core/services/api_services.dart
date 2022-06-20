import 'dart:async';
import 'package:chopper/chopper.dart';

part 'api_services.chopper.dart';

@ChopperApi(baseUrl: '/app')
abstract class api_services extends ChopperService {
  @Post(path: 'profile.json')
  Future<Response> postPrivacyData(
    @Body() Map<String, dynamic> body,
  );
  @Post(path: 'getMyVenueOrganization.json')
  Future<Response> postOrganizationsVenuesData(
    @Body() Map<String, dynamic> body,
  );
  @Post(path: 'settings.json')
  Future<Response> postReportsAndContactUsData(
    @Body() Map<String, dynamic> body,
  );
  @Post(path: 'insertUserEduInfo.json')
  Future<Response> postgetNotifiedData(
    @Body() Map<String, dynamic> body,
  );
  @Post(path: 'addVenue.json')
  Future<Response> postInstitutionData(
    @Body() Map<String, dynamic> body,
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
