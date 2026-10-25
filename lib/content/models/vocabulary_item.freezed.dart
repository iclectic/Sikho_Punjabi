// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vocabulary_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VocabularyItem {

 String get id; PunjabiLine get term; String? get partOfSpeech; String? get usageNote; VerificationStatus get verificationStatus;
/// Create a copy of VocabularyItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VocabularyItemCopyWith<VocabularyItem> get copyWith => _$VocabularyItemCopyWithImpl<VocabularyItem>(this as VocabularyItem, _$identity);

  /// Serializes this VocabularyItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as VocabularyItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VocabularyItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.term, _this.term) || other.term == _this.term)&&(identical(other.partOfSpeech, _this.partOfSpeech) || other.partOfSpeech == _this.partOfSpeech)&&(identical(other.usageNote, _this.usageNote) || other.usageNote == _this.usageNote)&&(identical(other.verificationStatus, _this.verificationStatus) || other.verificationStatus == _this.verificationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as VocabularyItem;
  return Object.hash(runtimeType,_this.id,_this.term,_this.partOfSpeech,_this.usageNote,_this.verificationStatus);
}

@override
String toString() {
  final _this = this as VocabularyItem;
  return 'VocabularyItem(id: ${_this.id}, term: ${_this.term}, partOfSpeech: ${_this.partOfSpeech}, usageNote: ${_this.usageNote}, verificationStatus: ${_this.verificationStatus})';
}


}

/// @nodoc
abstract mixin class $VocabularyItemCopyWith<$Res>  {
  factory $VocabularyItemCopyWith(VocabularyItem value, $Res Function(VocabularyItem) _then) = _$VocabularyItemCopyWithImpl;
@useResult
$Res call({
 String id, PunjabiLine term, String? partOfSpeech, String? usageNote, VerificationStatus verificationStatus
});


$PunjabiLineCopyWith<$Res> get term;

}
/// @nodoc
class _$VocabularyItemCopyWithImpl<$Res>
    implements $VocabularyItemCopyWith<$Res> {
  _$VocabularyItemCopyWithImpl(this._self, this._then);

  final VocabularyItem _self;
  final $Res Function(VocabularyItem) _then;

/// Create a copy of VocabularyItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? term = null,Object? partOfSpeech = freezed,Object? usageNote = freezed,Object? verificationStatus = null,}) {
  return _then(VocabularyItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,term: null == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as PunjabiLine,partOfSpeech: freezed == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String?,usageNote: freezed == usageNote ? _self.usageNote : usageNote // ignore: cast_nullable_to_non_nullable
as String?,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as VerificationStatus,
  ));
}
/// Create a copy of VocabularyItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<$Res> get term {
  
  return $PunjabiLineCopyWith<$Res>(_self.term, (value) {
    return _then(_self.copyWith(term: value));
  });
}
}


/// Adds pattern-matching-related methods to [VocabularyItem].
extension VocabularyItemPatterns on VocabularyItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VocabularyItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VocabularyItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VocabularyItem value)  $default,){
final _that = this;
switch (_that) {
case _VocabularyItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VocabularyItem value)?  $default,){
final _that = this;
switch (_that) {
case _VocabularyItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  PunjabiLine term,  String? partOfSpeech,  String? usageNote,  VerificationStatus verificationStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VocabularyItem() when $default != null:
return $default(_that.id,_that.term,_that.partOfSpeech,_that.usageNote,_that.verificationStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  PunjabiLine term,  String? partOfSpeech,  String? usageNote,  VerificationStatus verificationStatus)  $default,) {final _that = this;
switch (_that) {
case _VocabularyItem():
return $default(_that.id,_that.term,_that.partOfSpeech,_that.usageNote,_that.verificationStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  PunjabiLine term,  String? partOfSpeech,  String? usageNote,  VerificationStatus verificationStatus)?  $default,) {final _that = this;
switch (_that) {
case _VocabularyItem() when $default != null:
return $default(_that.id,_that.term,_that.partOfSpeech,_that.usageNote,_that.verificationStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VocabularyItem implements VocabularyItem {
  const _VocabularyItem({required this.id, required this.term, this.partOfSpeech, this.usageNote, this.verificationStatus = VerificationStatus.unverified});
  factory _VocabularyItem.fromJson(Map<String, dynamic> json) => _$VocabularyItemFromJson(json);

@override final  String id;
@override final  PunjabiLine term;
@override final  String? partOfSpeech;
@override final  String? usageNote;
@override@JsonKey() final  VerificationStatus verificationStatus;

/// Create a copy of VocabularyItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VocabularyItemCopyWith<_VocabularyItem> get copyWith => __$VocabularyItemCopyWithImpl<_VocabularyItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VocabularyItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VocabularyItem&&(identical(other.id, id) || other.id == id)&&(identical(other.term, term) || other.term == term)&&(identical(other.partOfSpeech, partOfSpeech) || other.partOfSpeech == partOfSpeech)&&(identical(other.usageNote, usageNote) || other.usageNote == usageNote)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,term,partOfSpeech,usageNote,verificationStatus);
}

@override
String toString() {
    return 'VocabularyItem(id: $id, term: $term, partOfSpeech: $partOfSpeech, usageNote: $usageNote, verificationStatus: $verificationStatus)';
}


}

/// @nodoc
abstract mixin class _$VocabularyItemCopyWith<$Res> implements $VocabularyItemCopyWith<$Res> {
  factory _$VocabularyItemCopyWith(_VocabularyItem value, $Res Function(_VocabularyItem) _then) = __$VocabularyItemCopyWithImpl;
@override @useResult
$Res call({
 String id, PunjabiLine term, String? partOfSpeech, String? usageNote, VerificationStatus verificationStatus
});


@override $PunjabiLineCopyWith<$Res> get term;

}
/// @nodoc
class __$VocabularyItemCopyWithImpl<$Res>
    implements _$VocabularyItemCopyWith<$Res> {
  __$VocabularyItemCopyWithImpl(this._self, this._then);

  final _VocabularyItem _self;
  final $Res Function(_VocabularyItem) _then;

/// Create a copy of VocabularyItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? term = null,Object? partOfSpeech = freezed,Object? usageNote = freezed,Object? verificationStatus = null,}) {
  return _then(_VocabularyItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,term: null == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as PunjabiLine,partOfSpeech: freezed == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String?,usageNote: freezed == usageNote ? _self.usageNote : usageNote // ignore: cast_nullable_to_non_nullable
as String?,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as VerificationStatus,
  ));
}

/// Create a copy of VocabularyItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<$Res> get term {
  
  return $PunjabiLineCopyWith<$Res>(_self.term, (value) {
    return _then(_self.copyWith(term: value));
  });
}
}

// dart format on
