import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Config/base_client.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key, String? text, String? description, String? id})
      : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  String? base =
      "https://acbsdemo.hawkssolutions.com/public/uploads/Products/cover/";
  String? images;
    var PID;
  List? productList;
  Map? prlist;
  Map? prlist1;
  List? Prlist;
  int index = 0;

  Map? wslist;
  List? WsList;
  @override
  void initState() {
    super.initState();
    APIcall();
  }

  APIcall() async {
    var response = await BaseClient().post(api: "addwishList/get", body: {
      "userid": "38",
    }).catchError((err) {});
    if (response != null) {
      setState(() {
        debugPrint('wishlist api successful:');
        prlist = jsonDecode(response);
        prlist1 = prlist!["pagination"];
        Prlist = prlist1!["pageData"];

        Fluttertoast.showToast(
          msg: "Wishlist page success",
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

  removeFromWishtist(String id) async {
    var response = await BaseClient().post(api: "addwishList/remove", body: {
      "id": id,
    }).catchError((err) {});
    if (response != null) {
      setState(() {
        debugPrint('Remove api successful:');
        prlist = jsonDecode(response);
        wslist = prlist!["pagination"];
        WsList = wslist!["pageData"];

        Fluttertoast.showToast(
          msg: "Removed product",
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

  Future<void> _refreshpage() async {
    setState(() {
      print(PID);
      removeFromWishtist(PID);
      APIcall();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlist❤️'),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshpage,
        child: ListView.builder(
          itemCount: Prlist == null ? 0 : Prlist?.length,
          itemBuilder: (context, index) => getWishlist(index),
        ),
      ),
    );
  }

  Widget getWishlist(int index) {
    var image = base! + Prlist![index]["image"];
    var price = "₹ " + Prlist![index]["amount"].toString();
     PID =  Prlist![index]["wishlistId"].toString();
    return Card(
      child: ListTile(
          title: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(20), // Image border
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(60), // Image radius
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Prlist == null
                            ? Text("null data")
                            : Text(
                                Prlist![index]["name"].toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          Prlist![index]["description"].toString(),
                          maxLines: 2,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          price,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.red),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: TextButton(
            onPressed: () {
              removeFromWishtist(PID);
            },
            child: Text(
              "Remove",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
