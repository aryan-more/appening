import 'dart:convert';

import 'package:appening/models/user.dart';
import 'package:appening/screen/alluser/alluser.dart';
import 'package:appening/utils/domain.dart';
import 'package:appening/widget/loading.dart';
import 'package:appening/widget/snackbar/bars.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

mixin UserInfoScreenMixin {
  final TextEditingController name = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onSubmit() async {
    if (!formKey.currentState!.validate()) {
      return errorSnackBar(title: "Error", error: "Please submit all details");
    }

    bool loadingDialog = false;
    try {
      Get.dialog(Loading(), barrierDismissible: false);
      loadingDialog = true;
      http.Response res = await http.post(Uri.parse("$domain/api/users"), body: {"name": name.text, "job": jobController.text});
      if (res.statusCode != 201) {
        throw Exception("Failed to create account");
      }

      res = await http.get(Uri.parse("$domain/api/users?page=2"));
      if (res.statusCode != 200) {
        throw Exception("Failed to get all user info");
      }

      Map body = jsonDecode(res.body);
      List<User> users = [];

      for (var userMap in body["data"]) {
        users.add(User.fromMap(userMap));
      }

      Get.back();
      loadingDialog = false;
      Get.to(() => AllUserScreen(users: users));
    } catch (e) {
      if (loadingDialog) {
        Get.back();
      }
      errorSnackBar(title: "", error: e.toString());
    }
  }

  String? emptyValidator(String field, String? text) {
    if (text == null || text.isEmpty) {
      return "$field cannot be empty";
    }
    return null;
  }
}
