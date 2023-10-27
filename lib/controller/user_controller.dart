import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_project/constants/Network.dart';
import '../model/Userdatalist_model.dart';

class Usercontroller extends GetxController{


  Future<List<UserdatalistModel>> getuserlist() async {
    var response = await http.get(
      Uri.parse(Network.baseurl+Network.users),
    );
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => UserdatalistModel.fromJson(job)).toList();
  }
}