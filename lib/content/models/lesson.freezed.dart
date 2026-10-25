// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
LessonSection _$LessonSectionFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'intro':
          return IntroSection.fromJson(
            json
          );
                case 'vocabulary':
          return VocabularySection.fromJson(
            json
          );
                case 'examples':
          return ExamplesSection.fromJson(
            json
          );
                case 'breakdown':
          return BreakdownSection.fromJson(
            json
          );
                case 'grammar':
          return GrammarSection.fromJson(
            json
          );
                case 'whyThisWay':
          return WhyThisWaySection.fromJson(
            json
          );
                case 'conversation':
          return ConversationSection.fromJson(
            json
          );
                case 'exerciseSet':
          return ExerciseSetSection.fromJson(
            json
          );
                case 'summary':
          return SummarySection.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'LessonSection',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$LessonSection {

 String get heading;
/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonSectionCopyWith<LessonSection> get copyWith => _$LessonSectionCopyWithImpl<LessonSection>(this as LessonSection, _$identity);

  /// Serializes this LessonSection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LessonSection;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonSection&&(identical(other.heading, _this.heading) || other.heading == _this.heading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LessonSection;
  return Object.hash(runtimeType,_this.heading);
}

@override
String toString() {
  final _this = this as LessonSection;
  return 'LessonSection(heading: ${_this.heading})';
}


}

