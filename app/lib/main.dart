// Openapi Generator last run: : 2025-06-18T17:16:39.208847
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

import 'src/services/post_service.dart';
import 'package:api/api.dart' as post_api_client;

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

@Openapi(
  additionalProperties: DioProperties(
    pubName: 'api',
    pubAuthor: 'iyxan',
  ),
  inputSpec: InputSpec(path: '../shared/openapi.json'),
  generatorName: Generator.dio,
  outputDirectory: 'api/post_api',
)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenAPI Posts Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const PostsScreen(),
    );
  }
}

class PostsScreen extends ConsumerWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncValue = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(postsProvider),
          ),
        ],
      ),
      body: postsAsyncValue.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const Center(child: Text('No posts yet. Add one!'));
          }
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post.content ?? 'No content'),
                subtitle: Text('ID: ${post.id ?? 'N/A'}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // TODO: Implement edit post
                        _showEditPostDialog(context, ref, post);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        // TODO: Implement delete post
                        final confirmed = await _showDeleteConfirmationDialog(context);
                        if (confirmed == true && post.id != null) {
                          try {
                            await ref.read(postServiceProvider).deletePost(post.id!);
                            ref.refresh(postsProvider);
                             ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Post deleted')),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error deleting post: $e')),
                            );
                          }
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add post
          _showAddPostDialog(context, ref);
        },
        tooltip: 'Add Post',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddPostDialog(BuildContext context, WidgetRef ref) async {
    final contentController = TextEditingController();
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Add New Post'),
          content: TextField(
            controller: contentController,
            decoration: const InputDecoration(hintText: "Post content"),
            autofocus: true,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () async {
                if (contentController.text.isNotEmpty) {
                  try {
                    await ref.read(postServiceProvider).createPost(contentController.text);
                    ref.refresh(postsProvider);
                    Navigator.of(dialogContext).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Post added')),
                    );
                  } catch (e) {
                     Navigator.of(dialogContext).pop();
                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text('Error adding post: $e')),
                     );
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }

 Future<void> _showEditPostDialog(BuildContext context, WidgetRef ref, post_api_client.Post post) async {
    final contentController = TextEditingController(text: post.content);
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Edit Post'),
          content: TextField(
            controller: contentController,
            decoration: const InputDecoration(hintText: "Post content"),
            autofocus: true,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () async {
                if (contentController.text.isNotEmpty && post.id != null) {
                  try {
                    await ref.read(postServiceProvider).updatePost(post.id!, contentController.text);
                    ref.refresh(postsProvider);
                    Navigator.of(dialogContext).pop();
                     ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Post updated')),
                    );
                  } catch (e) {
                    Navigator.of(dialogContext).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text('Error updating post: $e')),
                     );
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool?> _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this post?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}