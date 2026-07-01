# Flutter Micro Lab #001 — Physics Button

A polished Flutter button that demonstrates how subtle animations can make a simple interaction feel more natural and responsive.

Instead of behaving like a static UI element, the button reacts to touch with realistic feedback—compressing when pressed and springing back into place on release—all using Flutter's built-in animation widgets.

---


## ✨ Features

* 🟦 Squish animation on press
* 🟦 Elastic bounce on release
* 🟦 Dynamic shadow changes
* 🟦 Smooth scale transition
* 🟦 Modern gradient design
* 🟦 Responsive touch feedback
* 🟦 Zero third-party packages

---

## 🧠 Concepts Explored

This micro lab focuses on creating tactile UI interactions using Flutter's implicit animations.

Widgets used:

* `GestureDetector`
* `AnimatedScale`
* `AnimatedContainer`
* `AnimatedDefaultTextStyle`
* `Matrix4` transformations
* `Curves.elasticOut`

---

## 📂 Project Structure

```text
lib/
│
├── core
│   └──constants/
│      └── app_colors.dart
│
├── screens/
│   └── home_page.dart
│
├── widgets/
│   └── physics_button.dart
│
└── main.dart
```

---

## 🚀 Getting Started

Clone the project and run:

```bash
flutter pub get
flutter run
```

---

## 🎯 Goal

This experiment demonstrates that polished user experiences don't require complex physics engines or external packages.

By combining a few of Flutter's built-in animation widgets, it's possible to create interactions that feel more responsive, engaging, and enjoyable.

---

## 📦 Dependencies

No third-party packages are used.

Everything is built using Flutter's built-in framework.

---

## 💡 Why This Matters

Small interaction details often have a bigger impact on user experience than users consciously notice.

A button that compresses, bounces, and casts a dynamic shadow communicates responsiveness and quality, making the interface feel more refined and intuitive.

This lab explores one of those small details.

---

## 📚 Part of Flutter Micro Labs

This project is the first experiment in the **Flutter Micro Labs** series—a growing collection of small, focused Flutter projects exploring UI, animations, interactions, and engineering techniques.

Explore the complete collection in the main repository.

---

## ⭐ Support

If you found this project useful or inspiring, consider giving the repository a ⭐.

Happy coding! 🚀
