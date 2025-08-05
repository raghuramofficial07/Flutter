<!-- GitHub Project Banner -->
<p align="center">
  <img src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" alt="Project Banner" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-black?logo=flutter&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/Built%20by-RaghuRam-black?labelColor=black&color=black">
</p>

# » Flutter Theme Naming Explained

## » Table of Contents
- Purpose
- Why Theme & darkTheme matter
- Allowed Custom Names
- Invalid Naming Examples
- Summary Cheat Sheet
- Author Footer

---

## » Purpose

This file explains **why we must use `theme:` and `darkTheme:` inside `MaterialApp`**, and what kind of naming is allowed or disallowed in large projects where you modularize your theme setup.

---

## » Why `theme:` and `darkTheme:` Are Mandatory

Flutter’s `MaterialApp` expects fixed parameter names for themes:

```dart
MaterialApp(
  theme: ...,        // for light theme
  darkTheme: ...,    // for dark theme
  themeMode: ThemeMode.system,
)
```

These keys (`theme`, `darkTheme`, `themeMode`) are **predefined Flutter parameters**.

If you rename them to anything else like `lightTheme` or `darkThemedMode`, it will fail.

---

## » ✅ Custom Theme Variable Names Are Allowed

You **can define** your themes with any variable name:

```dart
final ThemeData lightAppTheme = ThemeData(...);
final ThemeData customDarkTheme = ThemeData(...);
```

Then pass them correctly like this:

```dart
MaterialApp(
  theme: lightAppTheme,         // ✅ Correct use
  darkTheme: customDarkTheme,   // ✅ Correct use
  themeMode: ThemeMode.system,
)
```

This is allowed because you’re still passing values to the correct keys.

---

## » ❌ Invalid Theme Parameter Names

You cannot change the keys inside `MaterialApp`:

```dart
MaterialApp(
  lightTheme: lightAppTheme,       // ❌ Invalid - Flutter doesn't recognize
  darkModeTheme: customDarkTheme,  // ❌ Invalid - wrong key
)
```

Flutter will throw:
```
Error: The named parameter 'lightTheme' isn't defined.
```

---

## » Summary Cheat Sheet

| Theme Variable Name         | Used With               | Valid? |
|----------------------------|--------------------------|--------|
| `lightAppTheme`            | `theme: lightAppTheme`   | ✅ Yes |
| `customDarkTheme`          | `darkTheme: customDarkTheme` | ✅ Yes |
| `theme: ThemeData(...)`    | Used inline              | ✅ Yes |
| `lightTheme: ...`          | ❌ Not a real parameter   | ❌ No  |
| `darkThemedMode: ...`      | ❌ Invalid key            | ❌ No  |

---

## » Final Notes

- `theme:` and `darkTheme:` must be used as **parameter names** in `MaterialApp`.
- The **variable names can be anything** — just plug them in the right place.
- This gives you clean separation, especially in large apps (`lib/theme/app_theme.dart` etc).

---

## » Author Footer

**Created By:** Vemparala Sri Satya RaghuRam  
**License:** MIT  
**Platform:** Flutter (Dart)

<p align="left">
  <img src="https://img.shields.io/badge/%23BeyondCertifications-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23IndustryOriented-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23CodeWithRaghuRam-black?logo=tag&logoColor=white&labelColor=black&color=black">
</p>
