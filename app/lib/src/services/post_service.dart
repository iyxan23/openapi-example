import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Assuming the generated client is in 'app/api/post_api/'
// and the main api client class is DefaultApi, and models are Post and NewPost
import 'package:api/api.dart' as post_api_client;

final postServiceProvider = Provider<PostService>((ref) {
  return PostService();
});

class PostService {
  late final post_api_client.DefaultApi _api;

  PostService() {
    final dio = Dio();
    // dio.options.baseUrl = 'http://10.0.2.2:9000'; // For Android emulator
    dio.options.baseUrl = 'http://localhost:9000'; // For iOS simulator or web/desktop
    _api = post_api_client.DefaultApi(dio, post_api_client.standardSerializers);
  }

  Future<List<post_api_client.Post>> getPosts() async {
    try {
      final response = await _api.getPosts();
      return response.data?.toList() ?? [];
    } catch (e) {
      print('Error fetching posts: $e');
      rethrow;
    }
  }

  Future<post_api_client.Post?> createPost(String content) async {
    try {
      final newPost = post_api_client.NewPost((b) => b.content = content);
      final response = await _api.createPost(newPost: newPost);
      return response.data;
    } catch (e) {
      print('Error creating post: $e');
      rethrow;
    }
  }

  Future<post_api_client.Post?> updatePost(String id, String content) async {
    try {
      final updatedPost = post_api_client.NewPost((b) => b.content = content);
      final response = await _api.updatePost(id: id, newPost: updatedPost);
      return response.data;
    } catch (e) {
      print('Error updating post: $e');
      rethrow;
    }
  }

  Future<void> deletePost(String id) async {
    try {
      await _api.deletePost(id: id);
    } catch (e) {
      print('Error deleting post: $e');
      rethrow;
    }
  }
}

// Provider to fetch posts
final postsProvider = FutureProvider<List<post_api_client.Post>>((ref) async {
  final postService = ref.watch(postServiceProvider);
  return postService.getPosts();
});
