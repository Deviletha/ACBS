import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Config/base_client.dart';

class ProductView extends StatefulWidget {
  final String text;
  final String url;
  final String description;
  final String price;
  final String location;
  final String id;

  ProductView({
    Key? key,
    required this.text,
    required this.url,
    required this.description,
    required this.price,
    required this.location,
    required this.id,
  }) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  String? base =
      "https://acbsdemo.hawkssolutions.com/public/uploads/Products/details/";
  String? images;
  List? productList;
  Map? prlist;
  Map? prlist1;
  List? Prlist;
  List? Imagelist;
  int index = 0; // Add this line to initialize the index

  APIcall() async {
    var response = await BaseClient().post(api: "user/getProductById", body: {
      "offset": "0",
      "pageLimit": "100",
      "table": "products",
      "id": widget.id.toString(),
    }).catchError((err) {});
    if (response != null) {
      setState(() {
        debugPrint('api successful:');
        images = response.toString();
        prlist = jsonDecode(response);
        prlist1 = prlist!["data"];
        Prlist = prlist1!["pageData"];
        Imagelist = prlist1!["images"];
        print(Imagelist);

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
    APIcall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: Imagelist == null ? 0 : Imagelist?.length,
                itemBuilder: (context, index) => getImage(index),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Prlist == null ? 'Loading...' : Prlist![index]["amount"].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  Prlist == null ? 'Loading...' : Prlist![index]["description"].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  Prlist == null ? 'Loading...' : Prlist![index]["city"].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getImage(int index) {
    var image = base! + Imagelist![index]["image"].toString();
    return GridTile(
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
