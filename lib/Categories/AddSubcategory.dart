

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../FormInput.dart';
import '../Models/Food.dart';
import '../Provider/Addcategory.dart';

class Subcategory extends StatefulWidget {
   final Food maincategory;
  final bool isubcategory;
  final bool isnewsubcategory;
  const Subcategory({Key? key, required this.isubcategory, required this.isnewsubcategory, required this.maincategory, }) : super(key: key);

  @override
  _SubcategoryState createState() => _SubcategoryState();
}

class _SubcategoryState extends State<Subcategory> {
  

final _key = GlobalKey<FormState>();
  var _image;
  var _description;
  var _price;
  var _name;
  var _isLoading = false;


  @override
  Widget build(BuildContext context) {








    _addMaincategory() {
      var  isValid = _key.currentState!.validate();
     
      if (isValid  ) {
      
      } 
    }







    
    upload() {
      final isValid = _key.currentState!.validate();
     
     
      if (isValid && widget.isubcategory) {
          setState(() {
          _isLoading=true;
        });
        
          Provider.of<AddCategory>(context, listen: false).addsubCategory( food:Food(
      id: '',
        image: _image,
        description: _description,
        name: _name,
        price: _price,
      ), maincategoryid: widget.maincategory.id ).whenComplete(() {
 setState(() {
          _isLoading=false;
        });

        });
      } else if (isValid && !widget.isubcategory && !widget.isnewsubcategory) {
        setState(() {
          _isLoading=true;
        });
    
        Provider.of<AddCategory>(context, listen: false).addmainCategory(category:_name).whenComplete(() {
 setState(() {
          _isLoading=false;
        });

        });

      }
     
    }

return Scaffold(

  appBar: AppBar(),
body:SingleChildScrollView(
      child: Form(
        key: _key,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              FormInputField(
               // initialvalue: id.isEmpty ? '' : widget.project.name,
                isdescript: false,
                labelText: 'Name',
                validator: (val) {
                  return val!.isEmpty ? 'Cannot be blank!' : null;
                },
                onchanged: (val) {
                  setState(() {
                    _name = val!;
                    if (kDebugMode) {
                      print(val);
                    }
                  });
                }, 
              ),
              const SizedBox(
                height: 10,
              ),
              if(widget.isubcategory)   FormInputField(
               // initialvalue: id.isEmpty ? '' : widget.project.image,
                isdescript: false,
                labelText: 'Image',
                validator: (val) {
                  return val!.isEmpty ? 'Cannot be blank!' : null;
                },
                onchanged: (val) {
                  setState(() {
                    _image = val!;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
               if(widget.isubcategory)  FormInputField(
              //  initialvalue: id.isEmpty ? '' : widget.project.link,
                isdescript: false,
                labelText: 'Price',
                validator: (val) {
                  return val!.isEmpty ? 'Cannot be blank!' : null;
                },
                onchanged: (val) {
                  setState(() {
                    _price = val!;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
             if(widget.isubcategory) FormInputField(
               // initialvalue: id.isEmpty ? '' : widget.project.description,
               isdescript: true,
                labelText: 'Description',
                validator: (val) {
                  return val!.isEmpty ? 'Cannot be blank!' : null;
                },
                onchanged: (val) {
                  setState(() {
                    _description = val!;
                  });
                },
               
              ),
              
              _isLoading ? const CircularProgressIndicator(color: Colors.black,
  
    strokeWidth: 1.0,): Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    clipBehavior: Clip.antiAlias,
                    onPressed: upload,
                    style: ElevatedButton.styleFrom(
                      primary:  const Color(0xffffb800),
                    ),
                    child: const Text(
                      'Add Food',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    )
  
);
  }}




