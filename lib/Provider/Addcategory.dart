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
 List<Food> _subCategory =[];

List<Food> _mainCategory =[];





  List<Food> subCategory() {
    return [..._subCategory];
  }
  

  List<Food> mainCategory() {
    return [... _mainCategory];
  }
Future<void> addmainCategory({required String? category}) async {
  var data = {
      'Name': category,
  };
  try {
    var response = await dio.post('https://foodie-test-9da37-default-rtdb.firebaseio.com/Foods.json',data:data);

   if(response.statusCode==200){
  await loadMainCategory() ;
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

Future<void> addsubCategory( {required Food food,required String maincategoryid,}) async {
 var  data = {
            'Name': food.name, 
            'Description': food.description, 
            'Image': food.image, 
            'Price': food.price,
  };
  try {
    var response = await dio.post(
  'https://foodie-test-9da37-default-rtdb.firebaseio.com/Foods/$maincategoryid/Subcategories.json',
    data:data,);

   if(response.statusCode==200){
await loadSubCategory() ;
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
    const url = 'https://foodie-test-9da37-default-rtdb.firebaseio.com/Foods.json';
    try {
        var response = await dio.get(url);
      
      if (response.statusCode == 200) {
          
      
       
        List<Food> mainCategory = [];
        response.data.forEach((id, _data) {
          if (kDebugMode) {
            print(_data);
          }
          mainCategory.add(Food(
          
            id: id,
            name: _data["Name"], 
            description: '', 
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



  loadSubCategory() async {
    const url = 'https://foodie-test-9da37-default-rtdb.firebaseio.com/Foods/.json';
    try {
        var response = await dio.get(url);
      
      if (response.statusCode == 200) {
          
      
       
        List<Food> sub = [];
        response.data.forEach((id, _data) {

         _data['Subcategories'].forEach(

          (dataid, subcategory){
          
          
          if (kDebugMode) {
            print(' Sub category  =====++++ $subcategory');
          }
          

      sub.add(Food(
          
            id: dataid,
            name: subcategory["Name"], 
            description:  subcategory["Description"], 
            image:  subcategory["Image"], 
            price:  subcategory["Price"],
          ));
         
          _subCategory= sub;
          notifyListeners();



          }


         );

          if (kDebugMode) {
            print(_data);
          }
        
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