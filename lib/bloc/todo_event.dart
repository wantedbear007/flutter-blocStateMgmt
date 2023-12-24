part of "todo_bloc.dart";

// @inmutable
sealed class TodoEvent {}

final class TodoAdd extends TodoEvent {
  final String todoValue;

  TodoAdd({required this.todoValue});
}
