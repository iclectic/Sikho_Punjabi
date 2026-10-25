// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gurmukhi_letter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GurmukhiLetter {

 String get id; String get letter; String get name; String get soundRomanised; String? get audioRef; PunjabiLine? get exampleWord; VerificationStatus get verificationStatus;
/// Create a copy of GurmukhiLetter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GurmukhiLetterCopyWith<GurmukhiLetter> get copyWith => _$GurmukhiLetterCopyWithImpl<GurmukhiLetter>(this as GurmukhiLetter, _$identity);

  /// Serializes this GurmukhiLetter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GurmukhiLetter;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GurmukhiLetter&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.letter, _this.letter) || other.letter == _this.letter)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.soundRomanised, _this.soundRomanised) || other.soundRomanised == _this.soundRomanised)&&(identical(other.audioRef, _this.audioRef) || other.audioRef == _this.audioRef)&&(identical(other.exampleWord, _this.exampleWord) || other.exampleWord == _this.exampleWord)&&(identical(other.verificationStatus, _this.verificationStatus) || other.verificationStatus == _this.verificationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GurmukhiLetter;
  return Object.hash(runtimeType,_this.id,_this.letter,_this.name,_this.soundRomanised,_this.audioRef,_this.exampleWord,_this.verificationStatus);
}

@override
String toString() {
  final _this = this as GurmukhiLetter;
  return 'GurmukhiLetter(id: ${_this.id}, letter: ${_this.letter}, name: ${_this.name}, soundRomanised: ${_this.soundRomanised}, audioRef: ${_this.audioRef}, exampleWord: ${_this.exampleWord}, verificationStatus: ${_this.verificationStatus})';
}


}

/// @nodoc
abstract mixin class $GurmukhiLetterCopyWith<$Res>  {
  factory $GurmukhiLetterCopyWith(GurmukhiLetter value, $Res Function(GurmukhiLetter) _then) = _$GurmukhiLetterCopyWithImpl;
@useResult
$Res call({
 String id, String letter, String name, String soundRomanised, String? audioRef, PunjabiLine? exampleWord, VerificationStatus verificationStatus
});


$PunjabiLineCopyWith<$Res>? get exampleWord;

}
/// @nodoc
class _$GurmukhiLetterCopyWithImpl<$Res>
    implements $GurmukhiLetterCopyWith<$Res> {
  _$GurmukhiLetterCopyWithImpl(this._self, this._then);

  final GurmukhiLetter _self;
  final $Res Function(GurmukhiLetter) _then;

/// Create a copy of GurmukhiLetter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? letter = null,Object? name = null,Object? soundRomanised = null,Object? audioRef = freezed,Object? exampleWord = freezed,Object? verificationStatus = null,}) {
  return _then(GurmukhiLetter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,letter: null == letter ? _self.letter : letter // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,soundRomanised: null == soundRomanised ? _self.soundRomanised : soundRomanised // ignore: cast_nullable_to_non_nullable
as String,audioRef: freezed == audioRef ? _self.audioRef : audioRef // ignore: cast_nullable_to_non_nullable
as String?,exampleWord: freezed == exampleWord ? _self.exampleWord : exampleWord // ignore: cast_nullable_to_non_nullable
as PunjabiLine?,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as VerificationStatus,
  ));
}
/// Create a copy of GurmukhiLetter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<$Res>? get exampleWord {
    if (_self.exampleWord == null) {
    return null;
  }

  return $PunjabiLineCopyWith<$Res>(_self.exampleWord!, (value) {
    return _then(_self.copyWith(exampleWord: value));
  });
}
}


