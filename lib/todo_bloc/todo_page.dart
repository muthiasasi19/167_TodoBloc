import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_bloc/todo_bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
//import 'package:tugas_bloc/_bloc.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();
    final _controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text("Todo List"),
              Row(
                children: [
                  Text("Selected Date"),
                  BlocBuilder<TodoBloc, TodoState>(
                    builder: (context, state) {
                      if (state is TodoLoaded) {
                        if (state.selectDate != null) {
                          return Text(
                            '${state.selectDate!.day}/${state.selectDate!.month}/${state.selectDate!.year}',
                          );
                        }
                      }
                      return Text("No date selected");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
