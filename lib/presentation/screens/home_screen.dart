import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_bloc_flutter_app/bloc/post/post_bloc.dart';
import 'package:http/http.dart' as http;

import '../widgets/post_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(httpClient: http.Client() )..add(PostFetched()),
      child: const Scaffold(body: PostList()),
    );
  }
}
