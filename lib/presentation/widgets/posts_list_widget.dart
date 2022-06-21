import 'package:flutter/material.dart';

import '../../data/repository/models/post.dart';

class PostListTile extends StatelessWidget {
  final Post? post;

  const PostListTile({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        leading: Text('${post?.id}',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        title: Text(post?.title ?? '-"}'),
        subtitle: Text(post?.body ?? '-'),
        isThreeLine: true,
        dense: true,
      ),
    );
  }
}
