import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../FormInput.dart';

class AddDeliveryMan extends StatefulWidget {

  const AddDeliveryMan({Key? key, }) : super(key: key);

  @override
  _AddDeliveryManState createState() => _AddDeliveryManState();
}

class _AddDeliveryManState extends State<AddDeliveryMan> {
  

final _key = GlobalKey<FormState>();
  var _image;
  var _description;
  var _price;
  var _name;


  @override
  Widget build(BuildContext context) {












    
    add() {
      final isValid = _key.currentState!.validate();
      // var newproject = Project(
      //   id: '',
      //   image: _image,
      //   description: _description,
      //   link: _link,
      //   name: _name,
      // );
      if (kDebugMode) {
        print(isValid);
      }
      if (isValid) {
        _key.currentState!.save();
        // Provider.of<Projectsprovider>(context, listen: false)
        //     .addproject(newproject);
      } else if (isValid ) {
        // var editproject = Project(
        //   id: widget.project.id,
        //   image: _image,
        //   description: _description,
        //   link: _link,
        //   name: _name,
        // );
        // _key.currentState!.save();
        // Provider.of<Projectsprovider>(context, listen: false)
        //     .addproject(editproject);
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
              FormInputField(
               // initialvalue: id.isEmpty ? '' : widget.project.image,
                isdescript: false,
                labelText: 'Email',
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
                FormInputField(
              //  initialvalue: id.isEmpty ? '' : widget.project.link,
                isdescript: false,
                labelText: 'Phone',
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
       FormInputField(
               // initialvalue: id.isEmpty ? '' : widget.project.description,
               isdescript: true,
                labelText: 'Id',
                validator: (val) {
                  return val!.isEmpty ? 'Cannot be blank!' : null;
                },
                onchanged: (val) {
                  setState(() {
                    _description = val!;
                  });
                },
               
              ),
               FormInputField(
               // initialvalue: id.isEmpty ? '' : widget.project.description,
               isdescript: true,
                labelText: 'Password',
                validator: (val) {
                  return val!.isEmpty ? 'Cannot be blank!' : null;
                },
                onchanged: (val) {
                  setState(() {
                    _description = val!;
                  });
                },
               
              ),
              
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    clipBehavior: Clip.antiAlias,
                    onPressed: add,
                    style: ElevatedButton.styleFrom(
                      primary:  const Color(0xffffb800),
                    ),
                    child: const Text(
                      'Add',
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




