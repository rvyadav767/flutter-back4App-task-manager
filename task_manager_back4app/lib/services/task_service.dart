// lib/services/task_service.dart
import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import '../models/task.dart';

class TaskService extends ChangeNotifier {
  List<Task> tasks = [];
  bool loading = false;

  TaskService() {
    // Optionally, you can call fetchTasks() here if a user is already logged in.
    // fetchTasks();
  }

  /// Fetch tasks for the currently logged-in user
  Future<void> fetchTasks() async {
    loading = true;
    notifyListeners();

    try {
      final user = await ParseUser.currentUser() as ParseUser?;
      if (user == null) {
        tasks = [];
        loading = false;
        notifyListeners();
        return;
      }

      final query = QueryBuilder<ParseObject>(ParseObject('Task'))
        ..whereEqualTo('owner', user)
        ..orderByDescending('createdAt');

      final response = await query.query();

      tasks = [];

      if (response.success && response.results != null) {
        for (final r in response.results!) {
          if (r is ParseObject) {
            tasks.add(Task.fromParse(r));
          }
        }
      } else {
        if (kDebugMode) {
          final err = response.error;
          if (err != null) print('Parse query error: ${err.message}');
        }
      }
    } catch (e, st) {
      if (kDebugMode) print('fetchTasks exception: $e\n$st');
    }

    loading = false;
    notifyListeners();
  }

  Future<bool> createTask(Task task) async {
    try {
      final user = await ParseUser.currentUser() as ParseUser?;
      final obj = task.toParseObject();
      if (user != null) obj.set('owner', user);

      final response = await obj.save();

      if (response.success) {
        // Refresh list after successful creation
        await fetchTasks();
        return true;
      } else {
        if (kDebugMode) print('createTask error: ${response.error}');
        return false;
      }
    } catch (e, st) {
      if (kDebugMode) print('createTask exception: $e\n$st');
      return false;
    }
  }

  Future<bool> updateTask(Task task) async {
    try {
      if (task.id == null) return false;
      final obj = task.toParseObject();
      final response = await obj.save();

      if (response.success) {
        await fetchTasks();
        return true;
      } else {
        if (kDebugMode) print('updateTask error: ${response.error}');
        return false;
      }
    } catch (e, st) {
      if (kDebugMode) print('updateTask exception: $e\n$st');
      return false;
    }
  }

  Future<bool> deleteTask(String objectId) async {
    try {
      final obj = ParseObject('Task')..objectId = objectId;
      final response = await obj.delete();

      if (response.success) {
        // Update local list immediately
        tasks.removeWhere((t) => t.id == objectId);
        notifyListeners();
        return true;
      } else {
        if (kDebugMode) print('deleteTask error: ${response.error}');
        return false;
      }
    } catch (e, st) {
      if (kDebugMode) print('deleteTask exception: $e\n$st');
      return false;
    }
  }

  Future<void> toggleComplete(Task task) async {
    task.completed = !task.completed;
    await updateTask(task);
  }

  @override
  void dispose() {
    // Nothing to unsubscribe (no LiveQuery), but we keep this to be safe.
    super.dispose();
  }
}
