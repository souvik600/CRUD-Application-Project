import 'dart:convert';
import 'package:crud_app/Utility/Toast.dart';
import 'package:http/http.dart' as http;

Future<List> ProductGirldViewListRequst() async {
  var URI = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var PostHeader = {"Content-Type": "application/json"};

  var responce = await http.get(URI, headers: PostHeader);

  var resultCode = responce.statusCode;
  var resultBody = json.decode(responce.body);

  if (resultCode == 200 && resultBody["status"] == "success") {
    SuccessToast("Requst Success");
    return resultBody["data"];
  } else {
    ErrorToast("Requst Fail ! Try Again!");
    return [];
  }
}

Future<bool> ProductCreateBody(FormValues) async {
  var URI = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var PostBody = json.encode(FormValues);
  var PostHeader = {"Content-Type": "application/json"};

  var responce = await http.post(URI, headers: PostHeader, body: PostBody);

  var resultCode = responce.statusCode;
  var resultBody = json.decode(responce.body);

  if (resultCode == 200 && resultBody["status"] == "success") {
    SuccessToast("Requst Success");
    return true;
  } else {
    ErrorToast("Requst Fail ! Try Again!");
    return false;
  }
}

Future<bool> ProductDeleteRequest(id) async {
  var URI = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/"+id);
  var PostHeader = {"Content-Type": "application/json"};

  var responce = await http.post(URI, headers: PostHeader,);

  var resultCode = responce.statusCode;
  var resultBody = json.decode(responce.body);

  if (resultCode == 200 && resultBody["status"] == "success") {
    SuccessToast("Requst Success");
    return true;
  } else {
    ErrorToast("Requst Fail ! Try Again!");
    return false;
  }
}

Future<bool> ProductUpdateBody(FormValues,id) async {
  var URI = Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/" +id);
  var PostBody = json.encode(FormValues);
  var PostHeader = {"Content-Type": "application/json"};

  var responce = await http.post(URI, headers: PostHeader, body: PostBody);

  var resultCode = responce.statusCode;
  var resultBody = json.decode(responce.body);

  if (resultCode == 200 && resultBody["status"] == "success") {
    SuccessToast("Requst Success");
    return true;
  } else {
    ErrorToast("Requst Fail ! Try Again!");
    return false;
  }
}
