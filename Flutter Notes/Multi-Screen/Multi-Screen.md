<img width="841" alt="Screenshot 2025-06-22 at 10 51 31 AM" src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" />

# CodeBook .Md

» Topic Title: Flutter UI Concepts – GridView, InkWell, Navigation, and Drawer

» Table of Contents
1. Introduction
2. GridView in Flutter
3. InkWell Widget
4. Navigator.push and Navigator.pop
5. MaterialPageRoute and Screen Stack
6. Adding a Side Drawer
7. Adding Food Filters
8. Quick Reference Table
9. Author Footer

---

» 1. Introduction
This note explains crucial Flutter UI and navigation concepts to help build clean, interactive, and scalable multi-screen apps. Topics include `GridView`, `InkWell`, screen transitions using `Navigator`, and implementing UI components like side drawers and filters.

---

» 2. GridView in Flutter

GridView is used to display items in a 2D scrollable grid.

```dart
GridView.count(
  crossAxisCount: 2, // Number of columns
  children: [
    Card(child: Center(child: Text('Item 1'))),
    Card(child: Center(child: Text('Item 2'))),
  ],
)
```
Use when you need grid-based layouts like photo galleries or category tiles.

Concept Highlights

GridView.count is simplest for fixed column count.
Items are widgets, can be Card, Container, InkWell, etc.
Wrap items with InkWell for tap interactions.
» 3. InkWell Widget

InkWell gives touch feedback (ripple effect) on user taps.

```dart
InkWell(
  onTap: () {
    print("Tapped!");
  },
  child: Container(
    padding: EdgeInsets.all(20),
    child: Text("Tap Me"),
  ),
)
```
Concept Highlights

Use it on custom widgets to mimic button behavior.
Must have a material ancestor (like Scaffold or MaterialApp).
Perfect for tappable cards, images, or grid tiles.

» 4. Navigator.push and Navigator.pop

Flutter uses a stack to manage screens (routes).

🠚 Navigator.push() adds a new screen.
🠚 Navigator.pop() removes the current screen and returns to the previous.

```dart
// To navigate to a new screen
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => NewScreen()),
);

// To go back
Navigator.pop(context);
```
Concept Highlights

Pass data between screens using constructors.
Navigator.pop(context, result) can return data to previous screen.

» 5. MaterialPageRoute and Screen Stack

MaterialPageRoute is a widget that wraps the target screen in a route.

MaterialPageRoute(
  builder: (context) => TargetScreen(),
)
🠚 Helps Flutter manage page transitions with default animations (slide from right).

Screen Stack Analogy

Think of screens as stacked cards.
push() = add a card on top.
pop() = remove the top card.
Stack ensures you can return to previous screen easily.
» 6. Adding a Side Drawer

Used for app-wide navigation (like Home, Filters, Settings).

```dart
Drawer(
  child: ListView(
    children: [
      DrawerHeader(child: Text("My App")),
      ListTile(
        title: Text("Filters"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => FilterScreen()),
          );
        },
      ),
    ],
  ),
)
🠚 Add the drawer to the Scaffold:

Scaffold(
  appBar: AppBar(title: Text("Home")),
  drawer: MyDrawer(), // ← Here
  body: ...,
)
```
Concept Highlights

Use DrawerHeader for app info or logo.
ListTile for navigation options.
» 7. Adding Food Filters (Basic Example)

Suppose you want to let users toggle dietary filters (vegan, gluten-free).
```dart
SwitchListTile(
  title: Text('Gluten-Free'),
  value: _isGlutenFree,
  onChanged: (newValue) {
    setState(() {
      _isGlutenFree = newValue;
    });
  },
)
```
🠚 Combine multiple SwitchListTile widgets for different filters.

🠚 Store filter state in a Map<String, bool> and pass it between screens.

Concept Highlights

Useful for apps like recipe, shopping, or restaurant apps.
Use state management (setState, Provider, etc.) to handle filters globally.
» 8. Quick Reference Table

Feature	Purpose	Key Widget/API	Notes
Grid View	Display items in grid	GridView.count	Use crossAxisCount for columns
InkWell	Add tap feedback to widgets	InkWell	Wrap around any widget
Screen Navigation	Navigate to new screen	Navigator.push	Use with MaterialPageRoute
Screen Back	Return to previous screen	Navigator.pop	Can return data via pop
Screen Transitions	Animated screen change	MaterialPageRoute	Default slide transition
Drawer	Side menu for navigation	Drawer, ListTile	Attach to Scaffold as drawer
Filters	Toggle user preferences	SwitchListTile	Use for dietary/settings filters

» 9. Author Footer

> Created by Vemparala Sri Satya RaghuRam
