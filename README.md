# 🕋 Rawh App | تطبيق رَوْح

**Rawh (رَوْح)** is a premium, beautifully crafted, and **offline-first** Islamic utility application built using **Flutter** and **Dart**. Designed with modern UI/UX principles, it seamlessly integrates essential spiritual tools into a lightweight, high-performance mobile experience. 

The application is engineered to eliminate data-dependency, ensuring that core features like Quran reading, tracking, and localized counters work completely **without an internet connection**.

---

## 📱 User Journey & Architecture (Modules)

### 1. Onboarding Experience
* A goal-oriented onboarding flow that introduces users to the app's core ecosystem, optimizing user retention from the first launch.

### 2. Core Dashboard & Navigation
* **The Holy Quran Module (114 Surahs):** * Features an optimized **Local Search** mechanism to find Surahs instantly.
  * **Smart "Recent" Section:** Tracks and displays the last opened Surah for quick-resume functionality.
* **Authentic Hadith Hub:** A dedicated repository displaying verified, high-quality Hadith screens for daily reading.
* **Interactive Tasbih (Digital Beads):** An offline, tap-responsive counter pre-configured with a 33-bead cycle (*Subhan Allah, Alhamdu Lillah, La ilaha illa Allah*).
* **Audio Recitations (On-Demand):** An immersive audio streaming player allowing users to listen to diverse world-class Qura'a and Surahs.
* **Advanced Prayer & Time Management:** * Real-time countdown clock synchronized with Gregorian and Hijri calendars.
  * **Automated Audio Trigger:** Executes background audio playback of the Azan precisely when a prayer time is reached.
* **Azkar Utility System:** Categorized grid navigation covering vital daily supplications (Morning, Evening, Pre-Prayer, and Post-Prayer Azkar).

---

## 🛠️ Technical Stack & Implementation Details

* **Framework:** Flutter (Cross-Platform Android & iOS)
* **Architecture:** Clean, modular structure separating the UI layer from time-tracking/state-management logic.
* **Optimization Highlight:** Implemented strict state isolation using managed timers. This ensures the countdown clock updates every second *without* triggering heavy visual rebuilds on complex elements like the `CarouselSlider`.
* **Key Packages & Dependencies:**
  * `carousel_slider` for fluid prayer time transitions.
  * `audioplayers` for local and streamed audio handling.
  * `hijri` for accurate lunar calendar conversions.
  * `flutter_svg` for crisp, vector-based design assets.

---

## 🎨 UI/UX Visual Identity
* **Design Approach:** Dark-themed spiritual minimalism.
* **Primary Palette:** Deep Charcoal Black (Background) paired with Rich Islamic Gold (`#856B3F`) to evoke a sense of serenity and premium branding.

---

## 📦 Local Installation & Setup

1. **Clone the project:**
   ```bash
   git clone [https://github.com/YOUR_USERNAME/rawh_app.git](https://github.com/YOUR_USERNAME/rawh_app.git)
