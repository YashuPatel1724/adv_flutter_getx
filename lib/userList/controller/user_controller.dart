import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modal/user_modal.dart';

class UserController extends GetxController
{
  RxList<UserModal> userList = <UserModal>[].obs;
  TextEditingController txtid = TextEditingController();
  TextEditingController txtname = TextEditingController();
  TextEditingController txtwork = TextEditingController();

  void addData(Map user)
  {
    userList.add(UserModal.fromMap(user));
  }
  void updateData(int index)
  {
    txtid=TextEditingController(text: userList[index].id.toString());
    txtname=TextEditingController(text: userList[index].name.toString());
    txtwork=TextEditingController(text: userList[index].work.toString());
  }

  void saveData(int index)
  {
    userList[index].id = int.parse(txtid.text);
    userList[index].name = txtname.text;
    userList[index].work = txtwork.text;
    userList.refresh();
  }

  void deleteData(int index)
  {
    userList.removeAt(index);
  }
}