/// @nodoc
abstract mixin class $LessonSectionCopyWith<$Res>  {
  factory $LessonSectionCopyWith(LessonSection value, $Res Function(LessonSection) _then) = _$LessonSectionCopyWithImpl;
@useResult
$Res call({
 String heading
});




}
/// @nodoc
class _$LessonSectionCopyWithImpl<$Res>
    implements $LessonSectionCopyWith<$Res> {
  _$LessonSectionCopyWithImpl(this._self, this._then);

  final LessonSection _self;
  final $Res Function(LessonSection) _then;

/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? heading = null,}) {
  return _then(_self.copyWith(
heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LessonSection].
extension LessonSectionPatterns on LessonSection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( IntroSection value)?  intro,TResult Function( VocabularySection value)?  vocabulary,TResult Function( ExamplesSection value)?  examples,TResult Function( BreakdownSection value)?  breakdown,TResult Function( GrammarSection value)?  grammar,TResult Function( WhyThisWaySection value)?  whyThisWay,TResult Function( ConversationSection value)?  conversation,TResult Function( ExerciseSetSection value)?  exerciseSet,TResult Function( SummarySection value)?  summary,required TResult orElse(),}){
final _that = this;
switch (_that) {
case IntroSection() when intro != null:
return intro(_that);case VocabularySection() when vocabulary != null:
return vocabulary(_that);case ExamplesSection() when examples != null:
return examples(_that);case BreakdownSection() when breakdown != null:
return breakdown(_that);case GrammarSection() when grammar != null:
return grammar(_that);case WhyThisWaySection() when whyThisWay != null:
return whyThisWay(_that);case ConversationSection() when conversation != null:
return conversation(_that);case ExerciseSetSection() when exerciseSet != null:
return exerciseSet(_that);case SummarySection() when summary != null:
return summary(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( IntroSection value)  intro,required TResult Function( VocabularySection value)  vocabulary,required TResult Function( ExamplesSection value)  examples,required TResult Function( BreakdownSection value)  breakdown,required TResult Function( GrammarSection value)  grammar,required TResult Function( WhyThisWaySection value)  whyThisWay,required TResult Function( ConversationSection value)  conversation,required TResult Function( ExerciseSetSection value)  exerciseSet,required TResult Function( SummarySection value)  summary,}){
final _that = this;
switch (_that) {
case IntroSection():
return intro(_that);case VocabularySection():
return vocabulary(_that);case ExamplesSection():
return examples(_that);case BreakdownSection():
return breakdown(_that);case GrammarSection():
return grammar(_that);case WhyThisWaySection():
return whyThisWay(_that);case ConversationSection():
return conversation(_that);case ExerciseSetSection():
return exerciseSet(_that);case SummarySection():
return summary(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( IntroSection value)?  intro,TResult? Function( VocabularySection value)?  vocabulary,TResult? Function( ExamplesSection value)?  examples,TResult? Function( BreakdownSection value)?  breakdown,TResult? Function( GrammarSection value)?  grammar,TResult? Function( WhyThisWaySection value)?  whyThisWay,TResult? Function( ConversationSection value)?  conversation,TResult? Function( ExerciseSetSection value)?  exerciseSet,TResult? Function( SummarySection value)?  summary,}){
final _that = this;
switch (_that) {
case IntroSection() when intro != null:
return intro(_that);case VocabularySection() when vocabulary != null:
return vocabulary(_that);case ExamplesSection() when examples != null:
return examples(_that);case BreakdownSection() when breakdown != null:
return breakdown(_that);case GrammarSection() when grammar != null:
return grammar(_that);case WhyThisWaySection() when whyThisWay != null:
return whyThisWay(_that);case ConversationSection() when conversation != null:
return conversation(_that);case ExerciseSetSection() when exerciseSet != null:
return exerciseSet(_that);case SummarySection() when summary != null:
return summary(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String heading,  String body)?  intro,TResult Function( String heading,  List<VocabularyItem> items)?  vocabulary,TResult Function( String heading,  List<Sentence> sentences)?  examples,TResult Function( String heading,  Sentence sentence,  List<WordGloss> glosses,  String? note)?  breakdown,TResult Function( String heading,  String body)?  grammar,TResult Function( String heading,  String body)?  whyThisWay,TResult Function( String heading,  Conversation conversation)?  conversation,TResult Function( String heading,  List<Exercise> exercises)?  exerciseSet,TResult Function( String heading,  String body,  List<String> keyPoints)?  summary,required TResult orElse(),}) {final _that = this;
switch (_that) {
case IntroSection() when intro != null:
return intro(_that.heading,_that.body);case VocabularySection() when vocabulary != null:
return vocabulary(_that.heading,_that.items);case ExamplesSection() when examples != null:
return examples(_that.heading,_that.sentences);case BreakdownSection() when breakdown != null:
return breakdown(_that.heading,_that.sentence,_that.glosses,_that.note);case GrammarSection() when grammar != null:
return grammar(_that.heading,_that.body);case WhyThisWaySection() when whyThisWay != null:
return whyThisWay(_that.heading,_that.body);case ConversationSection() when conversation != null:
return conversation(_that.heading,_that.conversation);case ExerciseSetSection() when exerciseSet != null:
return exerciseSet(_that.heading,_that.exercises);case SummarySection() when summary != null:
return summary(_that.heading,_that.body,_that.keyPoints);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String heading,  String body)  intro,required TResult Function( String heading,  List<VocabularyItem> items)  vocabulary,required TResult Function( String heading,  List<Sentence> sentences)  examples,required TResult Function( String heading,  Sentence sentence,  List<WordGloss> glosses,  String? note)  breakdown,required TResult Function( String heading,  String body)  grammar,required TResult Function( String heading,  String body)  whyThisWay,required TResult Function( String heading,  Conversation conversation)  conversation,required TResult Function( String heading,  List<Exercise> exercises)  exerciseSet,required TResult Function( String heading,  String body,  List<String> keyPoints)  summary,}) {final _that = this;
switch (_that) {
case IntroSection():
return intro(_that.heading,_that.body);case VocabularySection():
return vocabulary(_that.heading,_that.items);case ExamplesSection():
return examples(_that.heading,_that.sentences);case BreakdownSection():
return breakdown(_that.heading,_that.sentence,_that.glosses,_that.note);case GrammarSection():
return grammar(_that.heading,_that.body);case WhyThisWaySection():
return whyThisWay(_that.heading,_that.body);case ConversationSection():
return conversation(_that.heading,_that.conversation);case ExerciseSetSection():
return exerciseSet(_that.heading,_that.exercises);case SummarySection():
return summary(_that.heading,_that.body,_that.keyPoints);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String heading,  String body)?  intro,TResult? Function( String heading,  List<VocabularyItem> items)?  vocabulary,TResult? Function( String heading,  List<Sentence> sentences)?  examples,TResult? Function( String heading,  Sentence sentence,  List<WordGloss> glosses,  String? note)?  breakdown,TResult? Function( String heading,  String body)?  grammar,TResult? Function( String heading,  String body)?  whyThisWay,TResult? Function( String heading,  Conversation conversation)?  conversation,TResult? Function( String heading,  List<Exercise> exercises)?  exerciseSet,TResult? Function( String heading,  String body,  List<String> keyPoints)?  summary,}) {final _that = this;
switch (_that) {
case IntroSection() when intro != null:
return intro(_that.heading,_that.body);case VocabularySection() when vocabulary != null:
return vocabulary(_that.heading,_that.items);case ExamplesSection() when examples != null:
return examples(_that.heading,_that.sentences);case BreakdownSection() when breakdown != null:
return breakdown(_that.heading,_that.sentence,_that.glosses,_that.note);case GrammarSection() when grammar != null:
return grammar(_that.heading,_that.body);case WhyThisWaySection() when whyThisWay != null:
return whyThisWay(_that.heading,_that.body);case ConversationSection() when conversation != null:
return conversation(_that.heading,_that.conversation);case ExerciseSetSection() when exerciseSet != null:
return exerciseSet(_that.heading,_that.exercises);case SummarySection() when summary != null:
return summary(_that.heading,_that.body,_that.keyPoints);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class IntroSection implements LessonSection {
  const IntroSection({required this.heading, required this.body,  String? $type}): $type = $type ?? 'intro';
  factory IntroSection.fromJson(Map<String, dynamic> json) => _$IntroSectionFromJson(json);

@override final  String heading;
 final  String body;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IntroSectionCopyWith<IntroSection> get copyWith => _$IntroSectionCopyWithImpl<IntroSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IntroSectionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is IntroSection&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,heading,body);
}

@override
String toString() {
    return 'LessonSection.intro(heading: $heading, body: $body)';
}


}

