// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Post extends Post {
  @override
  final String? id;
  @override
  final String? content;

  factory _$Post([void Function(PostBuilder)? updates]) =>
      (PostBuilder()..update(updates))._build();

  _$Post._({this.id, this.content}) : super._();
  @override
  Post rebuild(void Function(PostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostBuilder toBuilder() => PostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post && id == other.id && content == other.content;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Post')
          ..add('id', id)
          ..add('content', content))
        .toString();
  }
}

class PostBuilder implements Builder<Post, PostBuilder> {
  _$Post? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  PostBuilder() {
    Post._defaults(this);
  }

  PostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _content = $v.content;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Post other) {
    _$v = other as _$Post;
  }

  @override
  void update(void Function(PostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Post build() => _build();

  _$Post _build() {
    final _$result = _$v ??
        _$Post._(
          id: id,
          content: content,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
