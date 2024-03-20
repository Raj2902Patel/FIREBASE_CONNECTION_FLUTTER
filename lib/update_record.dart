import 'dart:convert';

import 'package:database_connection/database_connection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class update_record extends StatefulWidget {
  String name;
  String number;

  update_record(this.name, this.number);


  @override
  State<update_record> createState() => _update_recordState();
}

class _update_recordState extends State<update_record> {

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  Future<void> updaterecord() async {

    try{
      String uri = "http://10.0.2.2/database/update_record.php";

      var res = await http.post(Uri.parse(uri),body: {"name":nameController.text, "number":numberController.text});

      var response = await json.decode((res.body));
      if(response["success"]=="true"){
        print("Updated");
      }else{
        print("Error!");
      }
    }
        catch(e){print(e);}

  }

  @override
  void initState() {
    nameController.text = widget.name;
    numberController.text = widget.number;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Record"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your Name",
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: numberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your RollNumber",
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton.icon(
              onPressed: () {
                updaterecord();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
                // nameController.clear();
                // numberController.clear();
              },
              icon: const Icon(Icons.save_alt_sharp),
              label: const Text("Update Data"),
            ),
          ),
        ],
      ),
    );
  }
}
