# 🕋 Rāwh | رَّوْحِ – Your Companion in Worship & Remembrance

<p align="center">
  <img src="assets/images/logo/Logo Rawh.png" alt="Rawh App Logo" width="150"/>
</p>

<p align="center">
  <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Flutter-3.2+-02569B?logo=flutter&logoColor=white" alt="Flutter"/></a>
  <a href="https://dart.dev"><img src="https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart&logoColor=white" alt="Dart"/></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License"/></a>
  <a href="https://github.com/mohamedismail-dev/rawh_app/releases"><img src="https://img.shields.io/badge/Version-1.0.0-blue.svg" alt="Version"/></a>
</p>

<p align="center">
  <b>Rāwh</b> — because the soul, too, needs its sustenance.<br>
  From the tranquility of Quran recitation to the accuracy of prayer times and the rhythm of Tasbih, Rāwh combines all essential acts of worship into a single, easy, elegant companion. Designed with a breathtaking dark palette and built to work flawlessly offline, it's the Islamic toolkit you can depend on wherever you are at home, on the road, or in the quiet moments of your night.
</p>

## ✨ App Preview
<p align="center">
  <img src="assets/images/logo/HeroSNew.png" alt="Rawh Hero" width="600" style="max-width: 25%;" />
</p>

---

## 📱 Key Features

| Feature | Description |
|--------|-------------|
| 📖 **Holy Quran (114 Surahs)** | Read and search the full Quran offline. Smart "Recent" section for quick resumption. |
| 🕌 **Accurate Prayer Times & Athan** | Real-time countdown, Hijri/Gregorian dates, and automatic Azan audio trigger when prayer time arrives. |
| 🎧 **Audio Recitations & Live Radio** | Stream or download offline recitations from world-renowned Qaris, plus listen to a 24/7 live Quran radio. |
| 📿 **Digital Tasbih** | Interactive counter with a 33-bead cycle (Subhan Allah, Alhamdulillah, La ilaha illa Allah). |
| 📚 **Authentic Hadith** | A curated collection of verified hadiths for daily inspiration. |
| 🌅 **Morning & Evening Azkar** | Organized grid of daily supplications with categorized access. |
| 🌙 **Dark Spiritual Theme** | Minimalist UI with Deep Charcoal and Rich Islamic Gold (#856B3F). |
| 🚀 **Offline-First Architecture** | All core features work without internet. |

---

## 📸 App Screenshots

<div align="center">
  <h4>Onboarding</h4>
  <img src="assets/images/logo/screenshots/welcome1.png" alt="Onboarding" width="250"/>
  <img src="assets/images/logo/screenshots/welcome2.png" alt="Home Dashboard" width="250"/>
  
  <h4>Quran & Search | Prayer Times & Azan</h4>
  <img src="assets/images/logo/screenshots/quran.png" alt="Quran Surahs" width="250"/>
  <img src="assets/images/logo/screenshots/time.png" alt="Prayer Times" width="250"/>

  <h4>Tasbih, Hadith, Radio</h4>
  <img src="assets/images/logo/screenshots/hadith.png" alt="Digital Tasbih" width="250"/>
  <img src="assets/images/logo/screenshots/sebha.png" alt="Hadith Collection" width="250"/>
  <img src="assets/images/logo/screenshots/radio.png" alt="Hadith Collection" width="250"/>
</div>

---

## 🌙 Ramadan Splash Screen
<p align="center">
  <img src="assets/images/logo/screenshots/splashNew.png" alt="Ramadan Splash" width="300"/>
</p>
<p align="center"><i>Activated during the holy month of Ramadan.</i></p>

---

## 🏗️ Technical Stack & Architecture

- **Framework:** Flutter 3.2+ (Dart 3.0+)
- **State Management:** Provider (or BLoC/Riverpod – if used)
- **Architecture Pattern:** Modular Clean Architecture with separation of UI, logic, and data layers.
- **Offline Data:** Local Quran & Hadith data stored as structured JSON files.
- **Audio Engine:** `audioplayers` for background Azan and on-demand recitation.
- **Localization:** Arabic-first with full RTL support.
- **Performance:** Optimized timer isolation to prevent UI rebuilds on complex widgets (e.g., CarouselSlider).

### Key Packages
| Package | Usage |
|--------|-------|
| `carousel_slider` | Smooth prayer time page transitions |
| `audioplayers` | Azan & Quran playback |
| `hijri` | Hijri calendar conversions |
| `adhan_dart` | Prayer time calculations |
| `flutter_svg` | Vector icons & illustrations |
| `flutter_native_splash` | Native splash screen |

See the complete list in [`pubspec.yaml`](pubspec.yaml).

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.2.0)
- Android Studio / VS Code
- A physical device or emulator (API 21+ / iOS 13+)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/mohamedismail-dev/rawh_app.git
   cd rawh_app
