# 🌈 Flutter Task Manager App — Back4App (BaaS)

A cloud-connected **Task Manager App** built with **Flutter** and **Back4App Parse Server**.
Users can securely register, log in, manage tasks, and store data in the cloud ☁️✨

---

## ✨ Features

* 🔐 **User Authentication** (Register / Login)
* 🗂️ **Task CRUD** (Create / Read / Update / Delete)
* 🔄 **Manual Refresh**
* 🎨 **Color-coded Tasks** (Green=Completed, Grey=Pending)
* 🚪 **Secure Logout**
* ☁️ **Cloud Database Sync** via Back4App

---

## 🧠 Tech Stack

* **Flutter (Dart)**
* **Back4App (Parse Server)**
* **Provider State Management**
* **Parse Cloud Database**

---

## 📸 Screenshots

screenshots/login.png
screenshots/task_list.png
screenshots/task_form.png
```

|            Login           |            Task List           |            Task Form           |
| :------------------------: | :----------------------------: | :----------------------------: |
| ![](screenshots/login.png) | ![](screenshots/task_list.png) | ![](screenshots/task_form.png) |

```
---

## 🚀 Run the App

```bash
git clone https://github.com/yourusername/flutter-task-manager-back4app.git
cd flutter-back4App-task-manager
flutter pub get
flutter run
```

Set your Back4App keys in **lib/main.dart**:

```dart
const String appId = "YOUR_APP_ID";
const String clientKey = "YOUR_CLIENT_KEY";
const String serverUrl = "https://parseapi.back4app.com/";
```

---

## 📦 Build APK

```bash
flutter build apk --release
```

APK output:
`build/app/outputs/flutter-apk/app-release.apk`

---

## 🎥 Demo Video

👉 [https://youtube.com/YOUR_VIDEO_LINK](https://youtube.com/YOUR_VIDEO_LINK)

---

## 👨‍💻 Developer

**Ravi Kumar**
*M.Tech (SS) BITS PILANI | Govt. Lecturer | Tech Enthusiast*

⭐ *If you like this project, give it a star!
