# Flutter Micro Lab #002 — Glass Weather Card

A premium weather dashboard built with Flutter, showcasing a handcrafted **glassmorphism UI** using only Flutter's built-in widgets.

This micro lab explores how blur, gradients, reflections, shadows, and subtle floating animations can work together to create a modern glass interface without relying on third-party UI packages.

---

## 📱 Preview

<p align="center">
  <img src="assets/glass-weather-card.mp4" width="340" alt="Glass Weather Card Preview"/>
</p>

---

## ✨ Features

- 💎 Premium Glassmorphism UI
- 🌤 Modern Weather Dashboard
- 🌫 Frosted Glass Effect using `BackdropFilter`
- ✨ Glass reflections & highlights
- ☀️ Soft glowing weather icon
- 🌇 Scenic background support
- 🌊 Smooth floating card animation
- 📅 Weekly weather forecast section
- 📱 Responsive layout
- 🚀 Built without third-party packages

---

## 📁 Project Structure

```text
002_glass_weather_card/
│
├── assets/
│   └── images/
│       ├── cloud.png
│       └── wheather.png
│
├── lib/
│   ├── core/
│   │   ├── constants/
│   │   │   └── app_colors.dart
│   │   └── theme/
│   │       └── app_theme.dart
│   │
│   ├── screens/
│   │   └── home_page.dart
│   │
│   ├── widgets/
│   │   ├── glass_container.dart
│   │   └── weather_card.dart
│   │
│   └── main.dart
│
├── android/
├── ios/
├── linux/
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```

---

## 🎯 What This Lab Explores

Instead of building a complete weather application, this lab focuses on one challenge:

> **Designing a premium glass interface that feels elegant, lightweight, and realistic using Flutter's rendering engine.**

The emphasis is on visual polish, reusable UI components, and smooth user experience.

---

## 🧠 Flutter Concepts Used

- StatelessWidget
- Custom Widgets
- BackdropFilter
- ImageFilter.blur
- ClipRRect
- Stack
- LinearGradient
- BoxDecoration
- BoxShadow
- Border
- AnimatedBuilder
- AnimationController
- Transform.translate
- MediaQuery
- Asset Images
- Responsive Layout

---

## 📦 Dependencies

This project intentionally uses **no third-party UI packages**.

Everything is built using Flutter's official framework.

---

## 💡 Why This Project?

Glassmorphism has become a popular design trend, but achieving a convincing result requires much more than simply adding blur.

This micro lab demonstrates how multiple visual layers—including gradients, highlights, shadows, transparency, and motion—can be combined to create a polished glass interface while keeping the implementation clean and reusable.

---

## 📚 Flutter Micro Labs

This project is part of the **Flutter Micro Labs** series.

Each lab explores one focused Flutter concept through a compact, production-inspired implementation.

Current progress:

- ✅ Micro Lab #001
- ✅ Micro Lab #002 — Glass Weather Card
- 🚧 More coming soon...

---

## 🤝 Contributions

Suggestions and improvements are always welcome.

Feel free to fork the project, experiment, and open a pull request.

---

## ⭐ Support

If you found this project useful or inspiring, consider giving the repository a **⭐**.

It helps others discover the project and motivates future Flutter Micro Labs.

---

## 📄 License

This project is licensed under the MIT License.
