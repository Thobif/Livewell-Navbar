import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  List<FoodItem> foodItems = [
    FoodItem(name: 'Salad', carbs: 20, protein: 5),
    FoodItem(name: 'Chicken', carbs: 0, protein: 30),
    FoodItem(name: 'Rice', carbs: 45, protein: 8),
    FoodItem(name: 'Steak', carbs: 0, protein: 50),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (BuildContext context, int index) {
        FoodItem item = foodItems[index];
        return ListTile(
          title: Text(item.name),
          subtitle: Text('Carbs: ${item.carbs}g, Protein: ${item.protein}g'),
        );
      },
    );
  }
}

class FoodItem {
  final String name;
  final int carbs;
  final int protein;

  FoodItem({required this.name, required this.carbs, required this.protein});
}