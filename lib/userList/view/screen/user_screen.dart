import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/userList/modal/user_modal.dart';
import 'package:getx/userList/utils/global.dart';

import '../componets/edit_button.dart';
import '../componets/floating_button.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(fontSize: 23),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(
                '${userController.userList[index].name}',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('${userController.userList[index].work}'),
              leading: Text(
                '${userController.userList[index].id}',
                style: TextStyle(fontSize: 20),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  editButton(index, context),
                  IconButton(
                      onPressed: () {
                        userController.deleteData(index);
                      },
                      icon: Icon(Icons.delete)),
                ],
              ),
            ),
          ),
          itemCount: userController.userList.length,
        ),
      ),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }


}
