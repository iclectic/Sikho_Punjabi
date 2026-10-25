// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExerciseOption {

 String get id; PunjabiLine get line;
/// Create a copy of ExerciseOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseOptionCopyWith<ExerciseOption> get copyWith => _$ExerciseOptionCopyWithImpl<ExerciseOption>(this as ExerciseOption, _$identity);

  /// Serializes this ExerciseOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ExerciseOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseOption&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.line, _this.line) || other.line == _this.line));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ExerciseOption;
  return Object.hash(runtimeType,_this.id,_this.line);
}

@override
String toString() {
  final _this = this as ExerciseOption;
  return 'ExerciseOption(id: ${_this.id}, line: ${_this.line})';
}


}

/// @nodoc
abstract mixin class $ExerciseOptionCopyWith<$Res>  {
  factory $ExerciseOptionCopyWith(ExerciseOption value, $Res Function(ExerciseOption) _then) = _$ExerciseOptionCopyWithImpl;
@useResult
$Res call({
 String id, PunjabiLine line
});


$PunjabiLineCopyWith<$Res> get line;

}
/// @nodoc
class _$ExerciseOptionCopyWithImpl<$Res>
    implements $ExerciseOptionCopyWith<$Res> {
  _$ExerciseOptionCopyWithImpl(this._self, this._then);

  final ExerciseOption _self;
  final $Res Function(ExerciseOption) _then;

/// Create a copy of ExerciseOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? line = null,}) {
  return _then(ExerciseOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as PunjabiLine,
  ));
}
/// Create a copy of ExerciseOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<$Res> get line {
  
  return $PunjabiLineCopyWith<$Res>(_self.line, (value) {
    return _then(_self.copyWith(line: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExerciseOption].
extension ExerciseOptionPatterns on ExerciseOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExerciseOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExerciseOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExerciseOption value)  $default,){
final _that = this;
switch (_that) {
case _ExerciseOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExerciseOption value)?  $default,){
final _that = this;
switch (_that) {
case _ExerciseOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  PunjabiLine line)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExerciseOption() when $default != null:
return $default(_that.id,_that.line);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  PunjabiLine line)  $default,) {final _that = this;
switch (_that) {
case _ExerciseOption():
return $default(_that.id,_that.line);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  PunjabiLine line)?  $default,) {final _that = this;
switch (_that) {
case _ExerciseOption() when $default != null:
return $default(_that.id,_that.line);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExerciseOption implements ExerciseOption {
  const _ExerciseOption({required this.id, required this.line});
  factory _ExerciseOption.fromJson(Map<String, dynamic> json) => _$ExerciseOptionFromJson(json);

@override final  String id;
@override final  PunjabiLine line;

/// Create a copy of ExerciseOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseOptionCopyWith<_ExerciseOption> get copyWith => __$ExerciseOptionCopyWithImpl<_ExerciseOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExerciseOptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseOption&&(identical(other.id, id) || other.id == id)&&(identical(other.line, line) || other.line == line));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,line);
}

@override
String toString() {
    return 'ExerciseOption(id: $id, line: $line)';
}


}

/// @nodoc
abstract mixin class _$ExerciseOptionCopyWith<$Res> implements $ExerciseOptionCopyWith<$Res> {
  factory _$ExerciseOptionCopyWith(_ExerciseOption value, $Res Function(_ExerciseOption) _then) = __$ExerciseOptionCopyWithImpl;
@override @useResult
$Res call({
 String id, PunjabiLine line
});


@override $PunjabiLineCopyWith<$Res> get line;

}
/// @nodoc
class __$ExerciseOptionCopyWithImpl<$Res>
    implements _$ExerciseOptionCopyWith<$Res> {
  __$ExerciseOptionCopyWithImpl(this._self, this._then);

  final _ExerciseOption _self;
  final $Res Function(_ExerciseOption) _then;

/// Create a copy of ExerciseOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? line = null,}) {
  return _then(_ExerciseOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as PunjabiLine,
  ));
}

/// Create a copy of ExerciseOption
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
mixin _$MatchPair {

 String get id; PunjabiLine get left; PunjabiLine get right;
/// Create a copy of MatchPair
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchPairCopyWith<MatchPair> get copyWith => _$MatchPairCopyWithImpl<MatchPair>(this as MatchPair, _$identity);

  /// Serializes this MatchPair to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MatchPair;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchPair&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.left, _this.left) || other.left == _this.left)&&(identical(other.right, _this.right) || other.right == _this.right));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MatchPair;
  return Object.hash(runtimeType,_this.id,_this.left,_this.right);
}

