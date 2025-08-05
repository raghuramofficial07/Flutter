<!-- GitHub Project Banner -->
<p align="center">
  <img src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" alt="Project Banner" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/ThemeMode-Dark%20%26%20Light-black?logo=flutter&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/Built%20by-RaghuRam-black?labelColor=black&color=black">
</p>

# » Theme.of(context) — Flutter Dark & Light Mode Mastery

## » Table of Contents
- Introduction
- Theme Definitions (Light & Dark)
- themeMode: How It Selects the Right Theme
- Theme.of(context): How It Works Behind the Scenes
- Code Example with Explanation
- Common Questions & Clarifications
- Real-World Use
- Quick Recap Table
- Author Footer

## » Introduction

This project explains **how to implement and understand light/dark mode switching in Flutter** using `Theme.of(context)`. It covers real code, deep explanations, and Q&A-style doubts with accurate answers like a personal tutor.

## » Theme Definitions

You define both themes inside `MaterialApp`:

```dart
theme: ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.black),
  ),
),
darkTheme: ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
  ),
),
```

## » themeMode: How It Selects the Theme

```dart
themeMode: ThemeMode.system,
```

This checks your device’s system brightness and automatically uses:
- `theme` if system is in light mode
- `darkTheme` if system is in dark mode

No manual switching needed.

## » Theme.of(context): What It Does

It reads the **currently active theme** in your widget tree and gives access to it:

```dart
final theme = Theme.of(context);
final bgColor = theme.scaffoldBackgroundColor;
final textColor = theme.textTheme.bodyMedium?.color;
```

It will give you the color values from the right theme (dark or light) based on what is active.

### Internally:

- If system is in dark mode → darkTheme is injected into the tree
- `Theme.of(context)` reads that injected `ThemeData`
- You now get dark colors in your widgets automatically

## » Code Example

```dart
final background = Theme.of(context).scaffoldBackgroundColor;
final textColor = Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black;
```

This means:
- Get the current scaffold background from the theme (dark or light)
- Get the current text color — fallback to black if undefined

## » Common Questions Answered

### Q: If I change `darkTheme:` to `mode2:`, will it work?
**A:** No. Flutter looks for the exact key `darkTheme:`. Any other name will be ignored.

### Q: Does `Theme.of(context)` paint screen inch by inch?
**A:** No, it paints the **entire scaffold area** with the color in one go. No inch-by-inch logic is involved.

### Q: If I store `Theme.of(context)` in a variable, can I reuse it?
**A:** Yes. That’s a good practice for cleaner code. Example:

```dart
final theme = Theme.of(context);
final color = theme.textTheme.bodyMedium?.color;
```

### Q: What happens if I don’t use `Theme.of(context)`?
**A:** Your app won’t auto-adapt to dark/light mode. Hardcoded styles will stay fixed.

## » Real-World Use

Use this logic to build themes for:
- Chat apps
- Notepad apps
- Finance apps with custom color palettes
- System-like UI apps

It ensures the user experience respects their system preferences.

## » Quick Recap Table

| Concept                     | Description                                                  |
|-----------------------------|--------------------------------------------------------------|
| `theme:`                    | Light theme definition                                       |
| `darkTheme:`                | Dark theme definition                                        |
| `themeMode: ThemeMode.system` | Selects theme based on device settings                    |
| `Theme.of(context)`         | Fetches current theme data (dark/light auto)                 |
| `scaffoldBackgroundColor`   | Used for app screen background                              |
| `textTheme.bodyMedium?.color` | Dynamic text color based on theme                        |

## » Author Footer

**Created By:** Vemparala Sri Satya RaghuRam  
**License:** MIT  
**Platform:** Flutter (Dart)

<p align="left">
  <img src="https://img.shields.io/badge/%23BeyondCertifications-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23IndustryOriented-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23CodeWithRaghuRam-black?logo=tag&logoColor=white&labelColor=black&color=black">
</p>
