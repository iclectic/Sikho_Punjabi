// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LessonProgressTableTable extends LessonProgressTable
    with TableInfo<$LessonProgressTableTable, LessonProgressTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LessonProgressTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lessonIdMeta = const VerificationMeta(
    'lessonId',
  );
  @override
  late final GeneratedColumn<String> lessonId = GeneratedColumn<String>(
    'lesson_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastSectionIndexMeta = const VerificationMeta(
    'lastSectionIndex',
  );
  @override
  late final GeneratedColumn<int> lastSectionIndex = GeneratedColumn<int>(
    'last_section_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _completedMeta = const VerificationMeta(
    'completed',
  );
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
    'completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    lessonId,
    lastSectionIndex,
    completed,
    completedAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lesson_progress_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LessonProgressTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('lesson_id')) {
      context.handle(
        _lessonIdMeta,
        lessonId.isAcceptableOrUnknown(data['lesson_id']!, _lessonIdMeta),
      );
    } else if (isInserting) {
      context.missing(_lessonIdMeta);
    }
    if (data.containsKey('last_section_index')) {
      context.handle(
        _lastSectionIndexMeta,
        lastSectionIndex.isAcceptableOrUnknown(
          data['last_section_index']!,
          _lastSectionIndexMeta,
        ),
      );
    }
    if (data.containsKey('completed')) {
      context.handle(
        _completedMeta,
        completed.isAcceptableOrUnknown(data['completed']!, _completedMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {lessonId};
  @override
  LessonProgressTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LessonProgressTableData(
      lessonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lesson_id'],
      )!,
      lastSectionIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_section_index'],
      )!,
      completed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}completed'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $LessonProgressTableTable createAlias(String alias) {
    return $LessonProgressTableTable(attachedDatabase, alias);
  }
}