@override
String toString() {
  final _this = this as MatchPair;
  return 'MatchPair(id: ${_this.id}, left: ${_this.left}, right: ${_this.right})';
}


}

/// @nodoc
abstract mixin class $MatchPairCopyWith<$Res>  {
  factory $MatchPairCopyWith(MatchPair value, $Res Function(MatchPair) _then) = _$MatchPairCopyWithImpl;
@useResult
$Res call({
 String id, PunjabiLine left, PunjabiLine right
});


$PunjabiLineCopyWith<$Res> get left;$PunjabiLineCopyWith<$Res> get right;

}
/// @nodoc
class _$MatchPairCopyWithImpl<$Res>
    implements $MatchPairCopyWith<$Res> {
  _$MatchPairCopyWithImpl(this._self, this._then);

  final MatchPair _self;
  final $Res Function(MatchPair) _then;

/// Create a copy of MatchPair
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? left = null,Object? right = null,}) {
  return _then(MatchPair(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,left: null == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as PunjabiLine,right: null == right ? _self.right : right // ignore: cast_nullable_to_non_nullable
as PunjabiLine,
  ));
}
/// Create a copy of MatchPair
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<$Res> get left {
  
  return $PunjabiLineCopyWith<$Res>(_self.left, (value) {
    return _then(_self.copyWith(left: value));
  });
}/// Create a copy of MatchPair
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<$Res> get right {
  
  return $PunjabiLineCopyWith<$Res>(_self.right, (value) {
    return _then(_self.copyWith(right: value));
  });
}
}


/// Adds pattern-matching-related methods to [MatchPair].
extension MatchPairPatterns on MatchPair {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchPair value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchPair() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchPair value)  $default,){
final _that = this;
switch (_that) {
case _MatchPair():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchPair value)?  $default,){
final _that = this;
switch (_that) {
case _MatchPair() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  PunjabiLine left,  PunjabiLine right)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchPair() when $default != null:
return $default(_that.id,_that.left,_that.right);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  PunjabiLine left,  PunjabiLine right)  $default,) {final _that = this;
switch (_that) {
case _MatchPair():
return $default(_that.id,_that.left,_that.right);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  PunjabiLine left,  PunjabiLine right)?  $default,) {final _that = this;
switch (_that) {
case _MatchPair() when $default != null:
return $default(_that.id,_that.left,_that.right);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchPair implements MatchPair {
  const _MatchPair({required this.id, required this.left, required this.right});
  factory _MatchPair.fromJson(Map<String, dynamic> json) => _$MatchPairFromJson(json);

@override final  String id;
@override final  PunjabiLine left;
@override final  PunjabiLine right;

/// Create a copy of MatchPair
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchPairCopyWith<_MatchPair> get copyWith => __$MatchPairCopyWithImpl<_MatchPair>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchPairToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchPair&&(identical(other.id, id) || other.id == id)&&(identical(other.left, left) || other.left == left)&&(identical(other.right, right) || other.right == right));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,left,right);
}

@override
String toString() {
    return 'MatchPair(id: $id, left: $left, right: $right)';
}


}

/// @nodoc
abstract mixin class _$MatchPairCopyWith<$Res> implements $MatchPairCopyWith<$Res> {
  factory _$MatchPairCopyWith(_MatchPair value, $Res Function(_MatchPair) _then) = __$MatchPairCopyWithImpl;
@override @useResult
$Res call({
 String id, PunjabiLine left, PunjabiLine right
});


@override $PunjabiLineCopyWith<$Res> get left;@override $PunjabiLineCopyWith<$Res> get right;

}
/// @nodoc
class __$MatchPairCopyWithImpl<$Res>
    implements _$MatchPairCopyWith<$Res> {
  __$MatchPairCopyWithImpl(this._self, this._then);

  final _MatchPair _self;
  final $Res Function(_MatchPair) _then;

/// Create a copy of MatchPair
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? left = null,Object? right = null,}) {
  return _then(_MatchPair(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,left: null == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as PunjabiLine,right: null == right ? _self.right : right // ignore: cast_nullable_to_non_nullable
as PunjabiLine,
  ));
}

