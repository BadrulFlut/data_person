import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:list_person_app/state_util.dart';
import '../view/home_view.dart';

class HomeController extends State<HomeView> implements MvcController {
  static late HomeController instance;
  late HomeView view;

  @override
  void initState() {
    instance = this;
    getUser();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  // {
  //   "id": 1,
  //   "name": "Leanne Graham",
  //   "username": "Bret",
  //   "email": "Sincere@april.biz",
  //   "address": {
  //     "street": "Kulas Light",
  //     "suite": "Apt. 556",
  //     "city": "Gwenborough",
  //     "zipcode": "92998-3874",
  //     "geo": {
  //       "lat": "-37.3159",
  //       "lng": "81.1496"
  //     }
  //   },
  //   "phone": "1-770-736-8031 x56442",
  //   "website": "hildegard.org",
  //   "company": {
  //     "name": "Romaguera-Crona",
  //     "catchPhrase": "Multi-layered client-server neural-net",
  //     "bs": "harness real-time e-markets"
  //   }
  // },

  List<Map<String, dynamic>> users = [];

  getUser() async {
    var response = await Dio().get(
      "https://jsonplaceholder.typicode.com/users",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    List<dynamic> result = response.data;
    users = List<Map<String, dynamic>>.from(result);
    print(users);
    setState(() {});
  }
}