/// @nodoc
abstract mixin class $IntroSectionCopyWith<$Res> implements $LessonSectionCopyWith<$Res> {
  factory $IntroSectionCopyWith(IntroSection value, $Res Function(IntroSection) _then) = _$IntroSectionCopyWithImpl;
@override @useResult
$Res call({
 String heading, String body
});




}
/// @nodoc
class _$IntroSectionCopyWithImpl<$Res>
    implements $IntroSectionCopyWith<$Res> {
  _$IntroSectionCopyWithImpl(this._self, this._then);

  final IntroSection _self;
  final $Res Function(IntroSection) _then;

/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? heading = null,Object? body = null,}) {
  return _then(IntroSection(
heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class VocabularySection implements LessonSection {
  const VocabularySection({required this.heading, required  List<VocabularyItem> items,  String? $type}): _items = items,$type = $type ?? 'vocabulary';
  factory VocabularySection.fromJson(Map<String, dynamic> json) => _$VocabularySectionFromJson(json);

@override final  String heading;
 final  List<VocabularyItem> _items;
 List<VocabularyItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VocabularySectionCopyWith<VocabularySection> get copyWith => _$VocabularySectionCopyWithImpl<VocabularySection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VocabularySectionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is VocabularySection&&(identical(other.heading, heading) || other.heading == heading)&&const DeepCollectionEquality().equals(other.items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,heading,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'LessonSection.vocabulary(heading: $heading, items: $items)';
}


}

/// @nodoc
abstract mixin class $VocabularySectionCopyWith<$Res> implements $LessonSectionCopyWith<$Res> {
  factory $VocabularySectionCopyWith(VocabularySection value, $Res Function(VocabularySection) _then) = _$VocabularySectionCopyWithImpl;
@override @useResult
$Res call({
 String heading, List<VocabularyItem> items
});




}
/// @nodoc
class _$VocabularySectionCopyWithImpl<$Res>
    implements $VocabularySectionCopyWith<$Res> {
  _$VocabularySectionCopyWithImpl(this._self, this._then);

  final VocabularySection _self;
  final $Res Function(VocabularySection) _then;

/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? heading = null,Object? items = null,}) {
  return _then(VocabularySection(
heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<VocabularyItem>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ExamplesSection implements LessonSection {
  const ExamplesSection({required this.heading, required  List<Sentence> sentences,  String? $type}): _sentences = sentences,$type = $type ?? 'examples';
  factory ExamplesSection.fromJson(Map<String, dynamic> json) => _$ExamplesSectionFromJson(json);

@override final  String heading;
 final  List<Sentence> _sentences;
 List<Sentence> get sentences {
  if (_sentences is EqualUnmodifiableListView) return _sentences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sentences);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExamplesSectionCopyWith<ExamplesSection> get copyWith => _$ExamplesSectionCopyWithImpl<ExamplesSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExamplesSectionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ExamplesSection&&(identical(other.heading, heading) || other.heading == heading)&&const DeepCollectionEquality().equals(other.sentences, _sentences));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,heading,const DeepCollectionEquality().hash(_sentences));
}

@override
String toString() {
    return 'LessonSection.examples(heading: $heading, sentences: $sentences)';
}


}

/// @nodoc
abstract mixin class $ExamplesSectionCopyWith<$Res> implements $LessonSectionCopyWith<$Res> {
  factory $ExamplesSectionCopyWith(ExamplesSection value, $Res Function(ExamplesSection) _then) = _$ExamplesSectionCopyWithImpl;
@override @useResult
$Res call({
 String heading, List<Sentence> sentences
});




}
/// @nodoc
class _$ExamplesSectionCopyWithImpl<$Res>
    implements $ExamplesSectionCopyWith<$Res> {
  _$ExamplesSectionCopyWithImpl(this._self, this._then);

  final ExamplesSection _self;
  final $Res Function(ExamplesSection) _then;

/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? heading = null,Object? sentences = null,}) {
  return _then(ExamplesSection(
heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as String,sentences: null == sentences ? _self._sentences : sentences // ignore: cast_nullable_to_non_nullable
as List<Sentence>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class BreakdownSection implements LessonSection {
  const BreakdownSection({required this.heading, required this.sentence, required  List<WordGloss> glosses, this.note,  String? $type}): _glosses = glosses,$type = $type ?? 'breakdown';
  factory BreakdownSection.fromJson(Map<String, dynamic> json) => _$BreakdownSectionFromJson(json);

@override final  String heading;
 final  Sentence sentence;
 final  List<WordGloss> _glosses;
 List<WordGloss> get glosses {
  if (_glosses is EqualUnmodifiableListView) return _glosses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_glosses);
}

 final  String? note;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BreakdownSectionCopyWith<BreakdownSection> get copyWith => _$BreakdownSectionCopyWithImpl<BreakdownSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BreakdownSectionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BreakdownSection&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.sentence, sentence) || other.sentence == sentence)&&const DeepCollectionEquality().equals(other.glosses, _glosses)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,heading,sentence,const DeepCollectionEquality().hash(_glosses),note);
}

