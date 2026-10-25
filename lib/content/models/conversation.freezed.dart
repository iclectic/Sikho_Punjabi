// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConversationLine {

 String get speaker; PunjabiLine get line;
/// Create a copy of ConversationLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationLineCopyWith<ConversationLine> get copyWith => _$ConversationLineCopyWithImpl<ConversationLine>(this as ConversationLine, _$identity);

  /// Serializes this ConversationLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ConversationLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationLine&&(identical(other.speaker, _this.speaker) || other.speaker == _this.speaker)&&(identical(other.line, _this.line) || other.line == _this.line));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ConversationLine;
  return Object.hash(runtimeType,_this.speaker,_this.line);
}

@override
String toString() {
  final _this = this as ConversationLine;
  return 'ConversationLine(speaker: ${_this.speaker}, line: ${_this.line})';
}


}

/// @nodoc
abstract mixin class $ConversationLineCopyWith<$Res>  {
  factory $ConversationLineCopyWith(ConversationLine value, $Res Function(ConversationLine) _then) = _$ConversationLineCopyWithImpl;
@useResult
$Res call({
 String speaker, PunjabiLine line
});


$PunjabiLineCopyWith<$Res> get line;

}
/// @nodoc
class _$ConversationLineCopyWithImpl<$Res>
    implements $ConversationLineCopyWith<$Res> {
  _$ConversationLineCopyWithImpl(this._self, this._then);

  final ConversationLine _self;
  final $Res Function(ConversationLine) _then;

/// Create a copy of ConversationLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speaker = null,Object? line = null,}) {
  return _then(ConversationLine(
speaker: null == speaker ? _self.speaker : speaker // ignore: cast_nullable_to_non_nullable
as String,line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as PunjabiLine,
  ));
}
/// Create a copy of ConversationLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<$Res> get line {
  
  return $PunjabiLineCopyWith<$Res>(_self.line, (value) {
    return _then(_self.copyWith(line: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConversationLine].
extension ConversationLinePatterns on ConversationLine {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationLine() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationLine value)  $default,){
final _that = this;
switch (_that) {
case _ConversationLine():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationLine value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationLine() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String speaker,  PunjabiLine line)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationLine() when $default != null:
return $default(_that.speaker,_that.line);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String speaker,  PunjabiLine line)  $default,) {final _that = this;
switch (_that) {
case _ConversationLine():
return $default(_that.speaker,_that.line);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String speaker,  PunjabiLine line)?  $default,) {final _that = this;
switch (_that) {
case _ConversationLine() when $default != null:
return $default(_that.speaker,_that.line);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConversationLine implements ConversationLine {
  const _ConversationLine({required this.speaker, required this.line});
  factory _ConversationLine.fromJson(Map<String, dynamic> json) => _$ConversationLineFromJson(json);

@override final  String speaker;
@override final  PunjabiLine line;

/// Create a copy of ConversationLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationLineCopyWith<_ConversationLine> get copyWith => __$ConversationLineCopyWithImpl<_ConversationLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationLineToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationLine&&(identical(other.speaker, speaker) || other.speaker == speaker)&&(identical(other.line, line) || other.line == line));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,speaker,line);
}

@override
String toString() {
    return 'ConversationLine(speaker: $speaker, line: $line)';
}


}

/// @nodoc
abstract mixin class _$ConversationLineCopyWith<$Res> implements $ConversationLineCopyWith<$Res> {
  factory _$ConversationLineCopyWith(_ConversationLine value, $Res Function(_ConversationLine) _then) = __$ConversationLineCopyWithImpl;
@override @useResult
$Res call({
 String speaker, PunjabiLine line
});


@override $PunjabiLineCopyWith<$Res> get line;

}
/// @nodoc
class __$ConversationLineCopyWithImpl<$Res>
    implements _$ConversationLineCopyWith<$Res> {
  __$ConversationLineCopyWithImpl(this._self, this._then);

  final _ConversationLine _self;
  final $Res Function(_ConversationLine) _then;

/// Create a copy of ConversationLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speaker = null,Object? line = null,}) {
  return _then(_ConversationLine(
speaker: null == speaker ? _self.speaker : speaker // ignore: cast_nullable_to_non_nullable
as String,line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as PunjabiLine,
  ));
}

/// Create a copy of ConversationLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<$Res> get line {
  
  return $PunjabiLineCopyWith<$Res>(_self.line, (value) {
    return _then(_self.copyWith(line: value));
  });
}
}