class LessonProgressTableData extends DataClass
    implements Insertable<LessonProgressTableData> {
  final String lessonId;
  final int lastSectionIndex;
  final bool completed;
  final DateTime? completedAt;
  final DateTime updatedAt;
  const LessonProgressTableData({
    required this.lessonId,
    required this.lastSectionIndex,
    required this.completed,
    this.completedAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['lesson_id'] = Variable<String>(lessonId);
    map['last_section_index'] = Variable<int>(lastSectionIndex);
    map['completed'] = Variable<bool>(completed);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LessonProgressTableCompanion toCompanion(bool nullToAbsent) {
    return LessonProgressTableCompanion(
      lessonId: Value(lessonId),
      lastSectionIndex: Value(lastSectionIndex),
      completed: Value(completed),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory LessonProgressTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LessonProgressTableData(
      lessonId: serializer.fromJson<String>(json['lessonId']),
      lastSectionIndex: serializer.fromJson<int>(json['lastSectionIndex']),
      completed: serializer.fromJson<bool>(json['completed']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lessonId': serializer.toJson<String>(lessonId),
      'lastSectionIndex': serializer.toJson<int>(lastSectionIndex),
      'completed': serializer.toJson<bool>(completed),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LessonProgressTableData copyWith({
    String? lessonId,
    int? lastSectionIndex,
    bool? completed,
    Value<DateTime?> completedAt = const Value.absent(),
    DateTime? updatedAt,
  }) => LessonProgressTableData(
    lessonId: lessonId ?? this.lessonId,
    lastSectionIndex: lastSectionIndex ?? this.lastSectionIndex,
    completed: completed ?? this.completed,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  LessonProgressTableData copyWithCompanion(LessonProgressTableCompanion data) {
    return LessonProgressTableData(
      lessonId: data.lessonId.present ? data.lessonId.value : this.lessonId,
      lastSectionIndex: data.lastSectionIndex.present
          ? data.lastSectionIndex.value
          : this.lastSectionIndex,
      completed: data.completed.present ? data.completed.value : this.completed,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LessonProgressTableData(')
          ..write('lessonId: $lessonId, ')
          ..write('lastSectionIndex: $lastSectionIndex, ')
          ..write('completed: $completed, ')
          ..write('completedAt: $completedAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    lessonId,
    lastSectionIndex,
    completed,
    completedAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LessonProgressTableData &&
          other.lessonId == this.lessonId &&
          other.lastSectionIndex == this.lastSectionIndex &&
          other.completed == this.completed &&
          other.completedAt == this.completedAt &&
          other.updatedAt == this.updatedAt);
}

class LessonProgressTableCompanion
    extends UpdateCompanion<LessonProgressTableData> {
  final Value<String> lessonId;
  final Value<int> lastSectionIndex;
  final Value<bool> completed;
  final Value<DateTime?> completedAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const LessonProgressTableCompanion({
    this.lessonId = const Value.absent(),
    this.lastSectionIndex = const Value.absent(),
    this.completed = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LessonProgressTableCompanion.insert({
    required String lessonId,
    this.lastSectionIndex = const Value.absent(),
    this.completed = const Value.absent(),
    this.completedAt = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : lessonId = Value(lessonId),
       updatedAt = Value(updatedAt);
  static Insertable<LessonProgressTableData> custom({
    Expression<String>? lessonId,
    Expression<int>? lastSectionIndex,
    Expression<bool>? completed,
    Expression<DateTime>? completedAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (lessonId != null) 'lesson_id': lessonId,
      if (lastSectionIndex != null) 'last_section_index': lastSectionIndex,
      if (completed != null) 'completed': completed,
      if (completedAt != null) 'completed_at': completedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LessonProgressTableCompanion copyWith({
    Value<String>? lessonId,
    Value<int>? lastSectionIndex,
    Value<bool>? completed,
    Value<DateTime?>? completedAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return LessonProgressTableCompanion(
      lessonId: lessonId ?? this.lessonId,
      lastSectionIndex: lastSectionIndex ?? this.lastSectionIndex,
      completed: completed ?? this.completed,
      completedAt: completedAt ?? this.completedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lessonId.present) {
      map['lesson_id'] = Variable<String>(lessonId.value);
    }
    if (lastSectionIndex.present) {
      map['last_section_index'] = Variable<int>(lastSectionIndex.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LessonProgressTableCompanion(')
          ..write('lessonId: $lessonId, ')
          ..write('lastSectionIndex: $lastSectionIndex, ')
          ..write('completed: $completed, ')
          ..write('completedAt: $completedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FlashcardsTableTable extends FlashcardsTable
    with TableInfo<$FlashcardsTableTable, FlashcardsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FlashcardsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lessonIdMeta = const VerificationMeta(
    'lessonId',
  );
  @override
  late final GeneratedColumn<String> lessonId = GeneratedColumn<String>(
    'lesson_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gurmukhiMeta = const VerificationMeta(
    'gurmukhi',
  );
  @override
  late final GeneratedColumn<String> gurmukhi = GeneratedColumn<String>(
    'gurmukhi',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _romanisedMeta = const VerificationMeta(
    'romanised',
  );
  @override
  late final GeneratedColumn<String> romanised = GeneratedColumn<String>(
    'romanised',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _englishMeta = const VerificationMeta(
    'english',
  );
  @override
  late final GeneratedColumn<String> english = GeneratedColumn<String>(
    'english',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _audioRefMeta = const VerificationMeta(
    'audioRef',
  );
  @override
  late final GeneratedColumn<String> audioRef = GeneratedColumn<String>(
    'audio_ref',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _easeFactorMeta = const VerificationMeta(
    'easeFactor',
  );
  @override
  late final GeneratedColumn<double> easeFactor = GeneratedColumn<double>(
    'ease_factor',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(2.5),
  );
  static const VerificationMeta _intervalDaysMeta = const VerificationMeta(
    'intervalDays',
  );
  @override
  late final GeneratedColumn<int> intervalDays = GeneratedColumn<int>(
    'interval_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _repetitionsMeta = const VerificationMeta(
    'repetitions',
  );
  @override
  late final GeneratedColumn<int> repetitions = GeneratedColumn<int>(
    'repetitions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _dueAtMeta = const VerificationMeta('dueAt');
  @override
  late final GeneratedColumn<DateTime> dueAt = GeneratedColumn<DateTime>(
    'due_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastReviewedAtMeta = const VerificationMeta(
    'lastReviewedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastReviewedAt =
      GeneratedColumn<DateTime>(
        'last_reviewed_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lessonId,
    gurmukhi,
    romanised,
    english,
    audioRef,
    easeFactor,
    intervalDays,
    repetitions,
    dueAt,
    lastReviewedAt,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'flashcards_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FlashcardsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('lesson_id')) {
      context.handle(
        _lessonIdMeta,
        lessonId.isAcceptableOrUnknown(data['lesson_id']!, _lessonIdMeta),
      );
    } else if (isInserting) {
      context.missing(_lessonIdMeta);
    }
    if (data.containsKey('gurmukhi')) {
      context.handle(
        _gurmukhiMeta,
        gurmukhi.isAcceptableOrUnknown(data['gurmukhi']!, _gurmukhiMeta),
      );
    } else if (isInserting) {
      context.missing(_gurmukhiMeta);
    }
    if (data.containsKey('romanised')) {
      context.handle(
        _romanisedMeta,
        romanised.isAcceptableOrUnknown(data['romanised']!, _romanisedMeta),
      );
    }
    if (data.containsKey('english')) {
      context.handle(
        _englishMeta,
        english.isAcceptableOrUnknown(data['english']!, _englishMeta),
      );
    }
    if (data.containsKey('audio_ref')) {
      context.handle(
        _audioRefMeta,
        audioRef.isAcceptableOrUnknown(data['audio_ref']!, _audioRefMeta),
      );
    }
    if (data.containsKey('ease_factor')) {
      context.handle(
        _easeFactorMeta,
        easeFactor.isAcceptableOrUnknown(data['ease_factor']!, _easeFactorMeta),
      );
    }
    if (data.containsKey('interval_days')) {
      context.handle(
        _intervalDaysMeta,
        intervalDays.isAcceptableOrUnknown(
          data['interval_days']!,
          _intervalDaysMeta,
        ),
      );
    }
    if (data.containsKey('repetitions')) {
      context.handle(
        _repetitionsMeta,
        repetitions.isAcceptableOrUnknown(
          data['repetitions']!,
          _repetitionsMeta,
        ),
      );
    }
    if (data.containsKey('due_at')) {
      context.handle(
        _dueAtMeta,
        dueAt.isAcceptableOrUnknown(data['due_at']!, _dueAtMeta),
      );
    } else if (isInserting) {
      context.missing(_dueAtMeta);
    }
    if (data.containsKey('last_reviewed_at')) {
      context.handle(
        _lastReviewedAtMeta,
        lastReviewedAt.isAcceptableOrUnknown(
          data['last_reviewed_at']!,
          _lastReviewedAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FlashcardsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FlashcardsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      lessonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lesson_id'],
      )!,
      gurmukhi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gurmukhi'],
      )!,
      romanised: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}romanised'],
      ),
      english: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}english'],
      ),
      audioRef: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_ref'],
      ),
      easeFactor: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ease_factor'],
      )!,
      intervalDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}interval_days'],
      )!,
      repetitions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repetitions'],
      )!,
      dueAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_at'],
      )!,
      lastReviewedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_reviewed_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FlashcardsTableTable createAlias(String alias) {
    return $FlashcardsTableTable(attachedDatabase, alias);
  }
}

class FlashcardsTableData extends DataClass
    implements Insertable<FlashcardsTableData> {
  final String id;
  final String lessonId;
  final String gurmukhi;
  final String? romanised;
  final String? english;
  final String? audioRef;
  final double easeFactor;
  final int intervalDays;
  final int repetitions;
  final DateTime dueAt;
  final DateTime? lastReviewedAt;
  final DateTime createdAt;
  const FlashcardsTableData({
    required this.id,
    required this.lessonId,
    required this.gurmukhi,
    this.romanised,
    this.english,
    this.audioRef,
    required this.easeFactor,
    required this.intervalDays,
    required this.repetitions,
    required this.dueAt,
    this.lastReviewedAt,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['lesson_id'] = Variable<String>(lessonId);
    map['gurmukhi'] = Variable<String>(gurmukhi);
    if (!nullToAbsent || romanised != null) {
      map['romanised'] = Variable<String>(romanised);
    }
    if (!nullToAbsent || english != null) {
      map['english'] = Variable<String>(english);
    }
    if (!nullToAbsent || audioRef != null) {
      map['audio_ref'] = Variable<String>(audioRef);
    }
    map['ease_factor'] = Variable<double>(easeFactor);
    map['interval_days'] = Variable<int>(intervalDays);
    map['repetitions'] = Variable<int>(repetitions);
    map['due_at'] = Variable<DateTime>(dueAt);
    if (!nullToAbsent || lastReviewedAt != null) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FlashcardsTableCompanion toCompanion(bool nullToAbsent) {
    return FlashcardsTableCompanion(
      id: Value(id),
      lessonId: Value(lessonId),
      gurmukhi: Value(gurmukhi),
      romanised: romanised == null && nullToAbsent
          ? const Value.absent()
          : Value(romanised),
      english: english == null && nullToAbsent
          ? const Value.absent()
          : Value(english),
      audioRef: audioRef == null && nullToAbsent
          ? const Value.absent()
          : Value(audioRef),
      easeFactor: Value(easeFactor),
      intervalDays: Value(intervalDays),
      repetitions: Value(repetitions),
      dueAt: Value(dueAt),
      lastReviewedAt: lastReviewedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReviewedAt),
      createdAt: Value(createdAt),
    );
  }

  factory FlashcardsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FlashcardsTableData(
      id: serializer.fromJson<String>(json['id']),
      lessonId: serializer.fromJson<String>(json['lessonId']),
      gurmukhi: serializer.fromJson<String>(json['gurmukhi']),
      romanised: serializer.fromJson<String?>(json['romanised']),
      english: serializer.fromJson<String?>(json['english']),
      audioRef: serializer.fromJson<String?>(json['audioRef']),
      easeFactor: serializer.fromJson<double>(json['easeFactor']),
      intervalDays: serializer.fromJson<int>(json['intervalDays']),
      repetitions: serializer.fromJson<int>(json['repetitions']),
      dueAt: serializer.fromJson<DateTime>(json['dueAt']),
      lastReviewedAt: serializer.fromJson<DateTime?>(json['lastReviewedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'lessonId': serializer.toJson<String>(lessonId),
      'gurmukhi': serializer.toJson<String>(gurmukhi),
      'romanised': serializer.toJson<String?>(romanised),
      'english': serializer.toJson<String?>(english),
      'audioRef': serializer.toJson<String?>(audioRef),
      'easeFactor': serializer.toJson<double>(easeFactor),
      'intervalDays': serializer.toJson<int>(intervalDays),
      'repetitions': serializer.toJson<int>(repetitions),
      'dueAt': serializer.toJson<DateTime>(dueAt),
      'lastReviewedAt': serializer.toJson<DateTime?>(lastReviewedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FlashcardsTableData copyWith({
    String? id,
    String? lessonId,
    String? gurmukhi,
    Value<String?> romanised = const Value.absent(),
    Value<String?> english = const Value.absent(),
    Value<String?> audioRef = const Value.absent(),
    double? easeFactor,
    int? intervalDays,
    int? repetitions,
    DateTime? dueAt,
    Value<DateTime?> lastReviewedAt = const Value.absent(),
    DateTime? createdAt,
  }) => FlashcardsTableData(
    id: id ?? this.id,
    lessonId: lessonId ?? this.lessonId,
    gurmukhi: gurmukhi ?? this.gurmukhi,
    romanised: romanised.present ? romanised.value : this.romanised,
    english: english.present ? english.value : this.english,
    audioRef: audioRef.present ? audioRef.value : this.audioRef,
    easeFactor: easeFactor ?? this.easeFactor,
    intervalDays: intervalDays ?? this.intervalDays,
    repetitions: repetitions ?? this.repetitions,
    dueAt: dueAt ?? this.dueAt,
    lastReviewedAt: lastReviewedAt.present
        ? lastReviewedAt.value
        : this.lastReviewedAt,
    createdAt: createdAt ?? this.createdAt,
  );
  FlashcardsTableData copyWithCompanion(FlashcardsTableCompanion data) {
    return FlashcardsTableData(
      id: data.id.present ? data.id.value : this.id,
      lessonId: data.lessonId.present ? data.lessonId.value : this.lessonId,
      gurmukhi: data.gurmukhi.present ? data.gurmukhi.value : this.gurmukhi,
      romanised: data.romanised.present ? data.romanised.value : this.romanised,
      english: data.english.present ? data.english.value : this.english,
      audioRef: data.audioRef.present ? data.audioRef.value : this.audioRef,
      easeFactor: data.easeFactor.present
          ? data.easeFactor.value
          : this.easeFactor,
      intervalDays: data.intervalDays.present
          ? data.intervalDays.value
          : this.intervalDays,
      repetitions: data.repetitions.present
          ? data.repetitions.value
          : this.repetitions,
      dueAt: data.dueAt.present ? data.dueAt.value : this.dueAt,
      lastReviewedAt: data.lastReviewedAt.present
          ? data.lastReviewedAt.value
          : this.lastReviewedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FlashcardsTableData(')
          ..write('id: $id, ')
          ..write('lessonId: $lessonId, ')
          ..write('gurmukhi: $gurmukhi, ')
          ..write('romanised: $romanised, ')
          ..write('english: $english, ')
          ..write('audioRef: $audioRef, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('intervalDays: $intervalDays, ')
          ..write('repetitions: $repetitions, ')
          ..write('dueAt: $dueAt, ')
          ..write('lastReviewedAt: $lastReviewedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    lessonId,
    gurmukhi,
    romanised,
    english,
    audioRef,
    easeFactor,
    intervalDays,
    repetitions,
    dueAt,
    lastReviewedAt,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FlashcardsTableData &&
          other.id == this.id &&
          other.lessonId == this.lessonId &&
          other.gurmukhi == this.gurmukhi &&
          other.romanised == this.romanised &&
          other.english == this.english &&
          other.audioRef == this.audioRef &&
          other.easeFactor == this.easeFactor &&
          other.intervalDays == this.intervalDays &&
          other.repetitions == this.repetitions &&
          other.dueAt == this.dueAt &&
          other.lastReviewedAt == this.lastReviewedAt &&
          other.createdAt == this.createdAt);
}

class FlashcardsTableCompanion extends UpdateCompanion<FlashcardsTableData> {
  final Value<String> id;
  final Value<String> lessonId;
  final Value<String> gurmukhi;
  final Value<String?> romanised;
  final Value<String?> english;
  final Value<String?> audioRef;
  final Value<double> easeFactor;
  final Value<int> intervalDays;
  final Value<int> repetitions;
  final Value<DateTime> dueAt;
  final Value<DateTime?> lastReviewedAt;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FlashcardsTableCompanion({
    this.id = const Value.absent(),
    this.lessonId = const Value.absent(),
    this.gurmukhi = const Value.absent(),
    this.romanised = const Value.absent(),
    this.english = const Value.absent(),
    this.audioRef = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.intervalDays = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.dueAt = const Value.absent(),
    this.lastReviewedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FlashcardsTableCompanion.insert({
    required String id,
    required String lessonId,
    required String gurmukhi,
    this.romanised = const Value.absent(),
    this.english = const Value.absent(),
    this.audioRef = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.intervalDays = const Value.absent(),
    this.repetitions = const Value.absent(),
    required DateTime dueAt,
    this.lastReviewedAt = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       lessonId = Value(lessonId),
       gurmukhi = Value(gurmukhi),
       dueAt = Value(dueAt),
       createdAt = Value(createdAt);
  static Insertable<FlashcardsTableData> custom({
    Expression<String>? id,
    Expression<String>? lessonId,
    Expression<String>? gurmukhi,
    Expression<String>? romanised,
    Expression<String>? english,
    Expression<String>? audioRef,
    Expression<double>? easeFactor,
    Expression<int>? intervalDays,
    Expression<int>? repetitions,
    Expression<DateTime>? dueAt,
    Expression<DateTime>? lastReviewedAt,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lessonId != null) 'lesson_id': lessonId,
      if (gurmukhi != null) 'gurmukhi': gurmukhi,
      if (romanised != null) 'romanised': romanised,
      if (english != null) 'english': english,
      if (audioRef != null) 'audio_ref': audioRef,
      if (easeFactor != null) 'ease_factor': easeFactor,
      if (intervalDays != null) 'interval_days': intervalDays,
      if (repetitions != null) 'repetitions': repetitions,
      if (dueAt != null) 'due_at': dueAt,
      if (lastReviewedAt != null) 'last_reviewed_at': lastReviewedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FlashcardsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? lessonId,
    Value<String>? gurmukhi,
    Value<String?>? romanised,
    Value<String?>? english,
    Value<String?>? audioRef,
    Value<double>? easeFactor,
    Value<int>? intervalDays,
    Value<int>? repetitions,
    Value<DateTime>? dueAt,
    Value<DateTime?>? lastReviewedAt,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return FlashcardsTableCompanion(
      id: id ?? this.id,
      lessonId: lessonId ?? this.lessonId,
      gurmukhi: gurmukhi ?? this.gurmukhi,
      romanised: romanised ?? this.romanised,
      english: english ?? this.english,
      audioRef: audioRef ?? this.audioRef,
      easeFactor: easeFactor ?? this.easeFactor,
      intervalDays: intervalDays ?? this.intervalDays,
      repetitions: repetitions ?? this.repetitions,
      dueAt: dueAt ?? this.dueAt,
      lastReviewedAt: lastReviewedAt ?? this.lastReviewedAt,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (lessonId.present) {
      map['lesson_id'] = Variable<String>(lessonId.value);
    }
    if (gurmukhi.present) {
      map['gurmukhi'] = Variable<String>(gurmukhi.value);
    }
    if (romanised.present) {
      map['romanised'] = Variable<String>(romanised.value);
    }
    if (english.present) {
      map['english'] = Variable<String>(english.value);
    }
    if (audioRef.present) {
      map['audio_ref'] = Variable<String>(audioRef.value);
    }
    if (easeFactor.present) {
      map['ease_factor'] = Variable<double>(easeFactor.value);
    }
    if (intervalDays.present) {
      map['interval_days'] = Variable<int>(intervalDays.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (dueAt.present) {
      map['due_at'] = Variable<DateTime>(dueAt.value);
    }
    if (lastReviewedAt.present) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlashcardsTableCompanion(')
          ..write('id: $id, ')
          ..write('lessonId: $lessonId, ')
          ..write('gurmukhi: $gurmukhi, ')
          ..write('romanised: $romanised, ')
          ..write('english: $english, ')
          ..write('audioRef: $audioRef, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('intervalDays: $intervalDays, ')
          ..write('repetitions: $repetitions, ')
          ..write('dueAt: $dueAt, ')
          ..write('lastReviewedAt: $lastReviewedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReviewRecordsTableTable extends ReviewRecordsTable
    with TableInfo<$ReviewRecordsTableTable, ReviewRecordsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReviewRecordsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _flashcardIdMeta = const VerificationMeta(
    'flashcardId',
  );
  @override
  late final GeneratedColumn<String> flashcardId = GeneratedColumn<String>(
    'flashcard_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES flashcards_table (id)',
    ),
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reviewedAtMeta = const VerificationMeta(
    'reviewedAt',
  );
  @override
  late final GeneratedColumn<DateTime> reviewedAt = GeneratedColumn<DateTime>(
    'reviewed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, flashcardId, rating, reviewedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'review_records_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReviewRecordsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('flashcard_id')) {
      context.handle(
        _flashcardIdMeta,
        flashcardId.isAcceptableOrUnknown(
          data['flashcard_id']!,
          _flashcardIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_flashcardIdMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('reviewed_at')) {
      context.handle(
        _reviewedAtMeta,
        reviewedAt.isAcceptableOrUnknown(data['reviewed_at']!, _reviewedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_reviewedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReviewRecordsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReviewRecordsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      flashcardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}flashcard_id'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rating'],
      )!,
      reviewedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}reviewed_at'],
      )!,
    );
  }

  @override
  $ReviewRecordsTableTable createAlias(String alias) {
    return $ReviewRecordsTableTable(attachedDatabase, alias);
  }
}

class ReviewRecordsTableData extends DataClass
    implements Insertable<ReviewRecordsTableData> {
  final int id;
  final String flashcardId;
  final int rating;
  final DateTime reviewedAt;
  const ReviewRecordsTableData({
    required this.id,
    required this.flashcardId,
    required this.rating,
    required this.reviewedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['flashcard_id'] = Variable<String>(flashcardId);
    map['rating'] = Variable<int>(rating);
    map['reviewed_at'] = Variable<DateTime>(reviewedAt);
    return map;
  }

  ReviewRecordsTableCompanion toCompanion(bool nullToAbsent) {
    return ReviewRecordsTableCompanion(
      id: Value(id),
      flashcardId: Value(flashcardId),
      rating: Value(rating),
      reviewedAt: Value(reviewedAt),
    );
  }

  factory ReviewRecordsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReviewRecordsTableData(
      id: serializer.fromJson<int>(json['id']),
      flashcardId: serializer.fromJson<String>(json['flashcardId']),
      rating: serializer.fromJson<int>(json['rating']),
      reviewedAt: serializer.fromJson<DateTime>(json['reviewedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'flashcardId': serializer.toJson<String>(flashcardId),
      'rating': serializer.toJson<int>(rating),
      'reviewedAt': serializer.toJson<DateTime>(reviewedAt),
    };
  }

  ReviewRecordsTableData copyWith({
    int? id,
    String? flashcardId,
    int? rating,
    DateTime? reviewedAt,
  }) => ReviewRecordsTableData(
    id: id ?? this.id,
    flashcardId: flashcardId ?? this.flashcardId,
    rating: rating ?? this.rating,
    reviewedAt: reviewedAt ?? this.reviewedAt,
  );
  ReviewRecordsTableData copyWithCompanion(ReviewRecordsTableCompanion data) {
    return ReviewRecordsTableData(
      id: data.id.present ? data.id.value : this.id,
      flashcardId: data.flashcardId.present
          ? data.flashcardId.value
          : this.flashcardId,
      rating: data.rating.present ? data.rating.value : this.rating,
      reviewedAt: data.reviewedAt.present
          ? data.reviewedAt.value
          : this.reviewedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReviewRecordsTableData(')
          ..write('id: $id, ')
          ..write('flashcardId: $flashcardId, ')
          ..write('rating: $rating, ')
          ..write('reviewedAt: $reviewedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, flashcardId, rating, reviewedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReviewRecordsTableData &&
          other.id == this.id &&
          other.flashcardId == this.flashcardId &&
          other.rating == this.rating &&
          other.reviewedAt == this.reviewedAt);
}

class ReviewRecordsTableCompanion
    extends UpdateCompanion<ReviewRecordsTableData> {
  final Value<int> id;
  final Value<String> flashcardId;
  final Value<int> rating;
  final Value<DateTime> reviewedAt;
  const ReviewRecordsTableCompanion({
    this.id = const Value.absent(),
    this.flashcardId = const Value.absent(),
    this.rating = const Value.absent(),
    this.reviewedAt = const Value.absent(),
  });
  ReviewRecordsTableCompanion.insert({
    this.id = const Value.absent(),
    required String flashcardId,
    required int rating,
    required DateTime reviewedAt,
  }) : flashcardId = Value(flashcardId),
       rating = Value(rating),
       reviewedAt = Value(reviewedAt);
  static Insertable<ReviewRecordsTableData> custom({
    Expression<int>? id,
    Expression<String>? flashcardId,
    Expression<int>? rating,
    Expression<DateTime>? reviewedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (flashcardId != null) 'flashcard_id': flashcardId,
      if (rating != null) 'rating': rating,
      if (reviewedAt != null) 'reviewed_at': reviewedAt,
    });
  }

  ReviewRecordsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? flashcardId,
    Value<int>? rating,
    Value<DateTime>? reviewedAt,
  }) {
    return ReviewRecordsTableCompanion(
      id: id ?? this.id,
      flashcardId: flashcardId ?? this.flashcardId,
      rating: rating ?? this.rating,
      reviewedAt: reviewedAt ?? this.reviewedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (flashcardId.present) {
      map['flashcard_id'] = Variable<String>(flashcardId.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (reviewedAt.present) {
      map['reviewed_at'] = Variable<DateTime>(reviewedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReviewRecordsTableCompanion(')
          ..write('id: $id, ')
          ..write('flashcardId: $flashcardId, ')
          ..write('rating: $rating, ')
          ..write('reviewedAt: $reviewedAt')
          ..write(')'))
        .toString();
  }
}

class $StudySessionsTableTable extends StudySessionsTable
    with TableInfo<$StudySessionsTableTable, StudySessionsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudySessionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _lessonIdMeta = const VerificationMeta(
    'lessonId',
  );
  @override
  late final GeneratedColumn<String> lessonId = GeneratedColumn<String>(
    'lesson_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lessonId,
    startedAt,
    durationSeconds,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'study_sessions_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudySessionsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lesson_id')) {
      context.handle(
        _lessonIdMeta,
        lessonId.isAcceptableOrUnknown(data['lesson_id']!, _lessonIdMeta),
      );
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudySessionsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudySessionsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lessonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lesson_id'],
      ),
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      )!,
    );
  }

  @override
  $StudySessionsTableTable createAlias(String alias) {
    return $StudySessionsTableTable(attachedDatabase, alias);
  }
}

class StudySessionsTableData extends DataClass
    implements Insertable<StudySessionsTableData> {
  final int id;
  final String? lessonId;
  final DateTime startedAt;
  final int durationSeconds;
  const StudySessionsTableData({
    required this.id,
    this.lessonId,
    required this.startedAt,
    required this.durationSeconds,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || lessonId != null) {
      map['lesson_id'] = Variable<String>(lessonId);
    }
    map['started_at'] = Variable<DateTime>(startedAt);
    map['duration_seconds'] = Variable<int>(durationSeconds);
    return map;
  }

  StudySessionsTableCompanion toCompanion(bool nullToAbsent) {
    return StudySessionsTableCompanion(
      id: Value(id),
      lessonId: lessonId == null && nullToAbsent
          ? const Value.absent()
          : Value(lessonId),
      startedAt: Value(startedAt),
      durationSeconds: Value(durationSeconds),
    );
  }

  factory StudySessionsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudySessionsTableData(
      id: serializer.fromJson<int>(json['id']),
      lessonId: serializer.fromJson<String?>(json['lessonId']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      durationSeconds: serializer.fromJson<int>(json['durationSeconds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lessonId': serializer.toJson<String?>(lessonId),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'durationSeconds': serializer.toJson<int>(durationSeconds),
    };
  }

  StudySessionsTableData copyWith({
    int? id,
    Value<String?> lessonId = const Value.absent(),
    DateTime? startedAt,
    int? durationSeconds,
  }) => StudySessionsTableData(
    id: id ?? this.id,
    lessonId: lessonId.present ? lessonId.value : this.lessonId,
    startedAt: startedAt ?? this.startedAt,
    durationSeconds: durationSeconds ?? this.durationSeconds,
  );
  StudySessionsTableData copyWithCompanion(StudySessionsTableCompanion data) {
    return StudySessionsTableData(
      id: data.id.present ? data.id.value : this.id,
      lessonId: data.lessonId.present ? data.lessonId.value : this.lessonId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudySessionsTableData(')
          ..write('id: $id, ')
          ..write('lessonId: $lessonId, ')
          ..write('startedAt: $startedAt, ')
          ..write('durationSeconds: $durationSeconds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, lessonId, startedAt, durationSeconds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudySessionsTableData &&
          other.id == this.id &&
          other.lessonId == this.lessonId &&
          other.startedAt == this.startedAt &&
          other.durationSeconds == this.durationSeconds);
}

class StudySessionsTableCompanion
    extends UpdateCompanion<StudySessionsTableData> {
  final Value<int> id;
  final Value<String?> lessonId;
  final Value<DateTime> startedAt;
  final Value<int> durationSeconds;
  const StudySessionsTableCompanion({
    this.id = const Value.absent(),
    this.lessonId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.durationSeconds = const Value.absent(),
  });
  StudySessionsTableCompanion.insert({
    this.id = const Value.absent(),
    this.lessonId = const Value.absent(),
    required DateTime startedAt,
    this.durationSeconds = const Value.absent(),
  }) : startedAt = Value(startedAt);
  static Insertable<StudySessionsTableData> custom({
    Expression<int>? id,
    Expression<String>? lessonId,
    Expression<DateTime>? startedAt,
    Expression<int>? durationSeconds,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lessonId != null) 'lesson_id': lessonId,
      if (startedAt != null) 'started_at': startedAt,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
    });
  }

  StudySessionsTableCompanion copyWith({
    Value<int>? id,
    Value<String?>? lessonId,
    Value<DateTime>? startedAt,
    Value<int>? durationSeconds,
  }) {
    return StudySessionsTableCompanion(
      id: id ?? this.id,
      lessonId: lessonId ?? this.lessonId,
      startedAt: startedAt ?? this.startedAt,
      durationSeconds: durationSeconds ?? this.durationSeconds,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lessonId.present) {
      map['lesson_id'] = Variable<String>(lessonId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudySessionsTableCompanion(')
          ..write('id: $id, ')
          ..write('lessonId: $lessonId, ')
          ..write('startedAt: $startedAt, ')
          ..write('durationSeconds: $durationSeconds')
          ..write(')'))
        .toString();
  }
}

class $ExerciseResultsTableTable extends ExerciseResultsTable
    with TableInfo<$ExerciseResultsTableTable, ExerciseResultsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseResultsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lessonIdMeta = const VerificationMeta(
    'lessonId',
  );
  @override
  late final GeneratedColumn<String> lessonId = GeneratedColumn<String>(
    'lesson_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _correctMeta = const VerificationMeta(
    'correct',
  );
  @override
  late final GeneratedColumn<bool> correct = GeneratedColumn<bool>(
    'correct',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("correct" IN (0, 1))',
    ),
  );
  static const VerificationMeta _answeredAtMeta = const VerificationMeta(
    'answeredAt',
  );
  @override
  late final GeneratedColumn<DateTime> answeredAt = GeneratedColumn<DateTime>(
    'answered_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    lessonId,
    exerciseId,
    correct,
    answeredAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_results_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExerciseResultsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('lesson_id')) {
      context.handle(
        _lessonIdMeta,
        lessonId.isAcceptableOrUnknown(data['lesson_id']!, _lessonIdMeta),
      );
    } else if (isInserting) {
      context.missing(_lessonIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('correct')) {
      context.handle(
        _correctMeta,
        correct.isAcceptableOrUnknown(data['correct']!, _correctMeta),
      );
    } else if (isInserting) {
      context.missing(_correctMeta);
    }
    if (data.containsKey('answered_at')) {
      context.handle(
        _answeredAtMeta,
        answeredAt.isAcceptableOrUnknown(data['answered_at']!, _answeredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_answeredAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {lessonId, exerciseId};
  @override
  ExerciseResultsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseResultsTableData(
      lessonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lesson_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      correct: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}correct'],
      )!,
      answeredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}answered_at'],
      )!,
    );
  }

  @override
  $ExerciseResultsTableTable createAlias(String alias) {
    return $ExerciseResultsTableTable(attachedDatabase, alias);
  }
}

class ExerciseResultsTableData extends DataClass
    implements Insertable<ExerciseResultsTableData> {
  final String lessonId;
  final String exerciseId;
  final bool correct;
  final DateTime answeredAt;
  const ExerciseResultsTableData({
    required this.lessonId,
    required this.exerciseId,
    required this.correct,
    required this.answeredAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['lesson_id'] = Variable<String>(lessonId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['correct'] = Variable<bool>(correct);
    map['answered_at'] = Variable<DateTime>(answeredAt);
    return map;
  }

  ExerciseResultsTableCompanion toCompanion(bool nullToAbsent) {
    return ExerciseResultsTableCompanion(
      lessonId: Value(lessonId),
      exerciseId: Value(exerciseId),
      correct: Value(correct),
      answeredAt: Value(answeredAt),
    );
  }

  factory ExerciseResultsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseResultsTableData(
      lessonId: serializer.fromJson<String>(json['lessonId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      correct: serializer.fromJson<bool>(json['correct']),
      answeredAt: serializer.fromJson<DateTime>(json['answeredAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lessonId': serializer.toJson<String>(lessonId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'correct': serializer.toJson<bool>(correct),
      'answeredAt': serializer.toJson<DateTime>(answeredAt),
    };
  }

  ExerciseResultsTableData copyWith({
    String? lessonId,
    String? exerciseId,
    bool? correct,
    DateTime? answeredAt,
  }) => ExerciseResultsTableData(
    lessonId: lessonId ?? this.lessonId,
    exerciseId: exerciseId ?? this.exerciseId,
    correct: correct ?? this.correct,
    answeredAt: answeredAt ?? this.answeredAt,
  );
  ExerciseResultsTableData copyWithCompanion(
    ExerciseResultsTableCompanion data,
  ) {
    return ExerciseResultsTableData(
      lessonId: data.lessonId.present ? data.lessonId.value : this.lessonId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      correct: data.correct.present ? data.correct.value : this.correct,
      answeredAt: data.answeredAt.present
          ? data.answeredAt.value
          : this.answeredAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseResultsTableData(')
          ..write('lessonId: $lessonId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('correct: $correct, ')
          ..write('answeredAt: $answeredAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(lessonId, exerciseId, correct, answeredAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseResultsTableData &&
          other.lessonId == this.lessonId &&
          other.exerciseId == this.exerciseId &&
          other.correct == this.correct &&
          other.answeredAt == this.answeredAt);
}

class ExerciseResultsTableCompanion
    extends UpdateCompanion<ExerciseResultsTableData> {
  final Value<String> lessonId;
  final Value<String> exerciseId;
  final Value<bool> correct;
  final Value<DateTime> answeredAt;
  final Value<int> rowid;
  const ExerciseResultsTableCompanion({
    this.lessonId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.correct = const Value.absent(),
    this.answeredAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExerciseResultsTableCompanion.insert({
    required String lessonId,
    required String exerciseId,
    required bool correct,
    required DateTime answeredAt,
    this.rowid = const Value.absent(),
  }) : lessonId = Value(lessonId),
       exerciseId = Value(exerciseId),
       correct = Value(correct),
       answeredAt = Value(answeredAt);
  static Insertable<ExerciseResultsTableData> custom({
    Expression<String>? lessonId,
    Expression<String>? exerciseId,
    Expression<bool>? correct,
    Expression<DateTime>? answeredAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (lessonId != null) 'lesson_id': lessonId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (correct != null) 'correct': correct,
      if (answeredAt != null) 'answered_at': answeredAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExerciseResultsTableCompanion copyWith({
    Value<String>? lessonId,
    Value<String>? exerciseId,
    Value<bool>? correct,
    Value<DateTime>? answeredAt,
    Value<int>? rowid,
  }) {
    return ExerciseResultsTableCompanion(
      lessonId: lessonId ?? this.lessonId,
      exerciseId: exerciseId ?? this.exerciseId,
      correct: correct ?? this.correct,
      answeredAt: answeredAt ?? this.answeredAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lessonId.present) {
      map['lesson_id'] = Variable<String>(lessonId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (correct.present) {
      map['correct'] = Variable<bool>(correct.value);
    }
    if (answeredAt.present) {
      map['answered_at'] = Variable<DateTime>(answeredAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseResultsTableCompanion(')
          ..write('lessonId: $lessonId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('correct: $correct, ')
          ..write('answeredAt: $answeredAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LessonProgressTableTable lessonProgressTable =
      $LessonProgressTableTable(this);
  late final $FlashcardsTableTable flashcardsTable = $FlashcardsTableTable(
    this,
  );
  late final $ReviewRecordsTableTable reviewRecordsTable =
      $ReviewRecordsTableTable(this);
  late final $StudySessionsTableTable studySessionsTable =
      $StudySessionsTableTable(this);
  late final $ExerciseResultsTableTable exerciseResultsTable =
      $ExerciseResultsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    lessonProgressTable,
    flashcardsTable,
    reviewRecordsTable,
    studySessionsTable,
    exerciseResultsTable,
  ];
}

typedef $$LessonProgressTableTableCreateCompanionBuilder =
    LessonProgressTableCompanion Function({
      required String lessonId,
      Value<int> lastSectionIndex,
      Value<bool> completed,
      Value<DateTime?> completedAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$LessonProgressTableTableUpdateCompanionBuilder =
    LessonProgressTableCompanion Function({
      Value<String> lessonId,
      Value<int> lastSectionIndex,
      Value<bool> completed,
      Value<DateTime?> completedAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$LessonProgressTableTableFilterComposer
    extends Composer<_$AppDatabase, $LessonProgressTableTable> {
  $$LessonProgressTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get lessonId => $composableBuilder(
    column: $table.lessonId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastSectionIndex => $composableBuilder(
    column: $table.lastSectionIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LessonProgressTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LessonProgressTableTable> {
  $$LessonProgressTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get lessonId => $composableBuilder(
    column: $table.lessonId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastSectionIndex => $composableBuilder(
    column: $table.lastSectionIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LessonProgressTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LessonProgressTableTable> {
  $$LessonProgressTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get lessonId =>
      $composableBuilder(column: $table.lessonId, builder: (column) => column);

  GeneratedColumn<int> get lastSectionIndex => $composableBuilder(
    column: $table.lastSectionIndex,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$LessonProgressTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LessonProgressTableTable,
          LessonProgressTableData,
          $$LessonProgressTableTableFilterComposer,
          $$LessonProgressTableTableOrderingComposer,
          $$LessonProgressTableTableAnnotationComposer,
          $$LessonProgressTableTableCreateCompanionBuilder,
          $$LessonProgressTableTableUpdateCompanionBuilder,
          (
            LessonProgressTableData,
            BaseReferences<
              _$AppDatabase,
              $LessonProgressTableTable,
              LessonProgressTableData
            >,
          ),
          LessonProgressTableData,
          PrefetchHooks Function()
        > {
  $$LessonProgressTableTableTableManager(
    _$AppDatabase db,
    $LessonProgressTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LessonProgressTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LessonProgressTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LessonProgressTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> lessonId = const Value.absent(),
                Value<int> lastSectionIndex = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LessonProgressTableCompanion(
                lessonId: lessonId,
                lastSectionIndex: lastSectionIndex,
                completed: completed,
                completedAt: completedAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String lessonId,
                Value<int> lastSectionIndex = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => LessonProgressTableCompanion.insert(
                lessonId: lessonId,
                lastSectionIndex: lastSectionIndex,
                completed: completed,
                completedAt: completedAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $LessonProgressTableTable,
                    LessonProgressTableData
                  >(table),
                  BaseReferences<
                    _$AppDatabase,
                    $LessonProgressTableTable,
                    LessonProgressTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LessonProgressTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LessonProgressTableTable,
      LessonProgressTableData,
      $$LessonProgressTableTableFilterComposer,
      $$LessonProgressTableTableOrderingComposer,
      $$LessonProgressTableTableAnnotationComposer,
      $$LessonProgressTableTableCreateCompanionBuilder,
      $$LessonProgressTableTableUpdateCompanionBuilder,
      (
        LessonProgressTableData,
        BaseReferences<
          _$AppDatabase,
          $LessonProgressTableTable,
          LessonProgressTableData
        >,
      ),
      LessonProgressTableData,
      PrefetchHooks Function()
    >;
typedef $$FlashcardsTableTableCreateCompanionBuilder =
    FlashcardsTableCompanion Function({
      required String id,
      required String lessonId,
      required String gurmukhi,
      Value<String?> romanised,
      Value<String?> english,
      Value<String?> audioRef,
      Value<double> easeFactor,
      Value<int> intervalDays,
      Value<int> repetitions,
      required DateTime dueAt,
      Value<DateTime?> lastReviewedAt,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$FlashcardsTableTableUpdateCompanionBuilder =
    FlashcardsTableCompanion Function({
      Value<String> id,
      Value<String> lessonId,
      Value<String> gurmukhi,
      Value<String?> romanised,
      Value<String?> english,
      Value<String?> audioRef,
      Value<double> easeFactor,
      Value<int> intervalDays,
      Value<int> repetitions,
      Value<DateTime> dueAt,
      Value<DateTime?> lastReviewedAt,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$FlashcardsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $FlashcardsTableTable,
          FlashcardsTableData
        > {
  $$FlashcardsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $ReviewRecordsTableTable,
    List<ReviewRecordsTableData>
  >
  _reviewRecordsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.reviewRecordsTable,
        aliasName: 'flashcards_table__id__review_records_table__flashcard_id',
      );

  $$ReviewRecordsTableTableProcessedTableManager get reviewRecordsTableRefs {
    final manager = $$ReviewRecordsTableTableTableManager(
      $_db,
      $_db.reviewRecordsTable,
    ).filter((f) => f.flashcardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _reviewRecordsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FlashcardsTableTableFilterComposer
    extends Composer<_$AppDatabase, $FlashcardsTableTable> {
  $$FlashcardsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lessonId => $composableBuilder(
    column: $table.lessonId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gurmukhi => $composableBuilder(
    column: $table.gurmukhi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get romanised => $composableBuilder(
    column: $table.romanised,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get english => $composableBuilder(
    column: $table.english,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get audioRef => $composableBuilder(
    column: $table.audioRef,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueAt => $composableBuilder(
    column: $table.dueAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> reviewRecordsTableRefs(
    Expression<bool> Function($$ReviewRecordsTableTableFilterComposer f) f,
  ) {
    final $$ReviewRecordsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reviewRecordsTable,
      getReferencedColumn: (t) => t.flashcardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewRecordsTableTableFilterComposer(
            $db: $db,
            $table: $db.reviewRecordsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FlashcardsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FlashcardsTableTable> {
  $$FlashcardsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lessonId => $composableBuilder(
    column: $table.lessonId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gurmukhi => $composableBuilder(
    column: $table.gurmukhi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get romanised => $composableBuilder(
    column: $table.romanised,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get english => $composableBuilder(
    column: $table.english,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get audioRef => $composableBuilder(
    column: $table.audioRef,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueAt => $composableBuilder(
    column: $table.dueAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FlashcardsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FlashcardsTableTable> {
  $$FlashcardsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get lessonId =>
      $composableBuilder(column: $table.lessonId, builder: (column) => column);

  GeneratedColumn<String> get gurmukhi =>
      $composableBuilder(column: $table.gurmukhi, builder: (column) => column);

  GeneratedColumn<String> get romanised =>
      $composableBuilder(column: $table.romanised, builder: (column) => column);

  GeneratedColumn<String> get english =>
      $composableBuilder(column: $table.english, builder: (column) => column);

  GeneratedColumn<String> get audioRef =>
      $composableBuilder(column: $table.audioRef, builder: (column) => column);

  GeneratedColumn<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dueAt =>
      $composableBuilder(column: $table.dueAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> reviewRecordsTableRefs<T extends Object>(
    Expression<T> Function($$ReviewRecordsTableTableAnnotationComposer a) f,
  ) {
    final $$ReviewRecordsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.reviewRecordsTable,
          getReferencedColumn: (t) => t.flashcardId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ReviewRecordsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.reviewRecordsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$FlashcardsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FlashcardsTableTable,
          FlashcardsTableData,
          $$FlashcardsTableTableFilterComposer,
          $$FlashcardsTableTableOrderingComposer,
          $$FlashcardsTableTableAnnotationComposer,
          $$FlashcardsTableTableCreateCompanionBuilder,
          $$FlashcardsTableTableUpdateCompanionBuilder,
          (FlashcardsTableData, $$FlashcardsTableTableReferences),
          FlashcardsTableData,
          PrefetchHooks Function({bool reviewRecordsTableRefs})
        > {
  $$FlashcardsTableTableTableManager(
    _$AppDatabase db,
    $FlashcardsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FlashcardsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FlashcardsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FlashcardsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> lessonId = const Value.absent(),
                Value<String> gurmukhi = const Value.absent(),
                Value<String?> romanised = const Value.absent(),
                Value<String?> english = const Value.absent(),
                Value<String?> audioRef = const Value.absent(),
                Value<double> easeFactor = const Value.absent(),
                Value<int> intervalDays = const Value.absent(),
                Value<int> repetitions = const Value.absent(),
                Value<DateTime> dueAt = const Value.absent(),
                Value<DateTime?> lastReviewedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FlashcardsTableCompanion(
                id: id,
                lessonId: lessonId,
                gurmukhi: gurmukhi,
                romanised: romanised,
                english: english,
                audioRef: audioRef,
                easeFactor: easeFactor,
                intervalDays: intervalDays,
                repetitions: repetitions,
                dueAt: dueAt,
                lastReviewedAt: lastReviewedAt,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String lessonId,
                required String gurmukhi,
                Value<String?> romanised = const Value.absent(),
                Value<String?> english = const Value.absent(),
                Value<String?> audioRef = const Value.absent(),
                Value<double> easeFactor = const Value.absent(),
                Value<int> intervalDays = const Value.absent(),
                Value<int> repetitions = const Value.absent(),
                required DateTime dueAt,
                Value<DateTime?> lastReviewedAt = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => FlashcardsTableCompanion.insert(
                id: id,
                lessonId: lessonId,
                gurmukhi: gurmukhi,
                romanised: romanised,
                english: english,
                audioRef: audioRef,
                easeFactor: easeFactor,
                intervalDays: intervalDays,
                repetitions: repetitions,
                dueAt: dueAt,
                lastReviewedAt: lastReviewedAt,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$FlashcardsTableTable, FlashcardsTableData>(
                    table,
                  ),
                  $$FlashcardsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({reviewRecordsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (reviewRecordsTableRefs) db.reviewRecordsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (reviewRecordsTableRefs)
                    await $_getPrefetchedDataByColumns<
                      FlashcardsTableData,
                      $FlashcardsTableTable,
                      ReviewRecordsTableData,
                      $ReviewRecordsTableTable
                    >(
                      currentTable: table,
                      referencedTable: $$FlashcardsTableTableReferences
                          ._reviewRecordsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$FlashcardsTableTableReferences(
                            db,
                            table,
                            p0,
                          ).reviewRecordsTableRefs,
                      currentColumn: 'id',
                      referencedColumn: 'flashcard_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$FlashcardsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FlashcardsTableTable,
      FlashcardsTableData,
      $$FlashcardsTableTableFilterComposer,
      $$FlashcardsTableTableOrderingComposer,
      $$FlashcardsTableTableAnnotationComposer,
      $$FlashcardsTableTableCreateCompanionBuilder,
      $$FlashcardsTableTableUpdateCompanionBuilder,
      (FlashcardsTableData, $$FlashcardsTableTableReferences),
      FlashcardsTableData,
      PrefetchHooks Function({bool reviewRecordsTableRefs})
    >;
typedef $$ReviewRecordsTableTableCreateCompanionBuilder =
    ReviewRecordsTableCompanion Function({
      Value<int> id,
      required String flashcardId,
      required int rating,
      required DateTime reviewedAt,
    });
typedef $$ReviewRecordsTableTableUpdateCompanionBuilder =
    ReviewRecordsTableCompanion Function({
      Value<int> id,
      Value<String> flashcardId,
      Value<int> rating,
      Value<DateTime> reviewedAt,
    });

final class $$ReviewRecordsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ReviewRecordsTableTable,
          ReviewRecordsTableData
        > {
  $$ReviewRecordsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $FlashcardsTableTable _flashcardIdTable(_$AppDatabase db) => db
      .flashcardsTable
      .createAlias('review_records_table__flashcard_id__flashcards_table__id');

  $$FlashcardsTableTableProcessedTableManager get flashcardId {
    final $_column = $_itemColumn<String>('flashcard_id')!;

    final manager = $$FlashcardsTableTableTableManager(
      $_db,
      $_db.flashcardsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_flashcardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReviewRecordsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ReviewRecordsTableTable> {
  $$ReviewRecordsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get reviewedAt => $composableBuilder(
    column: $table.reviewedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$FlashcardsTableTableFilterComposer get flashcardId {
    final $$FlashcardsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.flashcardId,
      referencedTable: $db.flashcardsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FlashcardsTableTableFilterComposer(
            $db: $db,
            $table: $db.flashcardsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReviewRecordsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ReviewRecordsTableTable> {
  $$ReviewRecordsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get reviewedAt => $composableBuilder(
    column: $table.reviewedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$FlashcardsTableTableOrderingComposer get flashcardId {
    final $$FlashcardsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.flashcardId,
      referencedTable: $db.flashcardsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FlashcardsTableTableOrderingComposer(
            $db: $db,
            $table: $db.flashcardsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReviewRecordsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReviewRecordsTableTable> {
  $$ReviewRecordsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<DateTime> get reviewedAt => $composableBuilder(
    column: $table.reviewedAt,
    builder: (column) => column,
  );

  $$FlashcardsTableTableAnnotationComposer get flashcardId {
    final $$FlashcardsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.flashcardId,
      referencedTable: $db.flashcardsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FlashcardsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.flashcardsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReviewRecordsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReviewRecordsTableTable,
          ReviewRecordsTableData,
          $$ReviewRecordsTableTableFilterComposer,
          $$ReviewRecordsTableTableOrderingComposer,
          $$ReviewRecordsTableTableAnnotationComposer,
          $$ReviewRecordsTableTableCreateCompanionBuilder,
          $$ReviewRecordsTableTableUpdateCompanionBuilder,
          (ReviewRecordsTableData, $$ReviewRecordsTableTableReferences),
          ReviewRecordsTableData,
          PrefetchHooks Function({bool flashcardId})
        > {
  $$ReviewRecordsTableTableTableManager(
    _$AppDatabase db,
    $ReviewRecordsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReviewRecordsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReviewRecordsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReviewRecordsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> flashcardId = const Value.absent(),
                Value<int> rating = const Value.absent(),
                Value<DateTime> reviewedAt = const Value.absent(),
              }) => ReviewRecordsTableCompanion(
                id: id,
                flashcardId: flashcardId,
                rating: rating,
                reviewedAt: reviewedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String flashcardId,
                required int rating,
                required DateTime reviewedAt,
              }) => ReviewRecordsTableCompanion.insert(
                id: id,
                flashcardId: flashcardId,
                rating: rating,
                reviewedAt: reviewedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ReviewRecordsTableTable, ReviewRecordsTableData>(
                    table,
                  ),
                  $$ReviewRecordsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({flashcardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (flashcardId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.flashcardId,
                                referencedTable:
                                    $$ReviewRecordsTableTableReferences
                                        ._flashcardIdTable(db),
                                referencedColumn:
                                    $$ReviewRecordsTableTableReferences
                                        ._flashcardIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ReviewRecordsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReviewRecordsTableTable,
      ReviewRecordsTableData,
      $$ReviewRecordsTableTableFilterComposer,
      $$ReviewRecordsTableTableOrderingComposer,
      $$ReviewRecordsTableTableAnnotationComposer,
      $$ReviewRecordsTableTableCreateCompanionBuilder,
      $$ReviewRecordsTableTableUpdateCompanionBuilder,
      (ReviewRecordsTableData, $$ReviewRecordsTableTableReferences),
      ReviewRecordsTableData,
      PrefetchHooks Function({bool flashcardId})
    >;
typedef $$StudySessionsTableTableCreateCompanionBuilder =
    StudySessionsTableCompanion Function({
      Value<int> id,
      Value<String?> lessonId,
      required DateTime startedAt,
      Value<int> durationSeconds,
    });
typedef $$StudySessionsTableTableUpdateCompanionBuilder =
    StudySessionsTableCompanion Function({
      Value<int> id,
      Value<String?> lessonId,
      Value<DateTime> startedAt,
      Value<int> durationSeconds,
    });

class $$StudySessionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $StudySessionsTableTable> {
  $$StudySessionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lessonId => $composableBuilder(
    column: $table.lessonId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StudySessionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $StudySessionsTableTable> {
  $$StudySessionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lessonId => $composableBuilder(
    column: $table.lessonId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StudySessionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudySessionsTableTable> {
  $$StudySessionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get lessonId =>
      $composableBuilder(column: $table.lessonId, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );
}

class $$StudySessionsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudySessionsTableTable,
          StudySessionsTableData,
          $$StudySessionsTableTableFilterComposer,
          $$StudySessionsTableTableOrderingComposer,
          $$StudySessionsTableTableAnnotationComposer,
          $$StudySessionsTableTableCreateCompanionBuilder,
          $$StudySessionsTableTableUpdateCompanionBuilder,
          (
            StudySessionsTableData,
            BaseReferences<
              _$AppDatabase,
              $StudySessionsTableTable,
              StudySessionsTableData
            >,
          ),
          StudySessionsTableData,
          PrefetchHooks Function()
        > {
  $$StudySessionsTableTableTableManager(
    _$AppDatabase db,
    $StudySessionsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudySessionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudySessionsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudySessionsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> lessonId = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<int> durationSeconds = const Value.absent(),
              }) => StudySessionsTableCompanion(
                id: id,
                lessonId: lessonId,
                startedAt: startedAt,
                durationSeconds: durationSeconds,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> lessonId = const Value.absent(),
                required DateTime startedAt,
                Value<int> durationSeconds = const Value.absent(),
              }) => StudySessionsTableCompanion.insert(
                id: id,
                lessonId: lessonId,
                startedAt: startedAt,
                durationSeconds: durationSeconds,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StudySessionsTableTable, StudySessionsTableData>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $StudySessionsTableTable,
                    StudySessionsTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StudySessionsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudySessionsTableTable,
      StudySessionsTableData,
      $$StudySessionsTableTableFilterComposer,
      $$StudySessionsTableTableOrderingComposer,
      $$StudySessionsTableTableAnnotationComposer,
      $$StudySessionsTableTableCreateCompanionBuilder,
      $$StudySessionsTableTableUpdateCompanionBuilder,
      (
        StudySessionsTableData,
        BaseReferences<
          _$AppDatabase,
          $StudySessionsTableTable,
          StudySessionsTableData
        >,
      ),
      StudySessionsTableData,
      PrefetchHooks Function()
    >;
typedef $$ExerciseResultsTableTableCreateCompanionBuilder =
    ExerciseResultsTableCompanion Function({
      required String lessonId,
      required String exerciseId,
      required bool correct,
      required DateTime answeredAt,
      Value<int> rowid,
    });
typedef $$ExerciseResultsTableTableUpdateCompanionBuilder =
    ExerciseResultsTableCompanion Function({
      Value<String> lessonId,
      Value<String> exerciseId,
      Value<bool> correct,
      Value<DateTime> answeredAt,
      Value<int> rowid,
    });

class $$ExerciseResultsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseResultsTableTable> {
  $$ExerciseResultsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get lessonId => $composableBuilder(
    column: $table.lessonId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get correct => $composableBuilder(
    column: $table.correct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get answeredAt => $composableBuilder(
    column: $table.answeredAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExerciseResultsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseResultsTableTable> {
  $$ExerciseResultsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get lessonId => $composableBuilder(
    column: $table.lessonId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get correct => $composableBuilder(
    column: $table.correct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get answeredAt => $composableBuilder(
    column: $table.answeredAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExerciseResultsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseResultsTableTable> {
  $$ExerciseResultsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get lessonId =>
      $composableBuilder(column: $table.lessonId, builder: (column) => column);

  GeneratedColumn<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get correct =>
      $composableBuilder(column: $table.correct, builder: (column) => column);

  GeneratedColumn<DateTime> get answeredAt => $composableBuilder(
    column: $table.answeredAt,
    builder: (column) => column,
  );
}

class $$ExerciseResultsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExerciseResultsTableTable,
          ExerciseResultsTableData,
          $$ExerciseResultsTableTableFilterComposer,
          $$ExerciseResultsTableTableOrderingComposer,
          $$ExerciseResultsTableTableAnnotationComposer,
          $$ExerciseResultsTableTableCreateCompanionBuilder,
          $$ExerciseResultsTableTableUpdateCompanionBuilder,
          (
            ExerciseResultsTableData,
            BaseReferences<
              _$AppDatabase,
              $ExerciseResultsTableTable,
              ExerciseResultsTableData
            >,
          ),
          ExerciseResultsTableData,
          PrefetchHooks Function()
        > {
  $$ExerciseResultsTableTableTableManager(
    _$AppDatabase db,
    $ExerciseResultsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExerciseResultsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExerciseResultsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ExerciseResultsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> lessonId = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<bool> correct = const Value.absent(),
                Value<DateTime> answeredAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExerciseResultsTableCompanion(
                lessonId: lessonId,
                exerciseId: exerciseId,
                correct: correct,
                answeredAt: answeredAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String lessonId,
                required String exerciseId,
                required bool correct,
                required DateTime answeredAt,
                Value<int> rowid = const Value.absent(),
              }) => ExerciseResultsTableCompanion.insert(
                lessonId: lessonId,
                exerciseId: exerciseId,
                correct: correct,
                answeredAt: answeredAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $ExerciseResultsTableTable,
                    ExerciseResultsTableData
                  >(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ExerciseResultsTableTable,
                    ExerciseResultsTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExerciseResultsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExerciseResultsTableTable,
      ExerciseResultsTableData,
      $$ExerciseResultsTableTableFilterComposer,
      $$ExerciseResultsTableTableOrderingComposer,
      $$ExerciseResultsTableTableAnnotationComposer,
      $$ExerciseResultsTableTableCreateCompanionBuilder,
      $$ExerciseResultsTableTableUpdateCompanionBuilder,
      (
        ExerciseResultsTableData,
        BaseReferences<
          _$AppDatabase,
          $ExerciseResultsTableTable,
          ExerciseResultsTableData
        >,
      ),
      ExerciseResultsTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LessonProgressTableTableTableManager get lessonProgressTable =>
      $$LessonProgressTableTableTableManager(_db, _db.lessonProgressTable);
  $$FlashcardsTableTableTableManager get flashcardsTable =>
      $$FlashcardsTableTableTableManager(_db, _db.flashcardsTable);
  $$ReviewRecordsTableTableTableManager get reviewRecordsTable =>
      $$ReviewRecordsTableTableTableManager(_db, _db.reviewRecordsTable);
  $$StudySessionsTableTableTableManager get studySessionsTable =>
      $$StudySessionsTableTableTableManager(_db, _db.studySessionsTable);
  $$ExerciseResultsTableTableTableManager get exerciseResultsTable =>
      $$ExerciseResultsTableTableTableManager(_db, _db.exerciseResultsTable);
}
