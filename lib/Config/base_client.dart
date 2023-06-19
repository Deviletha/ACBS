// import 'package:http/http.dart' as http;
//
// const String baseUrl = 'https://acbs.hawkssolutions.com/public/v1/';
//
// class BaseClient {
//   var client = http.Client();
// String offset ="0";
//
//
//   Future<dynamic> post( {required String api, required Map<String, String> body}) async {
//     var url = Uri.parse(baseUrl + api);
//     //var _payload = json.encode(object);
//     var _payload={
//       "offset": offset,
//       "pageLimit": "100",
//       "table": "products"
//     };
//     var _headers = {
//       'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhcnlhYXMiLCJuYW1lIjoiSGF3a3MgU29sdXRpb25zIiwiYWRtaW4iOnRydWV9.BoaclKRc8ZpUbWFoQ0tv80RRncyXtRypI6jDVIJQOas',
//       'Content-Type': 'application/x-www-form-urlencoded',
//     };
//
//     var response = await client.post(url,body:_payload,headers: _headers);
//     if (response.statusCode == 200) {
//       print("acbs api response"+response.body);
//       return response.body;
//
//     } else {
//       //throw exception and catch it in UI
//     }
//   }
//
// }
import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = 'https://acbs.hawkssolutions.com/public/v1/';

class BaseClient {
  var client = http.Client();
  String offset ="0";

  Future<dynamic> post({required String api, required Map body}) async {
    var url = Uri.parse(baseUrl + api);
    //var _payload = json.encode(object);
    var _payload={
      "offset": offset,
      "pageLimit": "100",
      "table": "products"
    };
    var _headers = {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhcnlhYXMiLCJuYW1lIjoiSGF3a3MgU29sdXRpb25zIiwiYWRtaW4iOnRydWV9.BoaclKRc8ZpUbWFoQ0tv80RRncyXtRypI6jDVIJQOas',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    var response = await client.post(url, body: body, headers: _headers);
    if (response.statusCode == 200) {
      //print("acbs api response"+response.body);
      return response.body;

    } else {
      //throw exception and catch it in UI
    }
  }
}