import 'package:flutter/material.dart';
import 'package:flutter_log_reg/controllers/user_controller.dart';
import 'package:flutter_log_reg/models/user_model.dart';
import 'package:get/get.dart';
import '../controllers/auth_controllers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              controller.logout();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: GetBuilder<UserController>(
            init: UserController(),
            builder: (user) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Home Screen',
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      controller.logout();
                    },
                    child: const Text(
                      'Logout User',
                    ),
                  ),
                  FutureBuilder<List<Users>>(
                    future: user.fetchUsers(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final item = snapshot.data![index];
                            return ListTile(
                              title: Text(item.totalPages.toString()),
                            );
                          },
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              );
            }),
      ),
    );
  }
}
