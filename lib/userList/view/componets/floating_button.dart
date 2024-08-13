import 'package:flutter/material.dart';

import '../../modal/user_modal.dart';
import '../../utils/global.dart';

FloatingActionButton buildFloatingActionButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Add User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: userController.txtid,
                decoration: InputDecoration(hintText: 'Enter your id'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: userController.txtname,
                decoration: InputDecoration(hintText: 'Enter your name'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: userController.txtwork,
                decoration: InputDecoration(hintText: 'Enter your work'),
              ),
            ],
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancle'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                Map user = {
                    'id' : int.parse(userController.txtid.text),
                   'name': userController.txtname.text,
                    'work' : userController.txtwork.text};
                userController.addData(user);
                userController.txtid.clear();
                userController.txtname.clear();
                userController.txtwork.clear();
              },
              child: Text('Save'),
            )
          ],
        ),
      );
    },
    child: Icon(Icons.add),
  );
}