import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final drink;
  const Details({Key? key, @required this.drink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purple,
            Colors.deepPurpleAccent
          ]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text(drink["strDrink"]),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ID : ${drink["idDrink"]}",
                  style:const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  )),
            const  SizedBox(
                height: 20,
              ),
              Hero(
                  tag: drink["idDrink"],
                  child: CircleAvatar(
                    radius: 150.0,
                    backgroundImage: NetworkImage(drink["strDrinkThumb"]),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
