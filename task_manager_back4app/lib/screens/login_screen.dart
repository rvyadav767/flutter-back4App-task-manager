import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import 'task_list_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtl = TextEditingController();
  final _passCtl = TextEditingController();
  bool _loading = false;

  void _login() async {
    setState(() => _loading = true);
    final auth = Provider.of<AuthService>(context, listen: false);
    final success =
        await auth.login(_emailCtl.text.trim(), _passCtl.text.trim());
    setState(() => _loading = false);
    if (success) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => TaskListScreen()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login failed')));
    }
  }

  void _register() async {
    setState(() => _loading = true);
    final auth = Provider.of<AuthService>(context, listen: false);
    final success =
        await auth.register(_emailCtl.text.trim(), _passCtl.text.trim());
    setState(() => _loading = false);
    if (success) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registered. Logging in...')));
      _login();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registration failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Manager - Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: _emailCtl,
                decoration: InputDecoration(labelText: 'Student Email')),
            TextField(
                controller: _passCtl,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true),
            SizedBox(height: 20),
            if (_loading) CircularProgressIndicator(),
            if (!_loading)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: _login, child: Text('Login')),
                  OutlinedButton(onPressed: _register, child: Text('Register')),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
