// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sentence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Sentence {

 PunjabiLine get line; List<WordGloss> get glosses; String? get note;
/// Create a copy of Sentence
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SentenceCopyWith<Sentence> get copyWith => _$SentenceCopyWithImpl<Sentence>(this as Sentence, _$identity);

  /// Serializes this Sentence to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Sentence;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sentence&&(identical(other.line, _this.line) || other.line == _this.line)&&const DeepCollectionEquality().equals(other.glosses, _this.glosses)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Sentence;
  return Object.hash(runtimeType,_this.line,const DeepCollectionEquality().hash(_this.glosses),_this.note);
}

@override
String toString() {
  final _this = this as Sentence;
  return 'Sentence(line: ${_this.line}, glosses: ${_this.glosses}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $SentenceCopyWith<$Res>  {
  factory $SentenceCopyWith(Sentence value, $Res Function(Sentence) _then) = _$SentenceCopyWithImpl;
@useResult
$Res call({
 PunjabiLine line, List<WordGloss> glosses, String? note
});


$PunjabiLineCopyWith<$Res> get line;

}
/// @nodoc
class _$SentenceCopyWithImpl<$Res>
    implements $SentenceCopyWith<$Res> {
  _$SentenceCopyWithImpl(this._self, this._then);

  final Sentence _self;
  final $Res Function(Sentence) _then;

/// Create a copy of Sentence
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? line = null,Object? glosses = null,Object? note = freezed,}) {
  return _then(Sentence(
line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as PunjabiLine,glosses: null == glosses ? _self.glosses : glosses // ignore: cast_nullable_to_non_nullable
as List<WordGloss>,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Sentence
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<$Res> get line {
  
  return $PunjabiLineCopyWith<$Res>(_self.line, (value) {
    return _then(_self.copyWith(line: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sentence].
extension SentencePatterns on Sentence {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sentence value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sentence() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sentence value)  $default,){
final _that = this;
switch (_that) {
case _Sentence():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sentence value)?  $default,){
final _that = this;
switch (_that) {
case _Sentence() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PunjabiLine line,  List<WordGloss> glosses,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sentence() when $default != null:
return $default(_that.line,_that.glosses,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PunjabiLine line,  List<WordGloss> glosses,  String? note)  $default,) {final _that = this;
switch (_that) {
case _Sentence():
return $default(_that.line,_that.glosses,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PunjabiLine line,  List<WordGloss> glosses,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _Sentence() when $default != null:
return $default(_that.line,_that.glosses,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sentence implements Sentence {
  const _Sentence({required this.line,  List<WordGloss> glosses = const [], this.note}): _glosses = glosses;
  factory _Sentence.fromJson(Map<String, dynamic> json) => _$SentenceFromJson(json);

@override final  PunjabiLine line;
 final  List<WordGloss> _glosses;
@override@JsonKey() List<WordGloss> get glosses {
  if (_glosses is EqualUnmodifiableListView) return _glosses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_glosses);
}

@override final  String? note;

/// Create a copy of Sentence
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SentenceCopyWith<_Sentence> get copyWith => __$SentenceCopyWithImpl<_Sentence>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SentenceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sentence&&(identical(other.line, line) || other.line == line)&&const DeepCollectionEquality().equals(other.glosses, _glosses)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,line,const DeepCollectionEquality().hash(_glosses),note);
}

@override
String toString() {
    return 'Sentence(line: $line, glosses: $glosses, note: $note)';
}


}

/// @nodoc
abstract mixin class _$SentenceCopyWith<$Res> implements $SentenceCopyWith<$Res> {
  factory _$SentenceCopyWith(_Sentence value, $Res Function(_Sentence) _then) = __$SentenceCopyWithImpl;
@override @useResult
$Res call({
 PunjabiLine line, List<WordGloss> glosses, String? note
});


@override $PunjabiLineCopyWith<$Res> get line;

}
/// @nodoc
class __$SentenceCopyWithImpl<$Res>
    implements _$SentenceCopyWith<$Res> {
  __$SentenceCopyWithImpl(this._self, this._then);

  final _Sentence _self;
  final $Res Function(_Sentence) _then;

/// Create a copy of Sentence
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? line = null,Object? glosses = null,Object? note = freezed,}) {
  return _then(_Sentence(
line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as PunjabiLine,glosses: null == glosses ? _self._glosses : glosses // ignore: cast_nullable_to_non_nullable
as List<WordGloss>,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Sentence
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<$Res> get line {
  
  return $PunjabiLineCopyWith<$Res>(_self.line, (value) {
    return _then(_self.copyWith(line: value));
  });
}
}

// dart format on
