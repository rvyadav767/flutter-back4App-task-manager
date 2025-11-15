import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/task_service.dart';
import '../services/auth_service.dart';
import 'task_form_screen.dart';
import '../models/task.dart';
import 'login_screen.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TaskService>(context, listen: false).fetchTasks();
  }

  Future<void> _logout() async {
    final auth = Provider.of<AuthService>(context, listen: false);
    await auth.logout();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
      (route) => false,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('👋 Logged out successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskService = Provider.of<TaskService>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F51B5), // Deep indigo tone
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3F51B5), Color(0xFF673AB7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          'My Tasks 🗂️',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        actionsIconTheme: const IconThemeData(
            color: Colors.white), // ✅ makes all AppBar icons white
        iconTheme: const IconThemeData(
            color: Colors.white), // ✅ ensures popup icons are white
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh Tasks',
            onPressed: () {
              Provider.of<TaskService>(context, listen: false).fetchTasks();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('🔄 Tasks refreshed!')),
              );
            },
          ),
          PopupMenuButton<String>(
            icon:
                const Icon(Icons.account_circle, size: 30, color: Colors.white),
            tooltip: 'Account Menu',
            onSelected: (value) async {
              if (value == 'logout') {
                await _logout();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'logout',
                child: Text('🚪 Logout'),
              ),
            ],
          ),
        ],
      ),

      // Body
      body: taskService.loading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Color(0xFFF3E5F5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: ListView.builder(
                itemCount: taskService.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskService.tasks[index];
                  return Card(
                    elevation: 3,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      leading: Icon(
                        task.completed ? Icons.check_circle : Icons.access_time,
                        color: task.completed ? Colors.green : Colors.grey,
                        size: 28,
                      ),
                      title: Text(
                        task.title,
                        style: TextStyle(
                          fontSize: 16,
                          decoration: task.completed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      subtitle: Text(task.description),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) async {
                          if (value == 'edit') {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    TaskFormScreen(existingTask: task),
                              ),
                            );
                          } else if (value == 'delete') {
                            await taskService.deleteTask(task.id!);
                          } else if (value == 'toggle') {
                            await taskService.toggleComplete(task);
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                              value: 'edit', child: Text('✏️ Edit')),
                          const PopupMenuItem(
                              value: 'delete', child: Text('🗑️ Delete')),
                          PopupMenuItem(
                            value: 'toggle',
                            child: Text(task.completed
                                ? '❌ Mark Pending'
                                : '✅ Mark Complete'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

      // ➕ Floating Add Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const TaskFormScreen()),
          );
        },
      ),
    );
  }
}
