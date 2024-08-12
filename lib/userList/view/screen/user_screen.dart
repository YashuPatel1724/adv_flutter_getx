import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/userList/modal/user_modal.dart';
import 'package:getx/userList/utils/global.dart';

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
                  IconButton(
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
                      icon: Icon(Icons.edit)),
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
      floatingActionButton: FloatingActionButton(
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
                    UserModal user = UserModal(
                        int.parse(userController.txtid.text),
                        userController.txtname.text,
                        userController.txtwork.text);
                    userController.addData(user);
                  },
                  child: Text('Save'),
                )
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
