import 'package:epg_viewer/utils/app_constant.dart';
import 'package:epg_viewer/utils/core.dart';
import 'package:flutter/material.dart';

class ApiServices {
  final Dio dio;

  ApiServices({required this.dio});

  Future<Response?> getXMLFileRequest() async {
    debugPrint(
        "==================== Get XML File Api Call====================");
    Response response;

    try {
      response = await dio.get(AppConstant.apiUrl);
      debugPrint("Get XML File code => ${response.statusCode}");
      // debugPrint("Get XML File data => ${response.data}");
      return response;
    } on DioException catch (error) {
      debugPrint("ERROR MESSAGE: ${error.message}");
      debugPrint("ERROR RESPONSE: ${error.response}");
      return error.response;
    }
  }
}
