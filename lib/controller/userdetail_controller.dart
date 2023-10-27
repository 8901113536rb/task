import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_project/constants/StringConstants.dart';
import 'package:task_project/model/Userdetail_model.dart';

import '../constants/Network.dart';
class Userdetail_controller extends GetxController{
  UserdetailModel? userdetailModel;
  RxBool responseresult=false.obs;

  Future<void> userdetail(String id) async {
    var jsonResponse = null;
    var response = await http.get(
      Uri.parse("${Network.baseurl}${Network.users}/$id"),
    );
    jsonResponse = json.decode(response.body);
    print("jsonResponse:-$jsonResponse");
    if (response.statusCode == 200) {
        userdetailModel = UserdetailModel.fromJson(jsonResponse);
        responseresult.value=true;
        update();
        refresh();
        // setState(() {
        //   _kGooglePlex = CameraPosition(
        //     target: LatLng(double.parse(userdetailspojo!.address!.geo!.lat.toString()), double.parse(userdetailspojo!.address!.geo!.lng.toString())),
        //     zoom: 14.4746,
        //   );
        // });
    } else {
      Get.snackbar(
         StringConstants.error,
        StringConstants.somethingwentwrong,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

}