import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../services/task_service.dart';

class TaskFormScreen extends StatefulWidget {
  final Task? existingTask;
  const TaskFormScreen({Key? key, this.existingTask}) : super(key: key);

  @override
  _TaskFormScreenState createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descController;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _titleController =
        TextEditingController(text: widget.existingTask?.title ?? '');
    _descController =
        TextEditingController(text: widget.existingTask?.description ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _saveTask() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _saving = true);
    final taskService = Provider.of<TaskService>(context, listen: false);
    final newTask = Task(
      id: widget.existingTask?.id,
      title: _titleController.text.trim(),
      description: _descController.text.trim(),
      completed: widget.existingTask?.completed ?? false,
    );

    bool ok;
    if (widget.existingTask == null) {
      ok = await taskService.createTask(newTask);
    } else {
      ok = await taskService.updateTask(newTask);
    }

    setState(() => _saving = false);
    if (!mounted) return;

    if (ok) {
      Navigator.pop(context, true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('✅ Task saved successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('❌ Failed to save task. Try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existingTask == null ? 'Add Task' : 'Edit Task'),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFE3F2FD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  prefixIcon: Icon(Icons.title, color: Colors.indigo),
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Please enter a title'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  prefixIcon: Icon(Icons.description, color: Colors.indigo),
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Please enter a description'
                    : null,
              ),
              const SizedBox(height: 20),
              _saving
                  ? const CircularProgressIndicator()
                  : ElevatedButton.icon(
                      icon: const Icon(Icons.save, color: Colors.white),
                      label: const Text('Save Task',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo),
                      onPressed: _saveTask,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
