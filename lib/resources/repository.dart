import 'dart:async';
import 'posts_api_provider.dart';
import 'users_provider.dart';
import 'commets_api_provider.dart';
import 'package:posts_app/models/postsapi.dart';
import 'package:posts_app/models/users.dart';
import 'package:posts_app/models/commetsmodel.dart';

class Repository{
  final postsApiProvider = PostsApiProvider();
  Future <List<Postapimodels>> fetchallposts() => postsApiProvider.fetchPost();
  final usersProvider = UsersProvider();
  Future <List<Usermodels>> fetchallusers() => usersProvider.fetchuser();
  final commetsApiProvider = CommetsApiProvider();
  Future <List<Commentsmodel>> fetchallcommets() => commetsApiProvider.fetchcommets();
}