/// Create a copy of MatchPair
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<$Res> get left {
  
  return $PunjabiLineCopyWith<$Res>(_self.left, (value) {
    return _then(_self.copyWith(left: value));
  });
}/// Create a copy of MatchPair
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<$Res> get right {
  
  return $PunjabiLineCopyWith<$Res>(_self.right, (value) {
    return _then(_self.copyWith(right: value));
  });
}
}

Exercise _$ExerciseFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'multipleChoice':
          return MultipleChoiceExercise.fromJson(
            json
          );
                case 'arrangeWords':
          return ArrangeWordsExercise.fromJson(
            json
          );
                case 'fillBlank':
          return FillBlankExercise.fromJson(
            json
          );
                case 'matchPairs':
          return MatchPairsExercise.fromJson(
            json
          );
                case 'typeTranslation':
          return TypeTranslationExercise.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'Exercise',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$Exercise {

 String get id; String? get explanation;
/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseCopyWith<Exercise> get copyWith => _$ExerciseCopyWithImpl<Exercise>(this as Exercise, _$identity);

  /// Serializes this Exercise to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Exercise;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Exercise&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.explanation, _this.explanation) || other.explanation == _this.explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Exercise;
  return Object.hash(runtimeType,_this.id,_this.explanation);
}

@override
String toString() {
  final _this = this as Exercise;
  return 'Exercise(id: ${_this.id}, explanation: ${_this.explanation})';
}


}

