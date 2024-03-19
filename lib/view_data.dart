import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class view_data extends StatefulWidget {
  const view_data({super.key});

  @override
  State<view_data> createState() => _view_dataState();
}

class _view_dataState extends State<view_data> {

  List userdata = [];

  Future<void> deleterecord(String name) async {
    try
    {
      String uri = "http://10.0.2.2/database/delete_record.php";

      var res = await http.post(Uri.parse(uri), body: {"name":name});
      var response = await json.decode((res.body));
      if(response["success"]=="true")
      {
        print("Hey There!");
        getrecord();
      }
      else
        {
          print("Hey There!");
          getrecord();
        }
    }
        catch(e)
        {
          print(e);
        }
  }

  Future<void> getrecord() async {
    String uri = "http://10.0.2.2/database/fetchapi.php";

    try{
      var response = await http.get(Uri.parse(uri));

      setState(() {
        userdata = json.decode((response.body));
      });
    }
    catch(e){print(e);}
  }

  @override
  void initState() {
    getrecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Data"),
      ),
      body: ListView.builder(
      itemCount: userdata.length,
      itemBuilder: (context, index)
        {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(userdata[index]["name"]),
              subtitle: Text(userdata[index]['number']),
              trailing: IconButton(
                onPressed: () {
                  deleterecord(userdata[index]["name"]);
                },
                icon: const Icon(Icons.remove_circle),
              ),
            ),
          );
        },
      ),
    );
  }
}
