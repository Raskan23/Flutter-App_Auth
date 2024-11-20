import 'package:flutter/material.dart';
import '../../utils/constant/app_image.dart'; // Import your AppImages constants

// Sample Category Model
class Category {
  final String name;
  final String imageUrl;

  Category({required this.name, required this.imageUrl});
}

// Main AllCategory Widget
class AllCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All Categories',
      debugShowCheckedModeBanner: false,  // Removes the debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial',  // Modern font
        textTheme: TextTheme(
        ),
      ),
      home: AllCategoryPage(),
    );
  }
}

// AllCategoryPage Widget
class AllCategoryPage extends StatelessWidget {
  // Sample categories list using paths from AppImages
  final List<Category> categories = [
    Category(name: 'A/C Repair', imageUrl: AppImages.ACRepair),
    Category(name: 'Carpenter', imageUrl: AppImages.Carpenter),
    Category(name: 'Electrician', imageUrl: AppImages.Electrician),
    Category(name: 'Gardening', imageUrl: AppImages.Gardening),
    Category(name: 'Mason', imageUrl: AppImages.Mason),
    Category(name: 'Mechanic', imageUrl: AppImages.Mechanic),
    Category(name: 'Plumber', imageUrl: AppImages.Plumber),
    Category(name: 'Roofing', imageUrl: AppImages.Roofing),
    Category(name: 'Welder', imageUrl: AppImages.Welder),
    Category(name: 'Painter', imageUrl: AppImages.painter),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Categories'),
        backgroundColor: Colors.white,
        elevation: 0,  // Flat look for AppBar
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(12.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Optionally handle onTap for card interaction
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),  // Rounded corners
              ),
              elevation: 4.0,  // Shadow effect
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15.0),  // Rounded image top
                      ),
                      child: Image.asset(
                        categories[index].imageUrl, // Use the asset image from AppImages
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      categories[index].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
