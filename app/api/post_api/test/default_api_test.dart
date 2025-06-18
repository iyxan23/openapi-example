import 'package:test/test.dart';
import 'package:api/api.dart';

/// tests for DefaultApi
void main() {
  final instance = Api().getDefaultApi();

  group(DefaultApi, () {
    // Create a new post
    //
    //Future<Post> createPost(NewPost newPost) async
    test('test createPost', () async {
      // TODO
    });

    // Delete a post
    //
    //Future deletePost(String id) async
    test('test deletePost', () async {
      // TODO
    });

    // Get a post by ID
    //
    //Future<Post> getPostById(String id) async
    test('test getPostById', () async {
      // TODO
    });

    // Get all posts
    //
    //Future<BuiltList<Post>> getPosts() async
    test('test getPosts', () async {
      // TODO
    });

    // Update a post
    //
    //Future<Post> updatePost(String id, NewPost newPost) async
    test('test updatePost', () async {
      // TODO
    });
  });
}
