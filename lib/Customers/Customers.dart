import 'package:flutter/material.dart';
import 'package:foodyadmin/Provider/Addcategory.dart';
import 'package:provider/provider.dart';

import '../Categories/AddSubcategory.dart';
import '../Models/Customer.dart';

class   Customers extends StatefulWidget {
  const   Customers({Key? key, }) : super(key: key);
  @override
  State<  Customers> createState() => _CustomersState();
}

class _CustomersState extends State< Customers> {
  
  @override
  Widget build(BuildContext context) {





















    var style;
    List<Customer> customers = [ Customer(name: 'Bill',contact: '0727800223',orders: '4',),
    Customer(name: 'John',contact: '0727800223',orders: '4',),
    Customer(name: 'Dante',contact: '0727800223',orders: '4',),
    Customer(name: 'Sly',contact: '0727800223',orders: '4',)   ];
    return  Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
                   const SizedBox(height: 10,),
    const Text('Customers:4',style: TextStyle(fontWeight:FontWeight.bold,),),
    
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
                      "PROVIDER",
                      style: style,
                    ),
                  ),
    DataColumn(
                    label: Text(
                      "ORDERS",
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
                 customers.length,
                  (index) => dataRow(
                     context ,customers[index] ,index+1,false),
                ),
              ),
        ),
    
    
        
      ],),
    );}}













      
DataRow dataRow(
     BuildContext context,Customer customer,int index,bool issubcategory) {
  return DataRow(
    cells: [
      
       DataCell(Text(
      index.toString(),
        style: Theme.of(context).textTheme.caption,
      )),
      DataCell(Text(
      customer.name,
        style: Theme.of(context).textTheme.caption,
      )),
       DataCell(
            Text(
      customer.contact,
        style: Theme.of(context).textTheme.caption,
      )             
                        
  ),
    
     
      DataCell(Text(
      customer.orders,
        style: Theme.of(context).textTheme.caption,
      )),
       DataCell(
      issubcategory ? 
      InkWell(
        onTap: (() {
   // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Subcategory(isubcategory: true,)));
  }),
        child: const Icon(Icons.edit)):

 InkWell(
  onTap: (() {
   // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Subcategory(isubcategory: false,)));
  }),
   child: Row(
                        children: const [
                          Icon(Icons.edit,size: 14,),
                          SizedBox(width: 10,),
                         Icon(Icons.delete,size: 14,),
                        ],
                      )),
 




      ),
    ],
  );}