import 'package:flutter/material.dart';

import '../../utils/global.dart';

IconButton editButton(int index, BuildContext context) {
  return IconButton(
      onPressed: () {
        userController.updateData(index);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Update User'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: userController.txtid,
                  decoration: InputDecoration(
                      hintText: 'Enter your id'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: userController.txtname,
                  decoration: InputDecoration(
                      hintText: 'Enter your name'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: userController.txtwork,
                  decoration: InputDecoration(
                      hintText: 'Enter your work'),
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
                  userController.saveData(index);
                },
                child: Text('Save'),
              )
            ],
          ),
        );

      },
      icon: Icon(Icons.edit));
}