# api.api.DefaultApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPost**](DefaultApi.md#createpost) | **POST** /posts | Create a new post
[**deletePost**](DefaultApi.md#deletepost) | **DELETE** /posts/{id} | Delete a post
[**getPostById**](DefaultApi.md#getpostbyid) | **GET** /posts/{id} | Get a post by ID
[**getPosts**](DefaultApi.md#getposts) | **GET** /posts | Get all posts
[**updatePost**](DefaultApi.md#updatepost) | **PUT** /posts/{id} | Update a post


# **createPost**
> Post createPost(newPost)

Create a new post

### Example
```dart
import 'package:api/api.dart';

final api = Api().getDefaultApi();
final NewPost newPost = ; // NewPost | 

try {
    final response = api.createPost(newPost);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->createPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **newPost** | [**NewPost**](NewPost.md)|  | 

### Return type

[**Post**](Post.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePost**
> deletePost(id)

Delete a post

### Example
```dart
import 'package:api/api.dart';

final api = Api().getDefaultApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.deletePost(id);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->deletePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPostById**
> Post getPostById(id)

Get a post by ID

### Example
```dart
import 'package:api/api.dart';

final api = Api().getDefaultApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getPostById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getPostById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Post**](Post.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPosts**
> BuiltList<Post> getPosts()

Get all posts

### Example
```dart
import 'package:api/api.dart';

final api = Api().getDefaultApi();

try {
    final response = api.getPosts();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getPosts: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;Post&gt;**](Post.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePost**
> Post updatePost(id, newPost)

Update a post

### Example
```dart
import 'package:api/api.dart';

final api = Api().getDefaultApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final NewPost newPost = ; // NewPost | 

try {
    final response = api.updatePost(id, newPost);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->updatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **newPost** | [**NewPost**](NewPost.md)|  | 

### Return type

[**Post**](Post.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

