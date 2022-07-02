



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodyadmin/Models/Food.dart';

class   Categories extends StatefulWidget {
  const   Categories({Key? key, }) : super(key: key);

  

  

  @override
  State<  Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State< Categories> {
  

  @override
  Widget build(BuildContext context) {
   
    var style;
    List<Food> foods = [
      Food(price: '150', description: 'description', name: 'Fries', id: 'f100', image: 'https://static.toiimg.com/thumb/54659021.cms?imgsize=275086&width=800&height=800'),
         Food(price: '150', description: 'description', name: 'VANILLA', id: 'f100', image: 'https://cdn.cdnparenting.com/articles/2019/02/08102541/1049230460-H.webp'),
         Food(price: '150', description: 'description', name: 'Fries', id: 'f100', image: 'https://static.toiimg.com/thumb/54659021.cms?imgsize=275086&width=800&height=800'),
          Food(price: '150', description: 'description', name: 'Fries', id: 'f100', image: 'https://static.toiimg.com/thumb/54659021.cms?imgsize=275086&width=800&height=800'),
         Food(price: '150', description: 'description', name: 'VANILLA', id: 'f100', image: 'https://cdn.cdnparenting.com/articles/2019/02/08102541/1049230460-H.webp'),
         Food(price: '150', description: 'description', name: 'Fries', id: 'f100', image: 'https://static.toiimg.com/thumb/54659021.cms?imgsize=275086&width=800&height=800'),
    ];
    return  Container(
      child: Column(children:  [
        
const Text('Foods ',style: TextStyle(fontWeight:FontWeight.bold,),),

        SizedBox(
          height: MediaQuery.of(context).size.height*0.8,
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
                     context ,foods[index] ,index+1),
                ),
              ),
        )





        
      ],),
      );}}













      
DataRow dataRow(
     BuildContext context,Food food,int index) {
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
      DataCell(Text(
       food.price,
        style: Theme.of(context).textTheme.caption,
      )),
      
     
      const DataCell(
      
      Icon(Icons.arrow_drop_down_outlined)
      ),
    ],
  );}