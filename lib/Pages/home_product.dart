import 'dart:convert';
import 'package:acbs_sample/Pages/product_view.dart';
import 'package:acbs_sample/Pages/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Config/base_client.dart';
import '../Model/Product.dart';
import '../constants/Title_widget.dart';
import 'addproducts.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({Key? key}) : super(key: key);

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  String? base =
      "https://acbsdemo.hawkssolutions.com/public/uploads/Products/cover/";
  String? data;
  List? productList;
  Product? product;
  Map? list;
  Map? list1;
  List? listP;

  List? categoryList;
  Map? clist;
  List? ListP1;

  List? brandlist;
  Map? blist;
  List? ListB;

  List? wishList;
  Map? adlist;
  List? ListAd;

  callAPIandAssignData() async {
    var response = await BaseClient().post(api: "user/getProducts", body: {
      "offset": "0",
      "pageLimit": "100",
      "table": "products"
    }).catchError((err) {});
    if (response != null) {
      setState(() {
        debugPrint('get products api successful:');
        data = response.toString();
        list = jsonDecode(response);
        list1 = list!["data"];
        listP = list1!["pageData"];

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

  callAPIandAssignDataforProduct() async {
    var response = await BaseClient().post(api: "user/getCategory", body: {
      "offset": "0",
      "pageLimit": "100",
      "table": "products"
    }).catchError((err) {});
    if (response != null) {
      setState(() {
        debugPrint('get category api successful:');
        clist = jsonDecode(response);
        ListP1 = clist!["pageData"];

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

  callAPIgetBrand() async {
    var response = await BaseClient().post(api: "user/getBrand", body: {
      "offset": "0",
      "pageLimit": "100",
      "table": "brand"
    }).catchError((err) {});
    if (response != null) {
      setState(() {
        debugPrint('get brand api successful:');
        data = response.toString();
        list = jsonDecode(response);
        blist = list!["data"];
        ListB = blist!["pageData"];

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

  addTowishtist(String id) async {
    var response = await BaseClient().post(
        api: "addwishList",
        body: {"userid": "38",
          "productid": id,
        }).catchError((err) {});
    if (response != null) {
      setState(() {
        debugPrint('addwishlist api successful:');
        data = response.toString();
        list = jsonDecode(response);
        adlist = list!["pagination"];
        ListAd = adlist!["pageData"];

        Fluttertoast.showToast(
          msg: "Added to Wishlist",
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
      callAPIandAssignData();
      callAPIandAssignDataforProduct();
      callAPIgetBrand()();
    });
  }

  @override
  void initState() {
    callAPIandAssignData();
    callAPIandAssignDataforProduct();
    callAPIgetBrand();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark,
          // For Android (dark icons)
          statusBarBrightness: Brightness.dark,
        ),
        title: Text(
          "ACBS",
          style:
              TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Icon(
            Icons.location_on,
            color: Colors.black,
          ),
          IconButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return WishlistPage();
                    },
                  )),

              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              )),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshpage,
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Container(
                    height: 45,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          size: 20,
                        ),
                        Text(
                          "Search ",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Heading(
              tittle: "Categories",
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2,
                  ),
                  itemCount: ListP1 == null ? 0 : ListP1?.length,
                  itemBuilder: (context, index) => getCategoryRow(index),
                ),
              ),
            ),
            Heading(tittle: "Brands"),
            Expanded(
              flex: 1,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 2),
                itemCount: ListB == null ? 0 : ListB?.length,
                itemBuilder: (context, index) => getBrandRow(index),
              ),
            ),
            Heading(tittle: "New Recomendations"),
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: listP == null ? 0 : listP?.length,
                itemBuilder: (context, index) => getRow(index),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return AddNewProducts();
          },
        )),
        child: Icon(
          Icons.add_circle_rounded,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget getRow(int index) {
    var image = base! + listP![index]["image"];
    var price = "₹ " + listP![index]["amount"].toString();
    var  PID =  listP![index]["id"].toString();
    return Card(
      child: ListTile(
          onTap: () {
            Navigator.push(
              context as BuildContext,
              MaterialPageRoute(
                builder: (context) => ProductView(
                  text: listP![index]["name"].toString(),
                  url: image,
                  description: listP![index]["description"].toString(),
                  price: listP![index]["amount"].toString(),
                  location: listP![index]["city"].toString(),
                  id: listP![index]["id"].toString(),
                ),
              ),
            );
          },
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
                        listP == null
                            ? Text("null data")
                            : Text(
                                listP![index]["name"].toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          listP![index]["description"].toString(),
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
          trailing: IconButton(
            onPressed: () {
            addTowishtist(PID);
            },
            icon: Icon(Icons.favorite_sharp),
          )),
    );
  }

  Widget getCategoryRow(int index) {
    var category = ListP1![index]["category"].toString();
    var head = ListP1![index]["head"].toString();

    return Card(
      child: ListTile(
        onTap: () {
          // Handle category item tap event
        },
        // leading: image != null ? Image.network(image) : null,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              category,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              head,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBrandRow(int index) {
    var brand = ListB![index]["brand"].toString();
    var category = ListB![index]["category"].toString();

    return Card(
      child: ListTile(
        onTap: () {
          // Handle category item tap event
        },
        // leading: image != null ? Image.network(image) : null,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              brand,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              category,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
