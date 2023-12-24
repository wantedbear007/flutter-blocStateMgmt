import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/todo_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final TextEditingController _todoController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _todoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter Increment")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter your todo below: "),
            TextField(
              controller: _todoController,
              decoration: InputDecoration(hintText: "Enter your to... "),
            ),
            IconButton(
                onPressed: () {
                  context
                      .read<TodoBloc>()
                      .add(TodoAdd(todoValue: _todoController.text.trim()));
                },
                icon: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
