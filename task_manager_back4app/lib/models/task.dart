import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Task {
  String? id;
  String title;
  String description;
  bool completed;
  String? ownerId;

  Task(
      {this.id,
      required this.title,
      required this.description,
      this.completed = false,
      this.ownerId});

  ParseObject toParseObject() {
    final obj = ParseObject('Task')
      ..set('title', title)
      ..set('description', description)
      ..set('completed', completed);
    if (id != null) obj.objectId = id;
    return obj;
  }

  static Task fromParse(ParseObject o) {
    return Task(
      id: o.objectId,
      title: o.get<String>('title') ?? '',
      description: o.get<String>('description') ?? '',
      completed: o.get<bool>('completed') ?? false,
      ownerId: o.get<ParseUser>('owner')?.objectId,
    );
  }
}
