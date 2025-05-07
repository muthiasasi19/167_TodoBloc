import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tugas_bloc/model/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoLoaded(todos: [], selectDate: null)) {
    on<TodoEventAdd>((event, emit) {
      final currentState = state;
      if (currentState is TodoLoaded) {
        final List<Todo> updateTodos = List.from(currentState.todos);
        updateTodos.add(
          Todo(title: event.title, isCompleted: false, date: event.date),
        );

        emit(
          TodoLoaded(todos: updateTodos, selectDate: currentState.selectDate),
        );
      }
    });