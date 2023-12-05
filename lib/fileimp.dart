import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:myapp/group.dart';

class ScrollScreen extends StatelessWidget {
  final username;
  const ScrollScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    TextEditingController sub = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Student Group Maker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          const Text(
            "Enter Subject Name: ",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
            controller: sub,
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.password,
                color: Colors.white,
              ),
              labelText: "Enter Subject Name",
              labelStyle: TextStyle(color: Colors.grey[400]),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green)),
            onPressed: () {
              pickFile();
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const GroupView()));
            },
            child: const Text(
              "Upload File",
              style:
                  TextStyle(fontSize: 30, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> pickFile() async {
  // Request permission
  PermissionStatus permissionStatus = await Permission.storage.request();

  // Check if permission is granted
  if (permissionStatus.isGranted) {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File file = File(result.files.single.path!);

        // Now, 'file' contains the selected file.
        // You can perform further actions with the file.
      } else {
        // User canceled the picker
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  } else {
    print("Permission not granted");
    // You can show a message or request permission again
  }
}