@override
String toString() {
    return 'LessonSection.breakdown(heading: $heading, sentence: $sentence, glosses: $glosses, note: $note)';
}


}

/// @nodoc
abstract mixin class $BreakdownSectionCopyWith<$Res> implements $LessonSectionCopyWith<$Res> {
  factory $BreakdownSectionCopyWith(BreakdownSection value, $Res Function(BreakdownSection) _then) = _$BreakdownSectionCopyWithImpl;
@override @useResult
$Res call({
 String heading, Sentence sentence, List<WordGloss> glosses, String? note
});


$SentenceCopyWith<$Res> get sentence;

}
/// @nodoc
class _$BreakdownSectionCopyWithImpl<$Res>
    implements $BreakdownSectionCopyWith<$Res> {
  _$BreakdownSectionCopyWithImpl(this._self, this._then);

  final BreakdownSection _self;
  final $Res Function(BreakdownSection) _then;

/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? heading = null,Object? sentence = null,Object? glosses = null,Object? note = freezed,}) {
  return _then(BreakdownSection(
heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as String,sentence: null == sentence ? _self.sentence : sentence // ignore: cast_nullable_to_non_nullable
as Sentence,glosses: null == glosses ? _self._glosses : glosses // ignore: cast_nullable_to_non_nullable
as List<WordGloss>,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SentenceCopyWith<$Res> get sentence {
  
  return $SentenceCopyWith<$Res>(_self.sentence, (value) {
    return _then(_self.copyWith(sentence: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class GrammarSection implements LessonSection {
  const GrammarSection({required this.heading, required this.body,  String? $type}): $type = $type ?? 'grammar';
  factory GrammarSection.fromJson(Map<String, dynamic> json) => _$GrammarSectionFromJson(json);

@override final  String heading;
 final  String body;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GrammarSectionCopyWith<GrammarSection> get copyWith => _$GrammarSectionCopyWithImpl<GrammarSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GrammarSectionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GrammarSection&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,heading,body);
}

@override
String toString() {
    return 'LessonSection.grammar(heading: $heading, body: $body)';
}


}

/// @nodoc
abstract mixin class $GrammarSectionCopyWith<$Res> implements $LessonSectionCopyWith<$Res> {
  factory $GrammarSectionCopyWith(GrammarSection value, $Res Function(GrammarSection) _then) = _$GrammarSectionCopyWithImpl;
@override @useResult
$Res call({
 String heading, String body
});




}
/// @nodoc
class _$GrammarSectionCopyWithImpl<$Res>
    implements $GrammarSectionCopyWith<$Res> {
  _$GrammarSectionCopyWithImpl(this._self, this._then);

  final GrammarSection _self;
  final $Res Function(GrammarSection) _then;

/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? heading = null,Object? body = null,}) {
  return _then(GrammarSection(
heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class WhyThisWaySection implements LessonSection {
  const WhyThisWaySection({required this.heading, required this.body,  String? $type}): $type = $type ?? 'whyThisWay';
  factory WhyThisWaySection.fromJson(Map<String, dynamic> json) => _$WhyThisWaySectionFromJson(json);

@override final  String heading;
 final  String body;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WhyThisWaySectionCopyWith<WhyThisWaySection> get copyWith => _$WhyThisWaySectionCopyWithImpl<WhyThisWaySection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WhyThisWaySectionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is WhyThisWaySection&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,heading,body);
}

@override
String toString() {
    return 'LessonSection.whyThisWay(heading: $heading, body: $body)';
}


}

/// @nodoc
abstract mixin class $WhyThisWaySectionCopyWith<$Res> implements $LessonSectionCopyWith<$Res> {
  factory $WhyThisWaySectionCopyWith(WhyThisWaySection value, $Res Function(WhyThisWaySection) _then) = _$WhyThisWaySectionCopyWithImpl;
@override @useResult
$Res call({
 String heading, String body
});




}
/// @nodoc
class _$WhyThisWaySectionCopyWithImpl<$Res>
    implements $WhyThisWaySectionCopyWith<$Res> {
  _$WhyThisWaySectionCopyWithImpl(this._self, this._then);

  final WhyThisWaySection _self;
  final $Res Function(WhyThisWaySection) _then;

/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? heading = null,Object? body = null,}) {
  return _then(WhyThisWaySection(
heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ConversationSection implements LessonSection {
  const ConversationSection({required this.heading, required this.conversation,  String? $type}): $type = $type ?? 'conversation';
  factory ConversationSection.fromJson(Map<String, dynamic> json) => _$ConversationSectionFromJson(json);

@override final  String heading;
 final  Conversation conversation;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationSectionCopyWith<ConversationSection> get copyWith => _$ConversationSectionCopyWithImpl<ConversationSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationSectionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationSection&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.conversation, conversation) || other.conversation == conversation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,heading,conversation);
}

@override
String toString() {
    return 'LessonSection.conversation(heading: $heading, conversation: $conversation)';
}


}

/// @nodoc
abstract mixin class $ConversationSectionCopyWith<$Res> implements $LessonSectionCopyWith<$Res> {
  factory $ConversationSectionCopyWith(ConversationSection value, $Res Function(ConversationSection) _then) = _$ConversationSectionCopyWithImpl;
@override @useResult
$Res call({
 String heading, Conversation conversation
});


$ConversationCopyWith<$Res> get conversation;

}
/// @nodoc
class _$ConversationSectionCopyWithImpl<$Res>
    implements $ConversationSectionCopyWith<$Res> {
  _$ConversationSectionCopyWithImpl(this._self, this._then);

  final ConversationSection _self;
  final $Res Function(ConversationSection) _then;

/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? heading = null,Object? conversation = null,}) {
  return _then(ConversationSection(
heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as String,conversation: null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as Conversation,
  ));
}

/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConversationCopyWith<$Res> get conversation {
  
  return $ConversationCopyWith<$Res>(_self.conversation, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ExerciseSetSection implements LessonSection {
  const ExerciseSetSection({required this.heading, required  List<Exercise> exercises,  String? $type}): _exercises = exercises,$type = $type ?? 'exerciseSet';
  factory ExerciseSetSection.fromJson(Map<String, dynamic> json) => _$ExerciseSetSectionFromJson(json);

@override final  String heading;
 final  List<Exercise> _exercises;
 List<Exercise> get exercises {
  if (_exercises is EqualUnmodifiableListView) return _exercises;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exercises);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseSetSectionCopyWith<ExerciseSetSection> get copyWith => _$ExerciseSetSectionCopyWithImpl<ExerciseSetSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExerciseSetSectionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseSetSection&&(identical(other.heading, heading) || other.heading == heading)&&const DeepCollectionEquality().equals(other.exercises, _exercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,heading,const DeepCollectionEquality().hash(_exercises));
}

@override
String toString() {
    return 'LessonSection.exerciseSet(heading: $heading, exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class $ExerciseSetSectionCopyWith<$Res> implements $LessonSectionCopyWith<$Res> {
  factory $ExerciseSetSectionCopyWith(ExerciseSetSection value, $Res Function(ExerciseSetSection) _then) = _$ExerciseSetSectionCopyWithImpl;
@override @useResult
$Res call({
 String heading, List<Exercise> exercises
});




}
/// @nodoc
class _$ExerciseSetSectionCopyWithImpl<$Res>
    implements $ExerciseSetSectionCopyWith<$Res> {
  _$ExerciseSetSectionCopyWithImpl(this._self, this._then);

  final ExerciseSetSection _self;
  final $Res Function(ExerciseSetSection) _then;

/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? heading = null,Object? exercises = null,}) {
  return _then(ExerciseSetSection(
heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as String,exercises: null == exercises ? _self._exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<Exercise>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SummarySection implements LessonSection {
  const SummarySection({required this.heading, required this.body,  List<String> keyPoints = const [],  String? $type}): _keyPoints = keyPoints,$type = $type ?? 'summary';
  factory SummarySection.fromJson(Map<String, dynamic> json) => _$SummarySectionFromJson(json);

@override final  String heading;
 final  String body;
 final  List<String> _keyPoints;
@JsonKey() List<String> get keyPoints {
  if (_keyPoints is EqualUnmodifiableListView) return _keyPoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keyPoints);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummarySectionCopyWith<SummarySection> get copyWith => _$SummarySectionCopyWithImpl<SummarySection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SummarySectionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SummarySection&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other.keyPoints, _keyPoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,heading,body,const DeepCollectionEquality().hash(_keyPoints));
}

@override
String toString() {
    return 'LessonSection.summary(heading: $heading, body: $body, keyPoints: $keyPoints)';
}


}

/// @nodoc
abstract mixin class $SummarySectionCopyWith<$Res> implements $LessonSectionCopyWith<$Res> {
  factory $SummarySectionCopyWith(SummarySection value, $Res Function(SummarySection) _then) = _$SummarySectionCopyWithImpl;
@override @useResult
$Res call({
 String heading, String body, List<String> keyPoints
});




}
/// @nodoc
class _$SummarySectionCopyWithImpl<$Res>
    implements $SummarySectionCopyWith<$Res> {
  _$SummarySectionCopyWithImpl(this._self, this._then);

  final SummarySection _self;
  final $Res Function(SummarySection) _then;

/// Create a copy of LessonSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? heading = null,Object? body = null,Object? keyPoints = null,}) {
  return _then(SummarySection(
heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,keyPoints: null == keyPoints ? _self._keyPoints : keyPoints // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$Lesson {

 String get id; String get moduleId; String get title; String? get subtitle; int get estimatedMinutes; List<LessonSection> get sections; VerificationStatus get verificationStatus;
/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonCopyWith<Lesson> get copyWith => _$LessonCopyWithImpl<Lesson>(this as Lesson, _$identity);

  /// Serializes this Lesson to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Lesson;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Lesson&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.moduleId, _this.moduleId) || other.moduleId == _this.moduleId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.subtitle, _this.subtitle) || other.subtitle == _this.subtitle)&&(identical(other.estimatedMinutes, _this.estimatedMinutes) || other.estimatedMinutes == _this.estimatedMinutes)&&const DeepCollectionEquality().equals(other.sections, _this.sections)&&(identical(other.verificationStatus, _this.verificationStatus) || other.verificationStatus == _this.verificationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Lesson;
  return Object.hash(runtimeType,_this.id,_this.moduleId,_this.title,_this.subtitle,_this.estimatedMinutes,const DeepCollectionEquality().hash(_this.sections),_this.verificationStatus);
}

@override
String toString() {
  final _this = this as Lesson;
  return 'Lesson(id: ${_this.id}, moduleId: ${_this.moduleId}, title: ${_this.title}, subtitle: ${_this.subtitle}, estimatedMinutes: ${_this.estimatedMinutes}, sections: ${_this.sections}, verificationStatus: ${_this.verificationStatus})';
}


}

/// @nodoc
abstract mixin class $LessonCopyWith<$Res>  {
  factory $LessonCopyWith(Lesson value, $Res Function(Lesson) _then) = _$LessonCopyWithImpl;
@useResult
$Res call({
 String id, String moduleId, String title, String? subtitle, int estimatedMinutes, List<LessonSection> sections, VerificationStatus verificationStatus
});




}
/// @nodoc
class _$LessonCopyWithImpl<$Res>
    implements $LessonCopyWith<$Res> {
  _$LessonCopyWithImpl(this._self, this._then);

  final Lesson _self;
  final $Res Function(Lesson) _then;

/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? moduleId = null,Object? title = null,Object? subtitle = freezed,Object? estimatedMinutes = null,Object? sections = null,Object? verificationStatus = null,}) {
  return _then(Lesson(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,moduleId: null == moduleId ? _self.moduleId : moduleId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,estimatedMinutes: null == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<LessonSection>,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as VerificationStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [Lesson].
extension LessonPatterns on Lesson {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Lesson value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Lesson() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Lesson value)  $default,){
final _that = this;
switch (_that) {
case _Lesson():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Lesson value)?  $default,){
final _that = this;
switch (_that) {
case _Lesson() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String moduleId,  String title,  String? subtitle,  int estimatedMinutes,  List<LessonSection> sections,  VerificationStatus verificationStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Lesson() when $default != null:
return $default(_that.id,_that.moduleId,_that.title,_that.subtitle,_that.estimatedMinutes,_that.sections,_that.verificationStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String moduleId,  String title,  String? subtitle,  int estimatedMinutes,  List<LessonSection> sections,  VerificationStatus verificationStatus)  $default,) {final _that = this;
switch (_that) {
case _Lesson():
return $default(_that.id,_that.moduleId,_that.title,_that.subtitle,_that.estimatedMinutes,_that.sections,_that.verificationStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String moduleId,  String title,  String? subtitle,  int estimatedMinutes,  List<LessonSection> sections,  VerificationStatus verificationStatus)?  $default,) {final _that = this;
switch (_that) {
case _Lesson() when $default != null:
return $default(_that.id,_that.moduleId,_that.title,_that.subtitle,_that.estimatedMinutes,_that.sections,_that.verificationStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Lesson implements Lesson {
  const _Lesson({required this.id, required this.moduleId, required this.title, this.subtitle, this.estimatedMinutes = 15,  List<LessonSection> sections = const [], this.verificationStatus = VerificationStatus.unverified}): _sections = sections;
  factory _Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

@override final  String id;
@override final  String moduleId;
@override final  String title;
@override final  String? subtitle;
@override@JsonKey() final  int estimatedMinutes;
 final  List<LessonSection> _sections;
@override@JsonKey() List<LessonSection> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}

@override@JsonKey() final  VerificationStatus verificationStatus;

/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonCopyWith<_Lesson> get copyWith => __$LessonCopyWithImpl<_Lesson>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LessonToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Lesson&&(identical(other.id, id) || other.id == id)&&(identical(other.moduleId, moduleId) || other.moduleId == moduleId)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.estimatedMinutes, estimatedMinutes) || other.estimatedMinutes == estimatedMinutes)&&const DeepCollectionEquality().equals(other.sections, _sections)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,moduleId,title,subtitle,estimatedMinutes,const DeepCollectionEquality().hash(_sections),verificationStatus);
}

@override
String toString() {
    return 'Lesson(id: $id, moduleId: $moduleId, title: $title, subtitle: $subtitle, estimatedMinutes: $estimatedMinutes, sections: $sections, verificationStatus: $verificationStatus)';
}


}

/// @nodoc
abstract mixin class _$LessonCopyWith<$Res> implements $LessonCopyWith<$Res> {
  factory _$LessonCopyWith(_Lesson value, $Res Function(_Lesson) _then) = __$LessonCopyWithImpl;
@override @useResult
$Res call({
 String id, String moduleId, String title, String? subtitle, int estimatedMinutes, List<LessonSection> sections, VerificationStatus verificationStatus
});




}
/// @nodoc
class __$LessonCopyWithImpl<$Res>
    implements _$LessonCopyWith<$Res> {
  __$LessonCopyWithImpl(this._self, this._then);

  final _Lesson _self;
  final $Res Function(_Lesson) _then;

/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? moduleId = null,Object? title = null,Object? subtitle = freezed,Object? estimatedMinutes = null,Object? sections = null,Object? verificationStatus = null,}) {
  return _then(_Lesson(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,moduleId: null == moduleId ? _self.moduleId : moduleId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,estimatedMinutes: null == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<LessonSection>,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as VerificationStatus,
  ));
}


}

// dart format on
