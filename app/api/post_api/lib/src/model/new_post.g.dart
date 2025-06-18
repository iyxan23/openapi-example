// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_post.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NewPost extends NewPost {
  @override
  final String? content;

  factory _$NewPost([void Function(NewPostBuilder)? updates]) =>
      (NewPostBuilder()..update(updates))._build();

  _$NewPost._({this.content}) : super._();
  @override
  NewPost rebuild(void Function(NewPostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewPostBuilder toBuilder() => NewPostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewPost && content == other.content;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewPost')..add('content', content))
        .toString();
  }
}

class NewPostBuilder implements Builder<NewPost, NewPostBuilder> {
  _$NewPost? _$v;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  NewPostBuilder() {
    NewPost._defaults(this);
  }

  NewPostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _content = $v.content;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewPost other) {
    _$v = other as _$NewPost;
  }

  @override
  void update(void Function(NewPostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewPost build() => _build();

  _$NewPost _build() {
    final _$result = _$v ??
        _$NewPost._(
          content: content,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
