import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductView extends StatefulWidget {
  final String text;
  final String url;
  final String description;
  final String price;
  final String location;


  ProductView(
      {Key? key, required this.text, required this.url, required this.description, required this.price, required this.location})
      : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark,
          // For Android (dark icons)
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(100), // Image radius
                      child: Image.network(widget.url, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.text}",
                        maxLines: 2,
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        "₹ ${widget.price}",
                        maxLines: 2,
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        "${widget.description}",
                        maxLines: 6,
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        "Lcation : ${widget.location}",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
