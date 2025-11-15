import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'screens/login_screen.dart'; // we'll create this
import 'screens/task_list_screen.dart';
import 'services/auth_service.dart';
import 'package:provider/provider.dart';
import 'services/task_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const String appId = 'zKFW6T3qPWoXF6hnz6y3bpqnfpRZMqNm8HtCB0xt';
  const String clientKey = 'GXbUk8xL3abqNtt91LEfqvSTCqCR2UD4SCG9u5fw';
  const String parseServerUrl = 'https://parseapi.back4app.com/';

  await Parse().initialize(appId, parseServerUrl,
      clientKey: clientKey, debug: true, autoSendSessionId: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        ChangeNotifierProvider<TaskService>(create: (_) => TaskService()),
      ],
      child: MaterialApp(
        title: 'Task Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: SplashOrAuth(),
      ),
    );
  }
}

// Simple widget to check auth state and navigate
class SplashOrAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context, listen: false);
    return FutureBuilder<bool>(
      future: auth.isLoggedIn(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        final loggedIn = snapshot.data!;
        if (loggedIn) return TaskListScreen();
        return LoginScreen();
      },
    );
  }
}
