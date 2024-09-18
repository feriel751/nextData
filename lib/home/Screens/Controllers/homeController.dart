// get a list of users
// get user by id
// in case of error go to the error page
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:get/get.dart';

import '../Model/posts.dart';
import '../Model/users.dart';

class HomeController extends GetxController {
  Future<List<Users>> getUsersList() async {
    final responseUrl =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (responseUrl.statusCode == 200) {
      var jsonres = json.decode(responseUrl.body);
      List<Users> users = [];
      Posts? post = Posts(id: 0, userId: 0, body: '', title: '');
      for (var user in jsonres) {
        Users u = Users(
          id: user['id'],
          name: user['name'],
          username: user['username'],
          email: user['email'],
          phone: user['phone'],
          website: user['website'],
        );

        u.post = await getUserById(u.id);
        users.add(u);
      }

      return users;
    } else {
      Get.snackbar('we have probleme , we can t fetch the data ', 'Faild');
      throw Exception('failed to get all the posts ');
    }
  }

  Future<Posts?> getUserById(int id) async {
    final responseUrl = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));
    if (responseUrl.statusCode == 200) {
      var jsonres = json.decode(responseUrl.body);
      Posts posts = Posts(
          id: jsonres["id"],
          userId: jsonres["userId"],
          title: jsonres["title"],
          body: jsonres["body"]);

      return posts;
    } else {
      Get.snackbar('we have probleme , we can t fetch the data ', 'Faild');
      throw Exception('failed to get  the posts ');
    }
  }
}
