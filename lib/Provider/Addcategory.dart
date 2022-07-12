import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Models/Food.dart';
import '../Utilities/toast.dart';

class AddCategory extends ChangeNotifier {
var dio = Dio();
final List<Food> _subCategory =[];

List<Food> _mainCategory =[];





  List<Food> subCategory() {
    return [..._subCategory];
  }
  

  List<Food> mainCategory() {
    return [... _mainCategory];
  }
void addmainCategory(String category) async {
  try {
    var response = await dio.post('https://foodie-test-9da37-default-rtdb.firebaseio.com/Foods.json',data: {category,});

   if(response.statusCode==200){

sucessToast('Successful');
   }else{

   if (kDebugMode) {
       print('///////////ADD MAIN CATEGORY ERROR');
      print(response.data);
    }
   }

  
  } on SocketException{
errorToast("Check Your Internet Connection and Try again");

  } 
  catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

void addsubCategory(Food food,String category) async {
 var  data = {
            'Name': food.name, 
            'Description': food.description, 
            'Image': food.image, 
            'Price': food.price,
  };
  try {
    var response = await dio.post(
  'https://foodie-test-9da37-default-rtdb.firebaseio.com/Foods/$category.json',
    data:data,);

   if(response.statusCode==200){

sucessToast('Successful');
   }else{


   }

  
  } on SocketException{
errorToast("Check Your Internet Connection and Try again");

  } 
  catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

  loadMainCategory() async {
    const url = '';
    try {
        var response = await dio.get(url);
      
      if (response.statusCode == 200) {
        var data = json.decode(response.data) as Map<String, dynamic>;
        List<Food> mainCategory = [];
        data.forEach((id, _data) {
          mainCategory.add(Food(
          
            id: id,
            name: _data[" name"], description: '', 
            image: '', 
            price: '',
          ));
          _mainCategory= mainCategory;
          notifyListeners();
        });
      } else {
        errorToast(response.data.toString());
      }
    } on SocketException {
     errorToast("Check Your Internet Connection and Try again");
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }


  editsubCategory(Food food) async {
    const url = 'http.yoururl.example/Projects';
    var data = {
      "Name": food.name,
      "Image": food.image,
      "Price": food.price,
      "Description": food.description,
    };
    try {
      var response = await dio.patch(url, data: jsonEncode(data));
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: response.data,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: response.data,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } on SocketException {
      Fluttertoast.showToast(
          msg: "Check Your Internet Connection and Try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  deletesubCategory(Food food) async {
    const url = 'http.yoururl.example/Projects';
    var data = {
      "Name": food.name,
      "Image": food.image,
      "Price": food.price,
      "Description": food.description,
    };
    try {
      var response = await dio.delete(url, data: jsonEncode(data));
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: response.data,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: response.data,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } on SocketException {
      Fluttertoast.showToast(
          msg: "Check Your Internet Connection and Try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}