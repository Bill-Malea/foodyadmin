import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodyadmin/Bottomnav/FoodNavTab.dart';
import 'package:foodyadmin/Drawer.dart';
import 'package:foodyadmin/Home/Home.dart';
import 'package:foodyadmin/Orders.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'Bottomnav/FoodNavTab.dart';
import 'Bottomnav/FoodNavTab.dart';
import 'Bottomnav/FoodNavTab.dart';
import 'Categories/Categories.dart';
import 'Customers/Customers.dart';
import 'Delivery/Deliveryman.dart';
import 'Provider/Addcategory.dart';
import 'Provider/FoodsNavbar.dart';
import 'Provider/Themeprovider.dart';
void main() {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

var preferences = GetStorage();
  bool theme = preferences.read("isDarkTheme")?? false ;
  runApp(
   
     MultiProvider(
      providers: [  ChangeNotifierProvider(
        create: (context) => FoodNavBar(),
      ),
      ChangeNotifierProvider(
        create: (context) => AddCategory(),
      ),
       ChangeNotifierProvider(
        create: (context) => AddCategory(),
      ),
      
      
      
      
      ],
       child: ChangeNotifierProvider(
          create: (context) => ThemeProvider(
              isDarkMode: theme
              
              
              ),
          child: const MyApp()),
     ),
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
      home: const Home(),




    );
      });






  });
      
  }}








class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   final _categorieskey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    List<Widget> tabWidgets = <Widget>[
      const MyHomePage(),
     Categories (formkey: _categorieskey,),
      const DeliveryMan (),
      Categories (formkey: _categorieskey,),
      const Customers ()
    ];
   
    var _selected =
        Provider.of<FoodNavBar>(context).selectetab;
    return Scaffold(
      appBar: AppBar(
       
        centerTitle: true,
        title: const Text(
          "ADMIN PANEL",
        ),
        elevation: 0,
      ),
       drawer: const Drawerwidg(),
       bottomNavigationBar:  const NavigationTabs (),
      body: 
          SingleChildScrollView(child: tabWidgets.elementAt(_selected)),
        
      
    );
  }
}

































