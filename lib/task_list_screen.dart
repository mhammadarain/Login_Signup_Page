import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_signup_page/home_screen.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: ()
        { Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
        },
              child: const Icon(FontAwesomeIcons.userAstronaut,color: Colors.white70,)),
          const SizedBox(width: 20,)
        ],
        title: const Text(
          'Task List',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange[600],
        centerTitle: true,
      ),
      body: TaskList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tasks = Provider.of<TaskListModel>(context).tasks;

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(index: index);
      },
    );
  }
}

class TaskTile extends StatelessWidget {
  final int index;

  TaskTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var task = Provider.of<TaskListModel>(context).tasks[index];

    return ListTile(
      tileColor: task.isCompleted ? Colors.orange[200] : Colors.orange[100],
      title: Text(task.title),
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: (value) {
          Provider.of<TaskListModel>(context, listen: false)
              .toggleTaskCompletion(index);
        },
      ),
      onLongPress: () {
        _showDeleteDialog(context, index);

      },

    );
  }

  void _showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Task?'),
          content: const Text('Are you sure you want to delete this task?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Provider.of<TaskListModel>(context, listen: false)
                    .removeTask(index);
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}


class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: const Text(
          'Add Task',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange[600],
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: const AddTaskForm(),
    );
  }
}

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({Key? key}) : super(key: key);

  @override
  _AddTaskFormState createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              fillColor: Color(0x73ffd0af),
              filled: true,
              labelText: 'Task Title',
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                Provider.of<TaskListModel>(context, listen: false)
                    .addTask(Task(title: _controller.text));
                _controller.clear();
                Navigator.pop(context);
              }
            },
            child: const Text('Add Task'),
          ),
        ],
      ),
    );
  }
}

class TaskListModel extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  TaskListModel() {
    // Load tasks from SharedPreferences when the model is initialized
    _loadTasks();
  }

  void addTask(Task task) {
    _tasks.add(task);
    _saveTasks(); // Save tasks to SharedPreferences
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    _saveTasks(); // Save tasks to SharedPreferences
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    _saveTasks(); // Save tasks to SharedPreferences
    notifyListeners();
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getString('tasks');
    if (tasksJson != null) {
      final List<dynamic> decodedTasks = json.decode(tasksJson);
      _tasks.addAll(decodedTasks.map((task) => Task.fromJson(task)));
      notifyListeners();
    }
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = json.encode(_tasks);
    prefs.setString('tasks', tasksJson);
  }
}

class Task {
  String title;
  bool isCompleted;

  Task({required this.title, this.isCompleted = false});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }
}
