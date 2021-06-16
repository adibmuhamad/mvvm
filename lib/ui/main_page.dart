import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_app/bloc/user_bloc.dart';
import 'package:mvvm_app/model/user.dart';
import 'user_card.dart';

class MainPage extends StatelessWidget {

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Demo MVVM"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text("Pick Random User"),
            color: Colors.blueGrey,
            onPressed: () {
              bloc.dispatch(random.nextInt(10) + 1);
            },
          ),
          BlocBuilder<UserBloc, User>(
            builder: (context, user) => UserCard(user)
          )
        ],
      ),
    );
  }
}