/// @nodoc
abstract mixin class $ExerciseCopyWith<$Res>  {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) _then) = _$ExerciseCopyWithImpl;
@useResult
$Res call({
 String id, String? explanation
});




}
/// @nodoc
class _$ExerciseCopyWithImpl<$Res>
    implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._self, this._then);

  final Exercise _self;
  final $Res Function(Exercise) _then;

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? explanation = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Exercise].
extension ExercisePatterns on Exercise {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MultipleChoiceExercise value)?  multipleChoice,TResult Function( ArrangeWordsExercise value)?  arrangeWords,TResult Function( FillBlankExercise value)?  fillBlank,TResult Function( MatchPairsExercise value)?  matchPairs,TResult Function( TypeTranslationExercise value)?  typeTranslation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MultipleChoiceExercise() when multipleChoice != null:
return multipleChoice(_that);case ArrangeWordsExercise() when arrangeWords != null:
return arrangeWords(_that);case FillBlankExercise() when fillBlank != null:
return fillBlank(_that);case MatchPairsExercise() when matchPairs != null:
return matchPairs(_that);case TypeTranslationExercise() when typeTranslation != null:
return typeTranslation(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MultipleChoiceExercise value)  multipleChoice,required TResult Function( ArrangeWordsExercise value)  arrangeWords,required TResult Function( FillBlankExercise value)  fillBlank,required TResult Function( MatchPairsExercise value)  matchPairs,required TResult Function( TypeTranslationExercise value)  typeTranslation,}){
final _that = this;
switch (_that) {
case MultipleChoiceExercise():
return multipleChoice(_that);case ArrangeWordsExercise():
return arrangeWords(_that);case FillBlankExercise():
return fillBlank(_that);case MatchPairsExercise():
return matchPairs(_that);case TypeTranslationExercise():
return typeTranslation(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MultipleChoiceExercise value)?  multipleChoice,TResult? Function( ArrangeWordsExercise value)?  arrangeWords,TResult? Function( FillBlankExercise value)?  fillBlank,TResult? Function( MatchPairsExercise value)?  matchPairs,TResult? Function( TypeTranslationExercise value)?  typeTranslation,}){
final _that = this;
switch (_that) {
case MultipleChoiceExercise() when multipleChoice != null:
return multipleChoice(_that);case ArrangeWordsExercise() when arrangeWords != null:
return arrangeWords(_that);case FillBlankExercise() when fillBlank != null:
return fillBlank(_that);case MatchPairsExercise() when matchPairs != null:
return matchPairs(_that);case TypeTranslationExercise() when typeTranslation != null:
return typeTranslation(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  PunjabiLine prompt,  String question,  List<ExerciseOption> options,  String correctOptionId,  String? explanation)?  multipleChoice,TResult Function( String id,  PunjabiLine prompt,  List<String> tokens,  List<String> distractors,  String? explanation)?  arrangeWords,TResult Function( String id,  PunjabiLine prompt,  String template,  List<ExerciseOption> options,  String correctOptionId,  String? explanation)?  fillBlank,TResult Function( String id,  String instructions,  List<MatchPair> pairs,  String? explanation)?  matchPairs,TResult Function( String id,  PunjabiLine prompt,  List<String> acceptedAnswers,  String? explanation)?  typeTranslation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MultipleChoiceExercise() when multipleChoice != null:
return multipleChoice(_that.id,_that.prompt,_that.question,_that.options,_that.correctOptionId,_that.explanation);case ArrangeWordsExercise() when arrangeWords != null:
return arrangeWords(_that.id,_that.prompt,_that.tokens,_that.distractors,_that.explanation);case FillBlankExercise() when fillBlank != null:
return fillBlank(_that.id,_that.prompt,_that.template,_that.options,_that.correctOptionId,_that.explanation);case MatchPairsExercise() when matchPairs != null:
return matchPairs(_that.id,_that.instructions,_that.pairs,_that.explanation);case TypeTranslationExercise() when typeTranslation != null:
return typeTranslation(_that.id,_that.prompt,_that.acceptedAnswers,_that.explanation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  PunjabiLine prompt,  String question,  List<ExerciseOption> options,  String correctOptionId,  String? explanation)  multipleChoice,required TResult Function( String id,  PunjabiLine prompt,  List<String> tokens,  List<String> distractors,  String? explanation)  arrangeWords,required TResult Function( String id,  PunjabiLine prompt,  String template,  List<ExerciseOption> options,  String correctOptionId,  String? explanation)  fillBlank,required TResult Function( String id,  String instructions,  List<MatchPair> pairs,  String? explanation)  matchPairs,required TResult Function( String id,  PunjabiLine prompt,  List<String> acceptedAnswers,  String? explanation)  typeTranslation,}) {final _that = this;
switch (_that) {
case MultipleChoiceExercise():
return multipleChoice(_that.id,_that.prompt,_that.question,_that.options,_that.correctOptionId,_that.explanation);case ArrangeWordsExercise():
return arrangeWords(_that.id,_that.prompt,_that.tokens,_that.distractors,_that.explanation);case FillBlankExercise():
return fillBlank(_that.id,_that.prompt,_that.template,_that.options,_that.correctOptionId,_that.explanation);case MatchPairsExercise():
return matchPairs(_that.id,_that.instructions,_that.pairs,_that.explanation);case TypeTranslationExercise():
return typeTranslation(_that.id,_that.prompt,_that.acceptedAnswers,_that.explanation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  PunjabiLine prompt,  String question,  List<ExerciseOption> options,  String correctOptionId,  String? explanation)?  multipleChoice,TResult? Function( String id,  PunjabiLine prompt,  List<String> tokens,  List<String> distractors,  String? explanation)?  arrangeWords,TResult? Function( String id,  PunjabiLine prompt,  String template,  List<ExerciseOption> options,  String correctOptionId,  String? explanation)?  fillBlank,TResult? Function( String id,  String instructions,  List<MatchPair> pairs,  String? explanation)?  matchPairs,TResult? Function( String id,  PunjabiLine prompt,  List<String> acceptedAnswers,  String? explanation)?  typeTranslation,}) {final _that = this;
switch (_that) {
case MultipleChoiceExercise() when multipleChoice != null:
return multipleChoice(_that.id,_that.prompt,_that.question,_that.options,_that.correctOptionId,_that.explanation);case ArrangeWordsExercise() when arrangeWords != null:
return arrangeWords(_that.id,_that.prompt,_that.tokens,_that.distractors,_that.explanation);case FillBlankExercise() when fillBlank != null:
return fillBlank(_that.id,_that.prompt,_that.template,_that.options,_that.correctOptionId,_that.explanation);case MatchPairsExercise() when matchPairs != null:
return matchPairs(_that.id,_that.instructions,_that.pairs,_that.explanation);case TypeTranslationExercise() when typeTranslation != null:
return typeTranslation(_that.id,_that.prompt,_that.acceptedAnswers,_that.explanation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class MultipleChoiceExercise implements Exercise {
  const MultipleChoiceExercise({required this.id, required this.prompt, required this.question, required  List<ExerciseOption> options, required this.correctOptionId, this.explanation,  String? $type}): _options = options,$type = $type ?? 'multipleChoice';
  factory MultipleChoiceExercise.fromJson(Map<String, dynamic> json) => _$MultipleChoiceExerciseFromJson(json);

@override final  String id;
 final  PunjabiLine prompt;
 final  String question;
 final  List<ExerciseOption> _options;
 List<ExerciseOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

 final  String correctOptionId;
@override final  String? explanation;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MultipleChoiceExerciseCopyWith<MultipleChoiceExercise> get copyWith => _$MultipleChoiceExerciseCopyWithImpl<MultipleChoiceExercise>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MultipleChoiceExerciseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MultipleChoiceExercise&&(identical(other.id, id) || other.id == id)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.options, _options)&&(identical(other.correctOptionId, correctOptionId) || other.correctOptionId == correctOptionId)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,prompt,question,const DeepCollectionEquality().hash(_options),correctOptionId,explanation);
}

@override
String toString() {
    return 'Exercise.multipleChoice(id: $id, prompt: $prompt, question: $question, options: $options, correctOptionId: $correctOptionId, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $MultipleChoiceExerciseCopyWith<$Res> implements $ExerciseCopyWith<$Res> {
  factory $MultipleChoiceExerciseCopyWith(MultipleChoiceExercise value, $Res Function(MultipleChoiceExercise) _then) = _$MultipleChoiceExerciseCopyWithImpl;
@override @useResult
$Res call({
 String id, PunjabiLine prompt, String question, List<ExerciseOption> options, String correctOptionId, String? explanation
});


$PunjabiLineCopyWith<$Res> get prompt;

}
/// @nodoc
class _$MultipleChoiceExerciseCopyWithImpl<$Res>
    implements $MultipleChoiceExerciseCopyWith<$Res> {
  _$MultipleChoiceExerciseCopyWithImpl(this._self, this._then);

  final MultipleChoiceExercise _self;
  final $Res Function(MultipleChoiceExercise) _then;

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prompt = null,Object? question = null,Object? options = null,Object? correctOptionId = null,Object? explanation = freezed,}) {
  return _then(MultipleChoiceExercise(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as PunjabiLine,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<ExerciseOption>,correctOptionId: null == correctOptionId ? _self.correctOptionId : correctOptionId // ignore: cast_nullable_to_non_nullable
as String,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<$Res> get prompt {
  
  return $PunjabiLineCopyWith<$Res>(_self.prompt, (value) {
    return _then(_self.copyWith(prompt: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ArrangeWordsExercise implements Exercise {
  const ArrangeWordsExercise({required this.id, required this.prompt, required  List<String> tokens,  List<String> distractors = const [], this.explanation,  String? $type}): _tokens = tokens,_distractors = distractors,$type = $type ?? 'arrangeWords';
  factory ArrangeWordsExercise.fromJson(Map<String, dynamic> json) => _$ArrangeWordsExerciseFromJson(json);

@override final  String id;
 final  PunjabiLine prompt;
 final  List<String> _tokens;
 List<String> get tokens {
  if (_tokens is EqualUnmodifiableListView) return _tokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tokens);
}

 final  List<String> _distractors;
@JsonKey() List<String> get distractors {
  if (_distractors is EqualUnmodifiableListView) return _distractors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_distractors);
}

@override final  String? explanation;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArrangeWordsExerciseCopyWith<ArrangeWordsExercise> get copyWith => _$ArrangeWordsExerciseCopyWithImpl<ArrangeWordsExercise>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArrangeWordsExerciseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ArrangeWordsExercise&&(identical(other.id, id) || other.id == id)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&const DeepCollectionEquality().equals(other.tokens, _tokens)&&const DeepCollectionEquality().equals(other.distractors, _distractors)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,prompt,const DeepCollectionEquality().hash(_tokens),const DeepCollectionEquality().hash(_distractors),explanation);
}

@override
String toString() {
    return 'Exercise.arrangeWords(id: $id, prompt: $prompt, tokens: $tokens, distractors: $distractors, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $ArrangeWordsExerciseCopyWith<$Res> implements $ExerciseCopyWith<$Res> {
  factory $ArrangeWordsExerciseCopyWith(ArrangeWordsExercise value, $Res Function(ArrangeWordsExercise) _then) = _$ArrangeWordsExerciseCopyWithImpl;
@override @useResult
$Res call({
 String id, PunjabiLine prompt, List<String> tokens, List<String> distractors, String? explanation
});


$PunjabiLineCopyWith<$Res> get prompt;

}
/// @nodoc
class _$ArrangeWordsExerciseCopyWithImpl<$Res>
    implements $ArrangeWordsExerciseCopyWith<$Res> {
  _$ArrangeWordsExerciseCopyWithImpl(this._self, this._then);

  final ArrangeWordsExercise _self;
  final $Res Function(ArrangeWordsExercise) _then;

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prompt = null,Object? tokens = null,Object? distractors = null,Object? explanation = freezed,}) {
  return _then(ArrangeWordsExercise(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as PunjabiLine,tokens: null == tokens ? _self._tokens : tokens // ignore: cast_nullable_to_non_nullable
as List<String>,distractors: null == distractors ? _self._distractors : distractors // ignore: cast_nullable_to_non_nullable
as List<String>,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<$Res> get prompt {
  
  return $PunjabiLineCopyWith<$Res>(_self.prompt, (value) {
    return _then(_self.copyWith(prompt: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class FillBlankExercise implements Exercise {
  const FillBlankExercise({required this.id, required this.prompt, required this.template, required  List<ExerciseOption> options, required this.correctOptionId, this.explanation,  String? $type}): _options = options,$type = $type ?? 'fillBlank';
  factory FillBlankExercise.fromJson(Map<String, dynamic> json) => _$FillBlankExerciseFromJson(json);

@override final  String id;
 final  PunjabiLine prompt;
 final  String template;
 final  List<ExerciseOption> _options;
 List<ExerciseOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

 final  String correctOptionId;
@override final  String? explanation;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FillBlankExerciseCopyWith<FillBlankExercise> get copyWith => _$FillBlankExerciseCopyWithImpl<FillBlankExercise>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FillBlankExerciseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FillBlankExercise&&(identical(other.id, id) || other.id == id)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.template, template) || other.template == template)&&const DeepCollectionEquality().equals(other.options, _options)&&(identical(other.correctOptionId, correctOptionId) || other.correctOptionId == correctOptionId)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,prompt,template,const DeepCollectionEquality().hash(_options),correctOptionId,explanation);
}

@override
String toString() {
    return 'Exercise.fillBlank(id: $id, prompt: $prompt, template: $template, options: $options, correctOptionId: $correctOptionId, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $FillBlankExerciseCopyWith<$Res> implements $ExerciseCopyWith<$Res> {
  factory $FillBlankExerciseCopyWith(FillBlankExercise value, $Res Function(FillBlankExercise) _then) = _$FillBlankExerciseCopyWithImpl;
@override @useResult
$Res call({
 String id, PunjabiLine prompt, String template, List<ExerciseOption> options, String correctOptionId, String? explanation
});


$PunjabiLineCopyWith<$Res> get prompt;

}
/// @nodoc
class _$FillBlankExerciseCopyWithImpl<$Res>
    implements $FillBlankExerciseCopyWith<$Res> {
  _$FillBlankExerciseCopyWithImpl(this._self, this._then);

  final FillBlankExercise _self;
  final $Res Function(FillBlankExercise) _then;

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prompt = null,Object? template = null,Object? options = null,Object? correctOptionId = null,Object? explanation = freezed,}) {
  return _then(FillBlankExercise(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as PunjabiLine,template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<ExerciseOption>,correctOptionId: null == correctOptionId ? _self.correctOptionId : correctOptionId // ignore: cast_nullable_to_non_nullable
as String,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<$Res> get prompt {
  
  return $PunjabiLineCopyWith<$Res>(_self.prompt, (value) {
    return _then(_self.copyWith(prompt: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class MatchPairsExercise implements Exercise {
  const MatchPairsExercise({required this.id, required this.instructions, required  List<MatchPair> pairs, this.explanation,  String? $type}): _pairs = pairs,$type = $type ?? 'matchPairs';
  factory MatchPairsExercise.fromJson(Map<String, dynamic> json) => _$MatchPairsExerciseFromJson(json);

@override final  String id;
 final  String instructions;
 final  List<MatchPair> _pairs;
 List<MatchPair> get pairs {
  if (_pairs is EqualUnmodifiableListView) return _pairs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pairs);
}

@override final  String? explanation;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchPairsExerciseCopyWith<MatchPairsExercise> get copyWith => _$MatchPairsExerciseCopyWithImpl<MatchPairsExercise>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchPairsExerciseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchPairsExercise&&(identical(other.id, id) || other.id == id)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&const DeepCollectionEquality().equals(other.pairs, _pairs)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,instructions,const DeepCollectionEquality().hash(_pairs),explanation);
}

@override
String toString() {
    return 'Exercise.matchPairs(id: $id, instructions: $instructions, pairs: $pairs, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $MatchPairsExerciseCopyWith<$Res> implements $ExerciseCopyWith<$Res> {
  factory $MatchPairsExerciseCopyWith(MatchPairsExercise value, $Res Function(MatchPairsExercise) _then) = _$MatchPairsExerciseCopyWithImpl;
@override @useResult
$Res call({
 String id, String instructions, List<MatchPair> pairs, String? explanation
});




}
/// @nodoc
class _$MatchPairsExerciseCopyWithImpl<$Res>
    implements $MatchPairsExerciseCopyWith<$Res> {
  _$MatchPairsExerciseCopyWithImpl(this._self, this._then);

  final MatchPairsExercise _self;
  final $Res Function(MatchPairsExercise) _then;

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? instructions = null,Object? pairs = null,Object? explanation = freezed,}) {
  return _then(MatchPairsExercise(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,pairs: null == pairs ? _self._pairs : pairs // ignore: cast_nullable_to_non_nullable
as List<MatchPair>,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class TypeTranslationExercise implements Exercise {
  const TypeTranslationExercise({required this.id, required this.prompt, required  List<String> acceptedAnswers, this.explanation,  String? $type}): _acceptedAnswers = acceptedAnswers,$type = $type ?? 'typeTranslation';
  factory TypeTranslationExercise.fromJson(Map<String, dynamic> json) => _$TypeTranslationExerciseFromJson(json);

@override final  String id;
 final  PunjabiLine prompt;
 final  List<String> _acceptedAnswers;
 List<String> get acceptedAnswers {
  if (_acceptedAnswers is EqualUnmodifiableListView) return _acceptedAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_acceptedAnswers);
}

@override final  String? explanation;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TypeTranslationExerciseCopyWith<TypeTranslationExercise> get copyWith => _$TypeTranslationExerciseCopyWithImpl<TypeTranslationExercise>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TypeTranslationExerciseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TypeTranslationExercise&&(identical(other.id, id) || other.id == id)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&const DeepCollectionEquality().equals(other.acceptedAnswers, _acceptedAnswers)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,prompt,const DeepCollectionEquality().hash(_acceptedAnswers),explanation);
}

@override
String toString() {
    return 'Exercise.typeTranslation(id: $id, prompt: $prompt, acceptedAnswers: $acceptedAnswers, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $TypeTranslationExerciseCopyWith<$Res> implements $ExerciseCopyWith<$Res> {
  factory $TypeTranslationExerciseCopyWith(TypeTranslationExercise value, $Res Function(TypeTranslationExercise) _then) = _$TypeTranslationExerciseCopyWithImpl;
@override @useResult
$Res call({
 String id, PunjabiLine prompt, List<String> acceptedAnswers, String? explanation
});


$PunjabiLineCopyWith<$Res> get prompt;

}
/// @nodoc
class _$TypeTranslationExerciseCopyWithImpl<$Res>
    implements $TypeTranslationExerciseCopyWith<$Res> {
  _$TypeTranslationExerciseCopyWithImpl(this._self, this._then);

  final TypeTranslationExercise _self;
  final $Res Function(TypeTranslationExercise) _then;

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prompt = null,Object? acceptedAnswers = null,Object? explanation = freezed,}) {
  return _then(TypeTranslationExercise(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as PunjabiLine,acceptedAnswers: null == acceptedAnswers ? _self._acceptedAnswers : acceptedAnswers // ignore: cast_nullable_to_non_nullable
as List<String>,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PunjabiLineCopyWith<$Res> get prompt {
  
  return $PunjabiLineCopyWith<$Res>(_self.prompt, (value) {
    return _then(_self.copyWith(prompt: value));
  });
}
}

// dart format on
