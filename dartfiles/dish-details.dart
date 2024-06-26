import 'package:demo_flutter_application/pages/model/dish.dart';
import 'package:flutter/material.dart';

class DishDetails extends StatelessWidget {
const DishDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    Dish dish = ModalRoute.of(context)!.settings.arguments as Dish;
    return Scaffold(
      appBar: AppBar(title: Text("Details of ${dish.name}"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              dish.imageURL,
              height: 100,
              width: 100,
            ),
            Text("${dish.price}",
            style: TextStyle(fontSize: 24),
            ),
            Text("${dish.rating}",
            style: TextStyle(fontSize: 24),
            )
            
          ],
        ),
      ),
    );
  }
}