import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:posts_app/blocs/blocs.dart';
import 'package:posts_app/models/commetsmodel.dart';
import 'package:posts_app/models/postsapi.dart';
import 'package:http/http.dart' as http;
import 'package:posts_app/models/users.dart';


class postsScreen extends StatefulWidget {
  @override
  BulletinState createState() => BulletinState();
}

class BulletinState extends State<postsScreen> {
  Future <List<Postapimodels>> futureData;
  Future <List<Usermodels>> futureuser;
  Future <List<Commentsmodel>> futurecommets;
  @override
  void initState() {
    super.initState();
    futureData = fetchPost();
    futureuser = fetchuser();
    futurecommets = fetchcommets();
  }

  Future<List<Postapimodels>> fetchPost() async {
    final String apiUrl = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => new Postapimodels.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
  Future<List<Usermodels>> fetchuser() async {
    final String apiUrl = "https://jsonplaceholder.typicode.com/users";
    final response = await http.get(apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => new Usermodels.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
  Future<List<Commentsmodel>> fetchcommets() async {
    final String apiUrl = "https://jsonplaceholder.typicode.com/posts/1/comments";
    final response = await http.get(apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => new Commentsmodel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
  @override
  Widget build(BuildContext context) {
    postsbloc.fetchallposts();
    usersbloc.fetchallusers();
    commentsbloc.fetchallcommets();
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Color(0xFF6A1B9A),
          iconTheme: IconThemeData(color: Colors.white),
          title: new Text(
            "Posts",
            style: TextStyle(
                fontFamily: "MongolianBaiti",
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5),
          ),
        ),
      body: Center(
        child: Stack (children:[Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children:[Padding(padding: EdgeInsets.only( left: 14),child:Text("Users")),
          Text("Posts"), Text("Commets")]),
          Padding(padding: EdgeInsets.only(top: 28),
          child:Row(children:[Expanded(child:FutureBuilder <List<Usermodels>>(
          future: futureuser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Usermodels> data = snapshot.data;
              return
                ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return  Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                          children: [
                            Container(
                                decoration:BoxDecoration(border: Border.all(color: Colors.purple),borderRadius: BorderRadius.all(Radius.circular(100))),
                                child: data[index].name!=null?Text(data[index].name[0].toString(), style: TextStyle(fontSize: 28),):Icon(Icons.person_rounded))
                          ]);

                    }
                );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return CircularProgressIndicator();
          },
        )),Expanded(child:FutureBuilder <List<Postapimodels>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Postapimodels> data = snapshot.data;
              return
                ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.white,
                        child: Center(child:  Container(child:Row(children:[ Container(child:Text(data[index].id.toString())),
                          Card(child:Padding(padding:EdgeInsets.only(),
                          child:Container(width:100,child:Text(data[index].body))))]),

                       ),

                        ),);
                    }
                );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return CircularProgressIndicator();
          },
        )),
          Expanded(child:FutureBuilder <List<Commentsmodel>>(
            future: futurecommets,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Commentsmodel> data = snapshot.data;
                int len = data.length;
                return
                  ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {

                        return Container(
                          // height: 75,
                          color: Colors.white,
                          child: Center(child: Container(child:Card(child: Padding(padding:EdgeInsets.only(),
                              child:Container(width:350,child:Text(data.length.toString()))))),
                          ),);
                      });

              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return CircularProgressIndicator();
            },
          )),
          ]))]),

      ),

    );}
}