// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gurmukhi_vowel_sign.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GurmukhiVowelSign {

 String get id; String get sign; String get name; String get soundRomanised; String? get exampleForm; VerificationStatus get verificationStatus;
/// Create a copy of GurmukhiVowelSign
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GurmukhiVowelSignCopyWith<GurmukhiVowelSign> get copyWith => _$GurmukhiVowelSignCopyWithImpl<GurmukhiVowelSign>(this as GurmukhiVowelSign, _$identity);

  /// Serializes this GurmukhiVowelSign to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GurmukhiVowelSign;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GurmukhiVowelSign&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.sign, _this.sign) || other.sign == _this.sign)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.soundRomanised, _this.soundRomanised) || other.soundRomanised == _this.soundRomanised)&&(identical(other.exampleForm, _this.exampleForm) || other.exampleForm == _this.exampleForm)&&(identical(other.verificationStatus, _this.verificationStatus) || other.verificationStatus == _this.verificationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GurmukhiVowelSign;
  return Object.hash(runtimeType,_this.id,_this.sign,_this.name,_this.soundRomanised,_this.exampleForm,_this.verificationStatus);
}

@override
String toString() {
  final _this = this as GurmukhiVowelSign;
  return 'GurmukhiVowelSign(id: ${_this.id}, sign: ${_this.sign}, name: ${_this.name}, soundRomanised: ${_this.soundRomanised}, exampleForm: ${_this.exampleForm}, verificationStatus: ${_this.verificationStatus})';
}


}

/// @nodoc
abstract mixin class $GurmukhiVowelSignCopyWith<$Res>  {
  factory $GurmukhiVowelSignCopyWith(GurmukhiVowelSign value, $Res Function(GurmukhiVowelSign) _then) = _$GurmukhiVowelSignCopyWithImpl;
@useResult
$Res call({
 String id, String sign, String name, String soundRomanised, String? exampleForm, VerificationStatus verificationStatus
});




}
/// @nodoc
class _$GurmukhiVowelSignCopyWithImpl<$Res>
    implements $GurmukhiVowelSignCopyWith<$Res> {
  _$GurmukhiVowelSignCopyWithImpl(this._self, this._then);

  final GurmukhiVowelSign _self;
  final $Res Function(GurmukhiVowelSign) _then;

/// Create a copy of GurmukhiVowelSign
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sign = null,Object? name = null,Object? soundRomanised = null,Object? exampleForm = freezed,Object? verificationStatus = null,}) {
  return _then(GurmukhiVowelSign(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sign: null == sign ? _self.sign : sign // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,soundRomanised: null == soundRomanised ? _self.soundRomanised : soundRomanised // ignore: cast_nullable_to_non_nullable
as String,exampleForm: freezed == exampleForm ? _self.exampleForm : exampleForm // ignore: cast_nullable_to_non_nullable
as String?,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as VerificationStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [GurmukhiVowelSign].
extension GurmukhiVowelSignPatterns on GurmukhiVowelSign {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GurmukhiVowelSign value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GurmukhiVowelSign() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GurmukhiVowelSign value)  $default,){
final _that = this;
switch (_that) {
case _GurmukhiVowelSign():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GurmukhiVowelSign value)?  $default,){
final _that = this;
switch (_that) {
case _GurmukhiVowelSign() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sign,  String name,  String soundRomanised,  String? exampleForm,  VerificationStatus verificationStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GurmukhiVowelSign() when $default != null:
return $default(_that.id,_that.sign,_that.name,_that.soundRomanised,_that.exampleForm,_that.verificationStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sign,  String name,  String soundRomanised,  String? exampleForm,  VerificationStatus verificationStatus)  $default,) {final _that = this;
switch (_that) {
case _GurmukhiVowelSign():
return $default(_that.id,_that.sign,_that.name,_that.soundRomanised,_that.exampleForm,_that.verificationStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sign,  String name,  String soundRomanised,  String? exampleForm,  VerificationStatus verificationStatus)?  $default,) {final _that = this;
switch (_that) {
case _GurmukhiVowelSign() when $default != null:
return $default(_that.id,_that.sign,_that.name,_that.soundRomanised,_that.exampleForm,_that.verificationStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GurmukhiVowelSign implements GurmukhiVowelSign {
  const _GurmukhiVowelSign({required this.id, required this.sign, required this.name, required this.soundRomanised, this.exampleForm, this.verificationStatus = VerificationStatus.unverified});
  factory _GurmukhiVowelSign.fromJson(Map<String, dynamic> json) => _$GurmukhiVowelSignFromJson(json);

@override final  String id;
@override final  String sign;
@override final  String name;
@override final  String soundRomanised;
@override final  String? exampleForm;
@override@JsonKey() final  VerificationStatus verificationStatus;

/// Create a copy of GurmukhiVowelSign
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GurmukhiVowelSignCopyWith<_GurmukhiVowelSign> get copyWith => __$GurmukhiVowelSignCopyWithImpl<_GurmukhiVowelSign>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GurmukhiVowelSignToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GurmukhiVowelSign&&(identical(other.id, id) || other.id == id)&&(identical(other.sign, sign) || other.sign == sign)&&(identical(other.name, name) || other.name == name)&&(identical(other.soundRomanised, soundRomanised) || other.soundRomanised == soundRomanised)&&(identical(other.exampleForm, exampleForm) || other.exampleForm == exampleForm)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,sign,name,soundRomanised,exampleForm,verificationStatus);
}

@override
String toString() {
    return 'GurmukhiVowelSign(id: $id, sign: $sign, name: $name, soundRomanised: $soundRomanised, exampleForm: $exampleForm, verificationStatus: $verificationStatus)';
}


}

/// @nodoc
abstract mixin class _$GurmukhiVowelSignCopyWith<$Res> implements $GurmukhiVowelSignCopyWith<$Res> {
  factory _$GurmukhiVowelSignCopyWith(_GurmukhiVowelSign value, $Res Function(_GurmukhiVowelSign) _then) = __$GurmukhiVowelSignCopyWithImpl;
@override @useResult
$Res call({
 String id, String sign, String name, String soundRomanised, String? exampleForm, VerificationStatus verificationStatus
});




}
/// @nodoc
class __$GurmukhiVowelSignCopyWithImpl<$Res>
    implements _$GurmukhiVowelSignCopyWith<$Res> {
  __$GurmukhiVowelSignCopyWithImpl(this._self, this._then);

  final _GurmukhiVowelSign _self;
  final $Res Function(_GurmukhiVowelSign) _then;

/// Create a copy of GurmukhiVowelSign
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sign = null,Object? name = null,Object? soundRomanised = null,Object? exampleForm = freezed,Object? verificationStatus = null,}) {
  return _then(_GurmukhiVowelSign(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sign: null == sign ? _self.sign : sign // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,soundRomanised: null == soundRomanised ? _self.soundRomanised : soundRomanised // ignore: cast_nullable_to_non_nullable
as String,exampleForm: freezed == exampleForm ? _self.exampleForm : exampleForm // ignore: cast_nullable_to_non_nullable
as String?,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as VerificationStatus,
  ));
}


}

// dart format on
