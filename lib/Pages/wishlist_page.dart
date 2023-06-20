import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddToWishlistPage extends StatefulWidget {
  const AddToWishlistPage({Key? key}) : super(key: key);

  @override
  State<AddToWishlistPage> createState() => _AddToWishlistPageState();
}

class _AddToWishlistPageState extends State<AddToWishlistPage> {
  List<dynamic>? products;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('https://acbs.hawkssolutions.com/public/v1/addwishList'));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      setState(() {
        products = responseData['products'];
      });
    } else {
      // Handle API error
      print('API request failed with status code: ${response.statusCode}');
    }
  }

  void addToWishlist(int index) {
    // Implement the logic to add the product at the given index to the wishlist
    // You can use the product's ID or any other unique identifier for this
    final product = products?[index];
    if (product != null) {
      // Perform the action to add the product to the wishlist
      print('Added to wishlist: ${product['name']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add to Wishlist'),
      ),
      body: products == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: products!.length,
        itemBuilder: (context, index) {
          final product = products![index];
          return ListTile(
            title: Text(product['name'].toString()),
            subtitle: Text(product['description'].toString()),
            trailing: IconButton(
              onPressed: () => addToWishlist(index),
              icon: const Icon(Icons.favorite_border),
            ),
          );
        },
      ),
    );
  }
}


// class Wishlist extends StatefulWidget {
//   const Wishlist({Key? key}) : super(key: key);
//
//   @override
//   State<Wishlist> createState() => _WishlistState();
// }
//
// class _WishlistState extends State<Wishlist> {
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//     );
//   }
// }