/// @nodoc
mixin _$Conversation {

 String get title; String get context; List<ConversationLine> get lines;
/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationCopyWith<Conversation> get copyWith => _$ConversationCopyWithImpl<Conversation>(this as Conversation, _$identity);

  /// Serializes this Conversation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Conversation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conversation&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.context, _this.context) || other.context == _this.context)&&const DeepCollectionEquality().equals(other.lines, _this.lines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Conversation;
  return Object.hash(runtimeType,_this.title,_this.context,const DeepCollectionEquality().hash(_this.lines));
}

@override
String toString() {
  final _this = this as Conversation;
  return 'Conversation(title: ${_this.title}, context: ${_this.context}, lines: ${_this.lines})';
}


}

/// @nodoc
abstract mixin class $ConversationCopyWith<$Res>  {
  factory $ConversationCopyWith(Conversation value, $Res Function(Conversation) _then) = _$ConversationCopyWithImpl;
@useResult
$Res call({
 String title, String context, List<ConversationLine> lines
});




}
/// @nodoc
class _$ConversationCopyWithImpl<$Res>
    implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._self, this._then);

  final Conversation _self;
  final $Res Function(Conversation) _then;

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? context = null,Object? lines = null,}) {
  return _then(Conversation(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<ConversationLine>,
  ));
}

}


/// Adds pattern-matching-related methods to [Conversation].
extension ConversationPatterns on Conversation {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Conversation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Conversation() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Conversation value)  $default,){
final _that = this;
switch (_that) {
case _Conversation():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Conversation value)?  $default,){
final _that = this;
switch (_that) {
case _Conversation() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String context,  List<ConversationLine> lines)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Conversation() when $default != null:
return $default(_that.title,_that.context,_that.lines);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String context,  List<ConversationLine> lines)  $default,) {final _that = this;
switch (_that) {
case _Conversation():
return $default(_that.title,_that.context,_that.lines);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String context,  List<ConversationLine> lines)?  $default,) {final _that = this;
switch (_that) {
case _Conversation() when $default != null:
return $default(_that.title,_that.context,_that.lines);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Conversation implements Conversation {
  const _Conversation({required this.title, this.context = '',  List<ConversationLine> lines = const []}): _lines = lines;
  factory _Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);

@override final  String title;
@override@JsonKey() final  String context;
 final  List<ConversationLine> _lines;
@override@JsonKey() List<ConversationLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}


/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationCopyWith<_Conversation> get copyWith => __$ConversationCopyWithImpl<_Conversation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Conversation&&(identical(other.title, title) || other.title == title)&&(identical(other.context, context) || other.context == context)&&const DeepCollectionEquality().equals(other.lines, _lines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,title,context,const DeepCollectionEquality().hash(_lines));
}

@override
String toString() {
    return 'Conversation(title: $title, context: $context, lines: $lines)';
}


}

/// @nodoc
abstract mixin class _$ConversationCopyWith<$Res> implements $ConversationCopyWith<$Res> {
  factory _$ConversationCopyWith(_Conversation value, $Res Function(_Conversation) _then) = __$ConversationCopyWithImpl;
@override @useResult
$Res call({
 String title, String context, List<ConversationLine> lines
});




}
/// @nodoc
class __$ConversationCopyWithImpl<$Res>
    implements _$ConversationCopyWith<$Res> {
  __$ConversationCopyWithImpl(this._self, this._then);

  final _Conversation _self;
  final $Res Function(_Conversation) _then;

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? context = null,Object? lines = null,}) {
  return _then(_Conversation(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<ConversationLine>,
  ));
}


}

// dart format on
