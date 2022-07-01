import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodyadmin/Orders.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'Provider/Themeprovider.dart';
void main() {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

var preferences = GetStorage();
  bool theme = preferences.read("isDarkTheme")?? false ;
  runApp(
   
     ChangeNotifierProvider(
        create: (context) => ThemeProvider(
            isDarkMode: theme
            
            
            ),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return Consumer<ThemeProvider>(
      builder: (context, themProvider, child) {
        
        
        return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      theme: themProvider.getTheme,
      home: const MyHomePage(title: 'ADMIN PANEL'),




    );
      });






  });
      
  }}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
     
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:  <Widget>[
           //stats
           statsbar(context),
           //stats card
          SizedBox(
            height: 240,
            child: statcard( context)),
 //all time stats
         const Text('All Orders'),
        const SizedBox(height: 10,),
            statsrow(context),
            //top selling products
            const SizedBox(height: 10,),
            const Text('Top Selling Foods'),
           topsale(context),



            ],
          ),
        ),
        
      ),
    
    );
  }



  
Widget topsale(dynamic context){
return    SizedBox(
  
      height: 300,
  
      
  
        child: GridView.builder(
  
            itemCount: 7,
  
            itemBuilder: (  context,index){
  
  
  
              return Card(
  
                color: Colors.white,
  
                child: Container(
  
                padding: const EdgeInsets.all(10),
  
                child: Column(
  
                  
  
                  crossAxisAlignment: CrossAxisAlignment.center,
  
                  children: [
  
                  Container(
  
                    color: Colors.red,
  
                    child: const Text('Orders:15')),
  
                const Expanded(child: SizedBox()),
  
   Center(child:  CachedNetworkImage(
  
    imageUrl: "https://urbanbutcher.ca/wp-content/uploads/2019/07/DSC_1141_web-600x380.jpg",
  
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
  
  
  
  
  
  
  
  
  const Text('Fries')
  
  
                ],),
  
              ),);
  
            }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  
              
  childAspectRatio: .7,
          crossAxisCount: 3,
  
          
  
          ))
);



}

Widget statsbar(dynamic context){
final List<String> items = [
    'Monthly',
    'Today',
    'Weekly',
   
  ];
  String? selectedValue;
  return Row(

    children: [Row(
      
      children: const [Icon(Icons.query_stats),
      
      SizedBox(width: 10,),
      Text('Order Stats')],),
      const Expanded(child: SizedBox()),
      

DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Text(
            'Overall Stats',
            style: TextStyle(
              fontSize: 12,
              color: Theme
                      .of(context)
                      .hintColor,
            ),
          ),
          items: items
                  .map((item) =>
                  DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
                  .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          buttonHeight: 30,
          buttonWidth: 90,
          itemHeight: 30,
        ),
      ),



      
      
      
      ],
  );
}

}









Widget statcard(dynamic context){
  navigator(int length){
if(length == 0){
   Navigator.of(context)
                            .push(MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                             const Orders()
                        ));
}
  }
  
  return 
    SizedBox(
    
      height: 100,
      child: GridView.builder(
          itemCount: 4,
          itemBuilder: (  context,index){

            return InkWell(
              onTap: (){
navigator(index);

              },
              child: Card(
                color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text('PENDING'),
                const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                     Text('62'),
                     Expanded(child: SizedBox()),
                    Icon(Icons.shopping_cart)
                  ],)
                ],),
              ),),
            );
          }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            
        crossAxisCount: 3,
        
        ),
    ));
    
}





Widget statsrow(BuildContext context){

items(String header, IconData icon, String count){
  return Container(
    margin: const EdgeInsets.only(left: 5,bottom: 10),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
      Text(header,
      style: const TextStyle(
        fontSize: 10
      ),
      overflow: TextOverflow.ellipsis,),
      const SizedBox(height: 7,),
       Icon(icon),
        const SizedBox(height: 7,),
       Text(count),

    ],),
  );
}




  return 
  SizedBox(
    height: 100,
    child: Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
      
      color: Theme.of(context).colorScheme.primary,
    
    borderRadius: const BorderRadius.all(Radius.circular(5))
  ),
      child: Row(children:  [
      
        items('All', Icons.shopping_basket, '25'),
        const RotatedBox(
          quarterTurns: 3,
          child: Divider(height: 50,)),
        items('Delivered', Icons.check, '12'),
        const RotatedBox(
          quarterTurns: 3,
          child: Divider(height: 50,)),
        items('Processing', Icons.timer_sharp, '15'),
        const RotatedBox(
          quarterTurns: 3,
          child: Divider(height: 50,)),
        items('Out For Delivery', Icons.motorcycle, '25'),
      ],),
    ),
    
  );
}


















Widget bar(){


return Card(
  child: Container(
    padding: const EdgeInsets.all(10),
    child: Column(
    children: const [

    ],
  )),
) ;

}