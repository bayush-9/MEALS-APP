import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = 'meal-detail';
  final Function togglefavourite;
  final Function isfavourite;

  MealDetailsScreen(this.isfavourite, this.togglefavourite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              height: 30,
              child: Text(
                'Ingredients',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.purple,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              height: 100,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Container(
                  height: 30,
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(selectedMeal.ingredients[index]),
                      ],
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              height: 30,
              child: Text(
                'Steps',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 200,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      (index + 1).toString() + ' ' + selectedMeal.steps[index],
                    ),
                  ),
                ),
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isfavourite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => togglefavourite(mealId),
      ),
    );
  }
}
