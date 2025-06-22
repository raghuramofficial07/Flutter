<img width="841" alt="Screenshot 2025-06-22 at 10 51 31 AM" src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" />

## Basic Employee Details Multi-Screen App

📌 Purpose
Demonstrates navigation (Navigator.push and Navigator.pop) with two screens: Input and Display.

📄 main.dart

```dart
import 'package:flutter/material.dart';

void main() => runApp(EmployeeApp());

class EmployeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmployeeFormScreen(),
    );
  }
}

class EmployeeFormScreen extends StatefulWidget {
  @override
  _EmployeeFormScreenState createState() => _EmployeeFormScreenState();
}

class _EmployeeFormScreenState extends State<EmployeeFormScreen> {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _salaryController = TextEditingController();

  void _goToDetailsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmployeeDetailsScreen(
          name: _nameController.text,
          id: _idController.text,
          salary: _salaryController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Enter Employee Details")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: _idController, decoration: InputDecoration(labelText: 'ID')),
            TextField(controller: _salaryController, decoration: InputDecoration(labelText: 'Salary')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _goToDetailsPage,
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

class EmployeeDetailsScreen extends StatelessWidget {
  final String name, id, salary;

  EmployeeDetailsScreen({required this.name, required this.id, required this.salary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employee Details")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: $name"),
            Text("ID: $id"),
            Text("Salary: $salary"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}

```

## Advanced Multi-Screen App 
- TechStackFoodApp: Multi-Screen Flutter App (4 Files)

#### main.dart

```dart
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(FoodApp());

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food Grid App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: FoodHomeScreen(),
    );
  }
}
```

#### screens/home_screen.dart

```dart
import 'package:flutter/material.dart';
import '../screens/food_detail_screen.dart';
import '../widgets/food_tile.dart';

class FoodHomeScreen extends StatelessWidget {
  final List<Map<String, String>> foodItems = [
    {"title": "Pizza", "desc": "Cheesy delight"},
    {"title": "Burger", "desc": "Crunchy and juicy"},
    {"title": "Pasta", "desc": "Italian goodness"},
    {"title": "Salad", "desc": "Healthy pick"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Food Grid")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Text("Filters", style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: Text("Veg Only"),
              onTap: () {
                // TODO: Handle veg filter
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("High Protein"),
              onTap: () {
                // TODO: Handle protein filter
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        itemCount: foodItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two tiles per row
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final food = foodItems[index];
          return FoodTile(
            title: food["title"]!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FoodDetailScreen(food: food),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
```
#### screens/food_detail_screen.dart

```dart
import 'package:flutter/material.dart';

class FoodDetailScreen extends StatelessWidget {
  final Map<String, String> food;

  FoodDetailScreen({required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(food["title"]!)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(food["title"]!, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(food["desc"]!, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Back to Grid"),
            ),
          ],
        ),
      ),
    );
  }
}
```

#### widgets/food_tile.dart

```dart
import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  FoodTile({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
```

