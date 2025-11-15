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

### 🖼️ App Screenshots

#### 🏠 Home Page
![](screenshots/1_home_page.jpg)

#### 📝 After Registering
![](screenshots/2_after_registering.jpg)

#### 👤 Logout Option (Profile Menu)
![](screenshots/3_logout_option.jpg)

#### 🚪 Logged Out Successfully
![](screenshots/4_logged_out_successfully.jpg)

#### 🔐 After Login
![](screenshots/5_after_login.jpg)

#### ➕ Add Task Clicked
![](screenshots/6_add_task_clicked.jpg)

#### 💾 Task Saved Message
![](screenshots/7_task_saved_message.jpg)

#### 🗂️ Saved Task Options (Edit / Delete / Mark Complete)
![](screenshots/8_task_options_edit_delete_mark.jpg)

#### ✅ Task Marked Complete
![](screenshots/9_marked_complete.jpg)

#### 🗄️ Back4App Dashboard – Tasks
![](screenshots/back4app_dashboard_tasks.png)

#### 👥 Back4App Dashboard – Users
![](screenshots/back4app_dashboard_users.png)

#### 🔄 After Refresh (Message Shown)
![](screenshots/10_refresh_message.jpg)



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
