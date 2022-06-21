import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_bloc_flutter_app/bloc/post/post_bloc.dart';
import 'package:infinite_list_bloc_flutter_app/presentation/widgets/botton_loader_widget.dart';
import 'package:infinite_list_bloc_flutter_app/presentation/widgets/posts_list_widget.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (kDebugMode) {
          print('sate>>>${state.status}');
        }
        switch (state.status) {
          case PostStatus.failure:
            return const Center(
              child: Text('Oops! Something Went Wrong! '),
            );
          case PostStatus.success:
            if (state.posts.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return ListView.builder(
              itemBuilder: (context, i) {
                return i >= state.posts.length
                    ? BottomLoader()
                    : PostListTile(post: state.posts[i]);
              },
              itemCount: state.hasReachedMax
                  ? state.posts.length
                  : state.posts.length + 1,
              controller: _scrollController,
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void _onScroll() {
    if (isBottom) {
      context.read<PostBloc>().add(PostFetched());
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  bool get isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return maxScroll >= (currentScroll * 0.9);
  }
}
