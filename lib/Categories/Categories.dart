



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodyadmin/Models/Food.dart';
import 'package:provider/provider.dart';

import '../FormInput.dart';
import '../Provider/Addcategory.dart';
import 'AddSubcategory.dart';

class   Categories extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  const   Categories({Key? key, required this.formkey, }) : super(key: key);

  

  

  @override
  State<  Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State< Categories> {
  
 final _categorieskey = GlobalKey<FormState>();

  var _mainCategory;
  @override
  Widget build(BuildContext context) {

    

   
    var style;
    List<Food> foods = Provider.of<AddCategory>(context).subCategory();
    List<Food> _mainCategory = Provider.of<AddCategory>(context).mainCategory();
    return  Form(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
          const Text('Add Category',style: TextStyle(fontWeight:FontWeight.bold,),),
     const SizedBox(height:10 ,),















InkWell(
  onTap: (() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Subcategory(isubcategory: false,isnewsubcategory: false, maincategory: Food(description: '', id: '', image: '', name: '', price: ''),)));
  }),
   child: Container(

 height: 40,
                        decoration:  const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
                               color: Color(0xffffb800),
                                shape: BoxShape.rectangle,
                               
                               
                              ),
        padding: const EdgeInsets.all(5),
                       
      
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.add,size: 12,),
                            SizedBox(width: 5,),
                            Text('Add Category',style: TextStyle(fontSize: 12,),),
                          ],
                        )),
 ),

    
                         const SizedBox(height: 10,),
    const Text('Main Category',style: TextStyle(fontWeight:FontWeight.bold,),),
    
          SizedBox(
          
            child:  DataTable(
              
                  horizontalMargin: 5,
                  columnSpacing: 30,
                  
                showBottomBorder: true,
                  columns: [
                    DataColumn(
                      label: Text(
                        "***",
                        style: style,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "NAME",
                        style: style,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "IMAGE",
                        style: style,
                      ),
                    ),
     
     
                     DataColumn(
                      label: Text(
                        "ACTIONS",
                        style: style,
                      ),
                    ),
    
                  ],
                  rows: List.generate(
                    _mainCategory.length,
                    (index) => dataRow(
                       context ,_mainCategory[index] ,index+1,false,_mainCategory[index]),
                  ),
                ),
          ),
    
    
    
    const SizedBox(height: 15,),
    const Text('Sub  Category ',style: TextStyle(fontWeight:FontWeight.bold,),),
    
    
    
       SizedBox(
          
            child:  DataTable(
              
                  horizontalMargin: 5,
                  columnSpacing: 30,
                  
                showBottomBorder: true,
                  columns: [
                    DataColumn(
                      label: Text(
                        "***",
                        style: style,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "NAME",
                        style: style,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "IMAGE",
                        style: style,
                      ),
                    ),
      DataColumn(
                      label: Text(
                        "PRICE",
                        style: style,
                      ),
                    ),
     
                     DataColumn(
                      label: Text(
                        "ACTIONS",
                        style: style,
                      ),
                    ),
    
                  ],
                  rows: List.generate(
                    foods.length,
                    (index) => dataRow(
                       context ,foods[index] ,index+1 ,true ,null),
                  ),
                ),),
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
          
        ],),
      ),
    );}}













      
DataRow dataRow(
     BuildContext context,Food food,int index,bool issubcategory,dynamic maincategory) {
  return DataRow(
    cells: [
       DataCell(Text(
      index.toString(),
        style: Theme.of(context).textTheme.caption,
      )),
      DataCell(Text(
      food.name,
        style: Theme.of(context).textTheme.caption,
      )),
       DataCell(CachedNetworkImage(
  
    imageUrl: food.image,
  
    imageBuilder: (context, imageProvider) => Container(
  
      height: 70,
  
      width: 70,
  
      margin: const EdgeInsets.all(10),
     
  
      decoration:  BoxDecoration(
                      
                          shape: BoxShape.circle,
                          image: DecorationImage(image: imageProvider,
          fit: BoxFit.cover,),
                         
                        ),
  
     
  
    ),
  
    placeholder: (context, url) =>  const CircularProgressIndicator(color: Colors.black,
  
    strokeWidth: 1.0,),
  
    errorWidget: (context, url, error) => const Icon(Icons.error),
  
  ) ,),
    
     if(issubcategory)  
      DataCell(Text(
      food.price,
        style: Theme.of(context).textTheme.caption,
      )),
       DataCell(
      issubcategory ? 
      InkWell(
        onTap: (() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Subcategory(isubcategory: true,isnewsubcategory: false, maincategory: Food(description: '', id: '', image: '', name: '', price: ''),)));
  }),
        child: const Icon(Icons.edit)):

 InkWell(
  onTap: (() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Subcategory(isubcategory: true, isnewsubcategory: true, maincategory: maincategory,)));
  }),
   child: Container(
 
 
                      decoration:  const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
                             color: Color(0xffffb800),
                              shape: BoxShape.rectangle,
                             
                             
                            ),
      padding: const EdgeInsets.all(5),
                     
    
                      child:  Row(
                        children: const [
                          Icon(Icons.edit,size: 10,),
                          SizedBox(width: 5,),
                          Text('Add Food',style: TextStyle(fontSize: 10,),),
                        ],
                      )),
 ),




      ),
    ],
  );}