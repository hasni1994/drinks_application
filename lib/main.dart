import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'details.dart';

 main() => runApp(MyApp());

 class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: "My First Application",
       home: Home(),
       theme: ThemeData(
           primarySwatch: Colors.deepPurple
       ),
     );
   }
 }


 class Home extends StatefulWidget {
   const Home({Key? key}) : super(key: key);

   @override
   _HomeState createState() => _HomeState();
 }

 class _HomeState extends State<Home> {
   Uri url=Uri.parse("https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail");
   var data, drinks;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async{
      data= await http.get(url);
       drinks=jsonDecode(data.body)["drinks"];
       setState(() {

       });
  }
   @override
   Widget build(BuildContext context) {
     return Container(
       decoration: const BoxDecoration(
         gradient:  LinearGradient(
             colors: [
               Colors.purple,
               Colors.deepPurpleAccent
             ])
       ),
       child: Scaffold(
         backgroundColor: Colors.transparent,
         appBar: AppBar(
           backgroundColor: Colors.transparent,
           elevation: 0.0,
           title: const Text("Drinks Details Application  "),
         ),
         body:  Container(
           color: Colors.transparent,
           child: data == null?  Center(
               child:  Container(
                   child: const CircularProgressIndicator(color: Colors.white,))):ListView.builder(
               itemCount: drinks.length, itemExtent: 50.0,
                 itemBuilder: (context,index){
                   var drink=drinks[index];
                    return ListTile(
                      leading: Hero(
                        tag: drink["idDrink"],
                          child: CircleAvatar(backgroundImage: NetworkImage(drink["strDrinkThumb"]),)),
                      title: Text(drink["idDrink"],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),),
                      subtitle: Text(drink["strDrink"],
                      style: const TextStyle(
                        color: Colors.white70,
                      ),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(drink:drink)));
                      },
                    );
                 }
             ),
         ),
       ),
     );
   }
 }
