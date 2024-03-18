import 'dart:convert';
import 'package:database_connection/view_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  Future<void> insertdata() async {
    if (nameController.text != "" || numberController.text != "") {
      try {
        String uri = "http://10.0.2.2/database/insert_record.php";
        var res = await http.post(Uri.parse(uri), body: {
          "name": nameController.text,
          "number": numberController.text,
        });
        var response = await json.decode((res.body));

        if (response["success"] == "true") {
          print("Record Inserted");
        } else {
          print("Some Issues");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Please Fill All Fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Center(child: Text("DataBase Connection")),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
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
            padding: const EdgeInsets.all(30),
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
            padding: const EdgeInsets.all(30),
            child: ElevatedButton.icon(
              onPressed: () {
                insertdata();
                nameController.clear();
                numberController.clear();
              },
              icon: const Icon(Icons.save_alt_sharp),
              label: const Text("Save"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(30),
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const view_data()));
                    }, child: const Text("View Data"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
