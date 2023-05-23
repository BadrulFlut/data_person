import 'package:flutter/material.dart';
import 'package:list_person_app/core.dart';
import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Data Person"),
        ),
        body: controller.users.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 20),
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  final data = controller.users[index];
                  return Card(
                    child: ListTile(
                      leading: Container(
                        width: 70,
                        height: 70,
                        alignment: Alignment.center,
                        child: Text(
                          data['id'].toString(),
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      title: Text(data['name']),
                      subtitle: Text(data['email']),
                    ),
                  );
                },
              ));
  }

  @override
  State<HomeView> createState() => HomeController();
}
