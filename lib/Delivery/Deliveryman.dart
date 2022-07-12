


import 'package:flutter/material.dart';
import 'package:foodyadmin/Models/Deliverymanmodel.dart';

import '../Categories/AddSubcategory.dart';
import 'AddDeliveryman.dart';

class DeliveryMan extends StatefulWidget {
  const DeliveryMan({Key? key, }) : super(key: key);

  

  

  @override
  State<DeliveryMan> createState() => _DeliveryManState();
}

class _DeliveryManState extends State<DeliveryMan > {
  

  @override
  Widget build(BuildContext context) {
    var style;
    List<DeliveryManmodel> deliveryman =[
      DeliveryManmodel(name: 'Dante', rating: '4', phone: '0727800223'),
      DeliveryManmodel(name: 'Voke', rating: '3', phone: '0727800223'),
       DeliveryManmodel(name: 'Voke', rating: '3', phone: '0727800223'),
    ];
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
InkWell(
  onTap: (() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddDeliveryMan()));
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
                            Text('Add Deliveryman',style: TextStyle(fontSize: 12,),),
                          ],
                        )),
 ),

const SizedBox(height: 15,),
const Text('DeliveryMen',style: TextStyle(fontWeight:FontWeight.bold,),),
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
                      "PHONE",
                      style: style,
                    ),
                  ),
  DataColumn(
                    label: Text(
                      "RATING",
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
                  deliveryman.length,
                  (index) => dataRow(
                     context ,deliveryman[index] ,index+1 ,true ),
                ),
              ),),









 ],),
    );
  }}










  

      
DataRow dataRow(
     BuildContext context,DeliveryManmodel delman,int index,bool issubcategory) {
  return DataRow(
    cells: [
       DataCell(Text(
      index.toString(),
        style: Theme.of(context).textTheme.caption,
      )),
      DataCell(Text(
      delman.name,
        style: Theme.of(context).textTheme.caption,
      )),
       DataCell(
     Text(
      delman.phone,
        style: Theme.of(context).textTheme.caption,
      )
  
    ),
      DataCell(Container(
                    decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
                           color: Colors.red.shade100,
                            shape: BoxShape.rectangle,
                           
                           
                          ),
    padding: const EdgeInsets.all(2),
                    child:  SizedBox(
                      width: 17,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                           Text(delman.rating),
                                   
                          const Icon(Icons.star,size: 10,),
                        ],
                      ),
                    )),),












       DataCell(
      issubcategory ? 
      InkWell(
        onTap: (() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Subcategory(isubcategory: true,)));
  }),
        child:  Row(
                        children: const [
                          Icon(Icons.edit,size: 15,),
                          SizedBox(width: 10,),
                         Icon(Icons.delete,size: 15,),
                        ],
                      )):

 InkWell(
  onTap: (() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Subcategory(isubcategory: false,)));
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