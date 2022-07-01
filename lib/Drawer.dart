
import 'package:flutter/material.dart';

class Drawerwidg extends StatefulWidget {
  const Drawerwidg({Key? key}) : super(key: key);

  @override
  _DrawerwidgState createState() => _DrawerwidgState();
}

class _DrawerwidgState extends State<Drawerwidg> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
   
    itemsdrawer(IconData icon,String name,dynamic fn){
      return InkWell(
        onTap: fn,   
        child: Container(
          margin: const EdgeInsets.only(bottom: 15,left: 5),
          child: Row(
            children: [
              Icon(icon,size: 14,),
const SizedBox(width: 10),
              Text(name,
              style: const TextStyle(
                fontSize: 12,
                color:  Colors.black,
              ),)
            ],
      
          ),
        ),
      );
    }
    return Card(
      color: Theme.of(context).colorScheme.primary,
 shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                      
                        topRight: Radius.circular(20),
                      
                        bottomRight: Radius.circular(20),
                      ),
                    ),
      
      child: Container(
        
    
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width *.6,
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
          
          const SizedBox(
            height: 180,
          ),
          const Divider(
            color: Colors.black12,
            thickness: 1.0,
          ),
          const SizedBox(
            height: 5,
          ),
           Text('My Account',style: TextStyle(
            fontSize: 11,
            color: Theme.of(context).textTheme.bodyText1?.color
          ),),
          const SizedBox(
            height: 25,
          ),
           itemsdrawer(Icons.card_travel,'Orders',orders),
           itemsdrawer(Icons.favorite_outline_sharp,'Wishlist',wishlist),
            itemsdrawer(Icons.place,'Address',(){}),
             itemsdrawer(Icons.people,'Invite',(){}),
              itemsdrawer(Icons.share,'Share',(){}),
               const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black12,
            thickness: 1.0,
          ),
          const SizedBox(
            height: 5,
          ),
         Text('Support',style: TextStyle(
            fontSize: 11,
            color: Theme.of(context).textTheme.bodyText1?.color
          ),),
          const SizedBox(
            height: 25,
          ),
          itemsdrawer( Icons.call,'Call',makecall),
          itemsdrawer(Icons.email,'Email', sendemail),
          itemsdrawer(Icons.whatsapp,'Whatsapp',(){}),
          itemsdrawer(Icons.ac_unit,'FAQ',(){}),
           const Divider(
            color: Colors.black12,
            thickness: 1.0,
          ),
 itemsdrawer(Icons.logout,'Log out',(){
//     GoogleSignIn().signOut();
//  FirebaseAuth.instance.signOut();
 }),

        ],),
      ),
    );}
    
   makecall() async{
    //   final Uri launchUri = Uri(
    //   scheme: 'tel',
    //   path: '0727800223',
    // );
    //await launchUrl(launchUri);
    }


orders(){
  
}

wishlist(){
 
}
    sendemail(){
      String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
final Uri emailUri = Uri(
  scheme: 'mailto',
  path: 'biltriq2@gmail.com',
  query: encodeQueryParameters(<String, String>{
    'subject': 'Foodie Customer Equiry'
  }),
);

//launchUrl(emailUri);
    }
    }
