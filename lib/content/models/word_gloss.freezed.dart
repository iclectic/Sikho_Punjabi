// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_gloss.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WordGloss {

 String get gurmukhi; String? get romanised; String get meaning; String? get grammarNote;
/// Create a copy of WordGloss
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordGlossCopyWith<WordGloss> get copyWith => _$WordGlossCopyWithImpl<WordGloss>(this as WordGloss, _$identity);

  /// Serializes this WordGloss to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WordGloss;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordGloss&&(identical(other.gurmukhi, _this.gurmukhi) || other.gurmukhi == _this.gurmukhi)&&(identical(other.romanised, _this.romanised) || other.romanised == _this.romanised)&&(identical(other.meaning, _this.meaning) || other.meaning == _this.meaning)&&(identical(other.grammarNote, _this.grammarNote) || other.grammarNote == _this.grammarNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WordGloss;
  return Object.hash(runtimeType,_this.gurmukhi,_this.romanised,_this.meaning,_this.grammarNote);
}

@override
String toString() {
  final _this = this as WordGloss;
  return 'WordGloss(gurmukhi: ${_this.gurmukhi}, romanised: ${_this.romanised}, meaning: ${_this.meaning}, grammarNote: ${_this.grammarNote})';
}


}

/// @nodoc
abstract mixin class $WordGlossCopyWith<$Res>  {
  factory $WordGlossCopyWith(WordGloss value, $Res Function(WordGloss) _then) = _$WordGlossCopyWithImpl;
@useResult
$Res call({
 String gurmukhi, String? romanised, String meaning, String? grammarNote
});




}
/// @nodoc
class _$WordGlossCopyWithImpl<$Res>
    implements $WordGlossCopyWith<$Res> {
  _$WordGlossCopyWithImpl(this._self, this._then);

  final WordGloss _self;
  final $Res Function(WordGloss) _then;

/// Create a copy of WordGloss
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gurmukhi = null,Object? romanised = freezed,Object? meaning = null,Object? grammarNote = freezed,}) {
  return _then(WordGloss(
gurmukhi: null == gurmukhi ? _self.gurmukhi : gurmukhi // ignore: cast_nullable_to_non_nullable
as String,romanised: freezed == romanised ? _self.romanised : romanised // ignore: cast_nullable_to_non_nullable
as String?,meaning: null == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String,grammarNote: freezed == grammarNote ? _self.grammarNote : grammarNote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WordGloss].
extension WordGlossPatterns on WordGloss {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WordGloss value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WordGloss() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WordGloss value)  $default,){
final _that = this;
switch (_that) {
case _WordGloss():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WordGloss value)?  $default,){
final _that = this;
switch (_that) {
case _WordGloss() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String gurmukhi,  String? romanised,  String meaning,  String? grammarNote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WordGloss() when $default != null:
return $default(_that.gurmukhi,_that.romanised,_that.meaning,_that.grammarNote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String gurmukhi,  String? romanised,  String meaning,  String? grammarNote)  $default,) {final _that = this;
switch (_that) {
case _WordGloss():
return $default(_that.gurmukhi,_that.romanised,_that.meaning,_that.grammarNote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String gurmukhi,  String? romanised,  String meaning,  String? grammarNote)?  $default,) {final _that = this;
switch (_that) {
case _WordGloss() when $default != null:
return $default(_that.gurmukhi,_that.romanised,_that.meaning,_that.grammarNote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WordGloss implements WordGloss {
  const _WordGloss({required this.gurmukhi, this.romanised, required this.meaning, this.grammarNote});
  factory _WordGloss.fromJson(Map<String, dynamic> json) => _$WordGlossFromJson(json);

@override final  String gurmukhi;
@override final  String? romanised;
@override final  String meaning;
@override final  String? grammarNote;

/// Create a copy of WordGloss
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordGlossCopyWith<_WordGloss> get copyWith => __$WordGlossCopyWithImpl<_WordGloss>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WordGlossToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordGloss&&(identical(other.gurmukhi, gurmukhi) || other.gurmukhi == gurmukhi)&&(identical(other.romanised, romanised) || other.romanised == romanised)&&(identical(other.meaning, meaning) || other.meaning == meaning)&&(identical(other.grammarNote, grammarNote) || other.grammarNote == grammarNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,gurmukhi,romanised,meaning,grammarNote);
}

@override
String toString() {
    return 'WordGloss(gurmukhi: $gurmukhi, romanised: $romanised, meaning: $meaning, grammarNote: $grammarNote)';
}


}

/// @nodoc
abstract mixin class _$WordGlossCopyWith<$Res> implements $WordGlossCopyWith<$Res> {
  factory _$WordGlossCopyWith(_WordGloss value, $Res Function(_WordGloss) _then) = __$WordGlossCopyWithImpl;
@override @useResult
$Res call({
 String gurmukhi, String? romanised, String meaning, String? grammarNote
});




}
/// @nodoc
class __$WordGlossCopyWithImpl<$Res>
    implements _$WordGlossCopyWith<$Res> {
  __$WordGlossCopyWithImpl(this._self, this._then);

  final _WordGloss _self;
  final $Res Function(_WordGloss) _then;

/// Create a copy of WordGloss
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gurmukhi = null,Object? romanised = freezed,Object? meaning = null,Object? grammarNote = freezed,}) {
  return _then(_WordGloss(
gurmukhi: null == gurmukhi ? _self.gurmukhi : gurmukhi // ignore: cast_nullable_to_non_nullable
as String,romanised: freezed == romanised ? _self.romanised : romanised // ignore: cast_nullable_to_non_nullable
as String?,meaning: null == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String,grammarNote: freezed == grammarNote ? _self.grammarNote : grammarNote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