/// Adds pattern-matching-related methods to [GurmukhiLetter].
extension GurmukhiLetterPatterns on GurmukhiLetter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GurmukhiLetter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GurmukhiLetter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GurmukhiLetter value)  $default,){
final _that = this;
switch (_that) {
case _GurmukhiLetter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GurmukhiLetter value)?  $default,){
final _that = this;
switch (_that) {
case _GurmukhiLetter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String letter,  String name,  String soundRomanised,  String? audioRef,  PunjabiLine? exampleWord,  VerificationStatus verificationStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GurmukhiLetter() when $default != null:
return $default(_that.id,_that.letter,_that.name,_that.soundRomanised,_that.audioRef,_that.exampleWord,_that.verificationStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String letter,  String name,  String soundRomanised,  String? audioRef,  PunjabiLine? exampleWord,  VerificationStatus verificationStatus)  $default,) {final _that = this;
switch (_that) {
case _GurmukhiLetter():
return $default(_that.id,_that.letter,_that.name,_that.soundRomanised,_that.audioRef,_that.exampleWord,_that.verificationStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String letter,  String name,  String soundRomanised,  String? audioRef,  PunjabiLine? exampleWord,  VerificationStatus verificationStatus)?  $default,) {final _that = this;
switch (_that) {
case _GurmukhiLetter() when $default != null:
return $default(_that.id,_that.letter,_that.name,_that.soundRomanised,_that.audioRef,_that.exampleWord,_that.verificationStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GurmukhiLetter implements GurmukhiLetter {
  const _GurmukhiLetter({required this.id, required this.letter, required this.name, required this.soundRomanised, this.audioRef, this.exampleWord, this.verificationStatus = VerificationStatus.unverified});
  factory _GurmukhiLetter.fromJson(Map<String, dynamic> json) => _$GurmukhiLetterFromJson(json);

@override final  String id;
@override final  String letter;
@override final  String name;
@override final  String soundRomanised;
@override final  String? audioRef;
@override final  PunjabiLine? exampleWord;
@override@JsonKey() final  VerificationStatus verificationStatus;

/// Create a copy of GurmukhiLetter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GurmukhiLetterCopyWith<_GurmukhiLetter> get copyWith => __$GurmukhiLetterCopyWithImpl<_GurmukhiLetter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GurmukhiLetterToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GurmukhiLetter&&(identical(other.id, id) || other.id == id)&&(identical(other.letter, letter) || other.letter == letter)&&(identical(other.name, name) || other.name == name)&&(identical(other.soundRomanised, soundRomanised) || other.soundRomanised == soundRomanised)&&(identical(other.audioRef, audioRef) || other.audioRef == audioRef)&&(identical(other.exampleWord, exampleWord) || other.exampleWord == exampleWord)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,letter,name,soundRomanised,audioRef,exampleWord,verificationStatus);
}

@override
String toString() {
    return 'GurmukhiLetter(id: $id, letter: $letter, name: $name, soundRomanised: $soundRomanised, audioRef: $audioRef, exampleWord: $exampleWord, verificationStatus: $verificationStatus)';
}


}

/// @nodoc
abstract mixin class _$GurmukhiLetterCopyWith<$Res> implements $GurmukhiLetterCopyWith<$Res> {
  factory _$GurmukhiLetterCopyWith(_GurmukhiLetter value, $Res Function(_GurmukhiLetter) _then) = __$GurmukhiLetterCopyWithImpl;
@override @useResult
$Res call({
 String id, String letter, String name, String soundRomanised, String? audioRef, PunjabiLine? exampleWord, VerificationStatus verificationStatus
});


@override $PunjabiLineCopyWith<$Res>? get exampleWord;

}
/// @nodoc
class __$GurmukhiLetterCopyWithImpl<$Res>
    implements _$GurmukhiLetterCopyWith<$Res> {
  __$GurmukhiLetterCopyWithImpl(this._self, this._then);

  final _GurmukhiLetter _self;
  final $Res Function(_GurmukhiLetter) _then;

/// Create a copy of GurmukhiLetter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? letter = null,Object? name = null,Object? soundRomanised = null,Object? audioRef = freezed,Object? exampleWord = freezed,Object? verificationStatus = null,}) {
  return _then(_GurmukhiLetter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,letter: null == letter ? _self.letter : letter // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,soundRomanised: null == soundRomanised ? _self.soundRomanised : soundRomanised // ignore: cast_nullable_to_non_nullable
as String,audioRef: freezed == audioRef ? _self.audioRef : audioRef // ignore: cast_nullable_to_non_nullable
as String?,exampleWord: freezed == exampleWord ? _self.exampleWord : exampleWord // ignore: cast_nullable_to_non_nullable
as PunjabiLine?,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as VerificationStatus,
  ));
}

/// Create a copy of GurmukhiLetter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<$Res>? get exampleWord {
    if (_self.exampleWord == null) {
    return null;
  }

  return $PunjabiLineCopyWith<$Res>(_self.exampleWord!, (value) {
    return _then(_self.copyWith(exampleWord: value));
  });
}
}

// dart format on
