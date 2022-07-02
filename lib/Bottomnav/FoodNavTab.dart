import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/FoodsNavbar.dart';
import 'TabItem.dart';

class NavigationTabs extends StatefulWidget {
  const NavigationTabs({
    Key? key,
  }) : super(key: key);
  @override
  _NavigationTabsState createState() =>
      _NavigationTabsState();
}

class _NavigationTabsState extends State<NavigationTabs> {
  @override
  Widget build(BuildContext context) {
    final selected =
        Provider.of<FoodNavBar>(context).selected;
    return Container(
   
     decoration: const BoxDecoration(
    borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20) ),
    color: Color(0xffffb800),
  ),
  padding: const EdgeInsets.only(left: 15,right: 15),
      height: 75,
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        
          TabItem(
            text: 'Home',
            active: selected[0],
            touched: () {
              setState(() {
                Provider.of<FoodNavBar>(context,
                        listen: false)
                    .select(0);
              });
            },
            icon:Icons.home,
          ),
          const SizedBox(
            width: 20,
          ),
          TabItem(
            text: 'Categories',
            active: selected[1],
            touched: () {
              setState(() {
                Provider.of<FoodNavBar>(context,
                        listen: false)
                    .select(1);
              });
            },
            icon: Icons.category,
          ),
          const SizedBox(
            width: 20,
          ),
          TabItem(
            text: 'Delivery',
            active: selected[2],
            touched: () {
              setState(() {
                Provider.of<FoodNavBar>(context,
                        listen: false)
                    .select(2);
              });
            },
            icon: Icons.delivery_dining,
          ),
          const SizedBox(
            width: 20,
          ),
          TabItem(
            text: 'Reports',
            active: selected[3],
            touched: () {
              setState(() {
                Provider.of<FoodNavBar>(context,
                        listen: false)
                    .select(3);
              });
            },
            icon: Icons.report,
          ),
          const SizedBox(
            width: 20,
          ),
          TabItem(
            text: 'Customers',
            active: selected[4],
            touched: () {
              setState(() {
                Provider.of<FoodNavBar>(context,
                        listen: false)
                    .select(4);
              });
            },
            icon: Icons.people,
          ),
          
        ],
      ),
    );
  }
}
