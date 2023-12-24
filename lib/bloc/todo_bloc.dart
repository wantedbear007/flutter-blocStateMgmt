// Events
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TodoEvents {}

class TodoAdd extends TodoEvents {
  final String todoValue;

  TodoAdd({required this.todoValue});
}

class TodoDelete extends TodoEvents {
  final String todoValue;

  TodoDelete({required this.todoValue});
}

//State
abstract class TodoState {}

class TodoInitial extends TodoState {
  final List<String> todos;

  TodoInitial({required this.todos});
}

// Handlers
class TodoBloc extends Bloc<TodoEvents, TodoState> {
  TodoBloc() : super(TodoInitial(todos: [])) {
    on<TodoAdd>(_onAddTodo);
    on<TodoDelete>(_onDeleteTodo);
  }

  void _onAddTodo(TodoAdd event, Emitter<TodoState> emit) {
    List<String> updated = List.from((state as TodoInitial).todos)
      ..add(event.todoValue);
    emit(TodoInitial(todos: updated));
  }

  void _onDeleteTodo(TodoDelete event, Emitter<TodoState> emit) {
    List<String> updated = List.from((state as TodoInitial).todos)
      ..remove(event.todoValue);
    emit(TodoInitial(todos: updated));
  }
}
