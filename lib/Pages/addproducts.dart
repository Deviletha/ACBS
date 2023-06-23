import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import '../Config/base_client.dart';

class AddNewProducts extends StatefulWidget {
  const AddNewProducts({Key? key}) : super(key: key);

  @override
  State<AddNewProducts> createState() => _AddNewProductsState();
}

class _AddNewProductsState extends State<AddNewProducts> {
  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedFile;
  bool isLoading = false;
  List<String> base64Images = []; // Store the base64 images as a list
  TextEditingController productNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });
      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: true, // Allow multiple file selection
      );

      if (result != null) {
        for (var file in result!.files) {
          fileName = file.name;
          pickedFile = file;
          File fileToDisplay = File(pickedFile!.path!);

          List<int> imageBytes = await fileToDisplay.readAsBytes();
          String base64Image = base64Encode(imageBytes);

          base64Images.add(base64Image); // Add base64 image string to the list

          print("File name: $fileName");
        }
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  callAPIandAssignData() async {
    var response = await BaseClient().post(api: "user/addNewProduct", body: {
      "name": productNameController.text,
      "imageUrl": base64Images[0],
      "code": "code",
      "customer": "38",
      "category": "1",
      "brand": "1",
      "amount": amountController.text,
      "discount": "discount",
      "hsn": "hsn",
      "latitude": "latitude",
      "longitude": "longitude",
      "location": locationController.text,
      "tax": "tax",
      "description": descriptionController.text,
      "detail_images": "base64Images"
      // Join multiple images with a separator
    }).catchError((err) {});
    if (response != null) {
      setState(() {
        debugPrint('api successful:');
        // base64Images = jsonDecode(response);

        Fluttertoast.showToast(
          msg: "Success ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      });
    } else {
      debugPrint('api failed:');
      Fluttertoast.showToast(
        msg: "failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    pickFile();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shadowColor: Colors.indigo[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      )),
                  child: Text(
                    "Pick File",
                    selectionColor: Colors.blue,
                  ),
                ),
                if (base64Images.isNotEmpty)
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: base64Images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.memory(
                            base64Decode(base64Images[index]),
                          ),
                        );
                      },
                    ),
                  ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: TextField(
                    controller: productNameController,
                    decoration: InputDecoration(
                      labelText: 'Product Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: TextField(
                    controller: amountController,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: TextField(
                    controller: locationController,
                    decoration: InputDecoration(
                      labelText: 'Location',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    callAPIandAssignData();
                  },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        shadowColor: Colors.indigo[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topRight: Radius.circular(10)),
                        )),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
