//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'new_post.g.dart';

/// NewPost
///
/// Properties:
/// * [content]
@BuiltValue()
abstract class NewPost implements Built<NewPost, NewPostBuilder> {
  @BuiltValueField(wireName: r'content')
  String? get content;

  NewPost._();

  factory NewPost([void updates(NewPostBuilder b)]) = _$NewPost;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NewPostBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NewPost> get serializer => _$NewPostSerializer();
}

class _$NewPostSerializer implements PrimitiveSerializer<NewPost> {
  @override
  final Iterable<Type> types = const [NewPost, _$NewPost];

  @override
  final String wireName = r'NewPost';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NewPost object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    NewPost object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NewPostBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NewPost deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NewPostBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
