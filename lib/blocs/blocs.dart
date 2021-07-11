
import 'package:flutter/foundation.dart';
import 'package:posts_app/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:posts_app/models/postsapi.dart';
import 'package:posts_app/models/users.dart';
import 'package:posts_app/models/commetsmodel.dart';

class Blocss{
  final _repositoryposts = Repository();
  final _postsFetcher = PublishSubject<Postapimodels>();

  Stream <Postapimodels> get allPosts => _postsFetcher.stream;
  fetchallposts() async {
    Future<List<Postapimodels>> postapimodels = _repositoryposts.fetchallposts();

    _postsFetcher.sink;
  }
  final _repositoryusers = Repository();
  final _usersFetcher = PublishSubject<Usermodels>();

  Stream <Usermodels> get allUsers => _usersFetcher.stream;
  fetchallusers() async {
    Future<List<Usermodels>> usermodels = _repositoryusers.fetchallusers();

    _usersFetcher.sink;
  }
  final _repositorycommets = Repository();
  final _commetsFetcher = PublishSubject<Commentsmodel>();

  Stream <Commentsmodel> get allComments => _commetsFetcher.stream;
  fetchallcommets() async {
    Future<List<Commentsmodel>> commentsmodel = _repositorycommets.fetchallcommets();

    _commetsFetcher.sink;
  }
}
final postsbloc = Blocss();
final usersbloc = Blocss();
final commentsbloc = Blocss();