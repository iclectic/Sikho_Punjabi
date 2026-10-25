// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'punjabi_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PunjabiLine {

 String get gurmukhi; String? get romanised; String? get english; String? get audioRef;
/// Create a copy of PunjabiLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<PunjabiLine> get copyWith => _$PunjabiLineCopyWithImpl<PunjabiLine>(this as PunjabiLine, _$identity);

  /// Serializes this PunjabiLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PunjabiLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PunjabiLine&&(identical(other.gurmukhi, _this.gurmukhi) || other.gurmukhi == _this.gurmukhi)&&(identical(other.romanised, _this.romanised) || other.romanised == _this.romanised)&&(identical(other.english, _this.english) || other.english == _this.english)&&(identical(other.audioRef, _this.audioRef) || other.audioRef == _this.audioRef));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PunjabiLine;
  return Object.hash(runtimeType,_this.gurmukhi,_this.romanised,_this.english,_this.audioRef);
}

@override
String toString() {
  final _this = this as PunjabiLine;
  return 'PunjabiLine(gurmukhi: ${_this.gurmukhi}, romanised: ${_this.romanised}, english: ${_this.english}, audioRef: ${_this.audioRef})';
}


}

/// @nodoc
abstract mixin class $PunjabiLineCopyWith<$Res>  {
  factory $PunjabiLineCopyWith(PunjabiLine value, $Res Function(PunjabiLine) _then) = _$PunjabiLineCopyWithImpl;
@useResult
$Res call({
 String gurmukhi, String? romanised, String? english, String? audioRef
});




}
/// @nodoc
class _$PunjabiLineCopyWithImpl<$Res>
    implements $PunjabiLineCopyWith<$Res> {
  _$PunjabiLineCopyWithImpl(this._self, this._then);

  final PunjabiLine _self;
  final $Res Function(PunjabiLine) _then;

/// Create a copy of PunjabiLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gurmukhi = null,Object? romanised = freezed,Object? english = freezed,Object? audioRef = freezed,}) {
  return _then(PunjabiLine(
gurmukhi: null == gurmukhi ? _self.gurmukhi : gurmukhi // ignore: cast_nullable_to_non_nullable
as String,romanised: freezed == romanised ? _self.romanised : romanised // ignore: cast_nullable_to_non_nullable
as String?,english: freezed == english ? _self.english : english // ignore: cast_nullable_to_non_nullable
as String?,audioRef: freezed == audioRef ? _self.audioRef : audioRef // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PunjabiLine].
extension PunjabiLinePatterns on PunjabiLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PunjabiLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PunjabiLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PunjabiLine value)  $default,){
final _that = this;
switch (_that) {
case _PunjabiLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PunjabiLine value)?  $default,){
final _that = this;
switch (_that) {
case _PunjabiLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String gurmukhi,  String? romanised,  String? english,  String? audioRef)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PunjabiLine() when $default != null:
return $default(_that.gurmukhi,_that.romanised,_that.english,_that.audioRef);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String gurmukhi,  String? romanised,  String? english,  String? audioRef)  $default,) {final _that = this;
switch (_that) {
case _PunjabiLine():
return $default(_that.gurmukhi,_that.romanised,_that.english,_that.audioRef);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String gurmukhi,  String? romanised,  String? english,  String? audioRef)?  $default,) {final _that = this;
switch (_that) {
case _PunjabiLine() when $default != null:
return $default(_that.gurmukhi,_that.romanised,_that.english,_that.audioRef);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PunjabiLine implements PunjabiLine {
  const _PunjabiLine({required this.gurmukhi, this.romanised, this.english, this.audioRef});
  factory _PunjabiLine.fromJson(Map<String, dynamic> json) => _$PunjabiLineFromJson(json);

@override final  String gurmukhi;
@override final  String? romanised;
@override final  String? english;
@override final  String? audioRef;

/// Create a copy of PunjabiLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PunjabiLineCopyWith<_PunjabiLine> get copyWith => __$PunjabiLineCopyWithImpl<_PunjabiLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PunjabiLineToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PunjabiLine&&(identical(other.gurmukhi, gurmukhi) || other.gurmukhi == gurmukhi)&&(identical(other.romanised, romanised) || other.romanised == romanised)&&(identical(other.english, english) || other.english == english)&&(identical(other.audioRef, audioRef) || other.audioRef == audioRef));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,gurmukhi,romanised,english,audioRef);
}

@override
String toString() {
    return 'PunjabiLine(gurmukhi: $gurmukhi, romanised: $romanised, english: $english, audioRef: $audioRef)';
}


}

/// @nodoc
abstract mixin class _$PunjabiLineCopyWith<$Res> implements $PunjabiLineCopyWith<$Res> {
  factory _$PunjabiLineCopyWith(_PunjabiLine value, $Res Function(_PunjabiLine) _then) = __$PunjabiLineCopyWithImpl;
@override @useResult
$Res call({
 String gurmukhi, String? romanised, String? english, String? audioRef
});




}
/// @nodoc
class __$PunjabiLineCopyWithImpl<$Res>
    implements _$PunjabiLineCopyWith<$Res> {
  __$PunjabiLineCopyWithImpl(this._self, this._then);

  final _PunjabiLine _self;
  final $Res Function(_PunjabiLine) _then;

/// Create a copy of PunjabiLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gurmukhi = null,Object? romanised = freezed,Object? english = freezed,Object? audioRef = freezed,}) {
  return _then(_PunjabiLine(
gurmukhi: null == gurmukhi ? _self.gurmukhi : gurmukhi // ignore: cast_nullable_to_non_nullable
as String,romanised: freezed == romanised ? _self.romanised : romanised // ignore: cast_nullable_to_non_nullable
as String?,english: freezed == english ? _self.english : english // ignore: cast_nullable_to_non_nullable
as String?,audioRef: freezed == audioRef ? _self.audioRef : audioRef // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
