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

## 🖼️ App Screenshots

<table>
<tr>
<td><img src="screenshots/1_home_page.jpg" width="250"><br><b>🏠 Home Page</b></td>
<td><img src="screenshots/2_after_registering.jpg" width="250"><br><b>📝 After Registering</b></td>
<td><img src="screenshots/3_logout_option.jpg" width="250"><br><b>👤 Logout Option</b></td>
</tr>

<tr>
<td><img src="screenshots/4_logged_out_successfully.jpg" width="250"><br><b>🚪 Logged Out</b></td>
<td><img src="screenshots/5_after_login.jpg" width="250"><br><b>🔐 After Login</b></td>
<td><img src="screenshots/6_add_task_clicked.jpg" width="250"><br><b>➕ Add Task Clicked</b></td>
</tr>

<tr>
<td><img src="screenshots/7_task_saved_message.jpg" width="250"><br><b>💾 Task Saved</b></td>
<td><img src="screenshots/8_task_options_edit_delete_mark.jpg" width="250"><br><b>🗂️ Task Options</b></td>
<td><img src="screenshots/9_marked_complete.jpg" width="250"><br><b>✅ Marked Complete</b></td>
</tr>

<tr>
<td><img src="screenshots/back4app_dashboard_tasks.png" width="250"><br><b>🗄️ Back4App Tasks</b></td>
<td><img src="screenshots/back4app_dashboard_users.png" width="250"><br><b>👥 Back4App Users</b></td>
<td><img src="screenshots/10_refresh_message.jpg" width="250"><br><b>🔄 Refresh Message</b></td>
</tr>
</table>



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
