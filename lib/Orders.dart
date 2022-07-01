
import 'package:flutter/material.dart';
import 'package:textfield_search/textfield_search.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key,}) : super(key: key);

  



  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
   static const label = "Some Label";
    static const dummyList = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
   
    var style;
    var orders =[1,5,8];
    var list;
    return Scaffold(

      appBar: AppBar(),

      body: Container(
          padding: const EdgeInsets.only( top: 10,left: 5),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [





const Text('Orders ',style: TextStyle(fontWeight:FontWeight.bold,),),
Container(
  padding: const EdgeInsets.all(10),
  child: TextFieldSearch(
    decoration: InputDecoration(
      suffixIcon:  InkWell(child: const Icon(Icons.search),onTap: (){},),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 0.0,
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 0.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.indigo,
              width: 0.0,
            ),
          ),
          labelStyle: const TextStyle(
            fontSize: 14,
          ),
          
          
          labelText: 'Order number',
          filled: true,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 1.0,
            ),
          ),
          errorStyle: const TextStyle(
            fontSize: 14,
          ),
        ),
    
    
    initialList: dummyList, label: label, controller: myController,itemsInView: 1,)),
      

















        Expanded(
          child:  DataTable(
                horizontalMargin: 20,
                columnSpacing: 10,
                columns: [
                  DataColumn(
                    label: Text(
                      "***",
                      style: style,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "ORDER",
                      style: style,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "DATE",
                      style: style,
                    ),
                  ),
                  
 DataColumn(
                    label: Text(
                      "TOTAL",
                      style: style,
                    ),
                  ),

                  DataColumn(
                    label: Text(
                      "STATUS",
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
                  orders.length,
                  (index) => dataRow(
                     context  ),
                ),
              ),
        )
      ],),),
    );}}

    
DataRow dataRow(
     BuildContext context) {
  return DataRow(
    cells: [
      DataCell(Text(
      '1',
        style: Theme.of(context).textTheme.caption,
      )),
       DataCell(Text(
      '154544',
        style: Theme.of(context).textTheme.caption,
      )),
      DataCell(Text(
       '20 Jul 2022',
        style: Theme.of(context).textTheme.caption,
      )),
      
       DataCell(Text(
      '150',
        style: Theme.of(context).textTheme.caption,
      )),
      DataCell(Text(
    'Paid',
        style: Theme.of(context).textTheme.caption,
      )),
      DataCell(
        Row(
          children: [
            ElevatedButton(
              child: const Text("Confirm",
                 ),
              style: ElevatedButton.styleFrom(
              
              ),
              onPressed: () {
               
              },
            ),
          ],
        ),
      ),
    ],
  );}