# Sikho Punjabi

A structured Punjabi language course for iOS, Android, and desktop — built with
Flutter. The goal is to take a learner who knows no Punjabi and help them
understand, construct, and speak everyday Punjabi, progressing from absolute
beginner through intermediate level.

Unlike a phrasebook, the app teaches how sentences are built: every unit shows
Gurmukhi, romanisation, and English; breaks sentences down word by word; and
explains *why* Punjabi is said the way it is.

## Features (Phase 1 — current)

- **Structured curriculum** — `Course → Level → Module → Lesson`, with lessons
  designed to build on each other (Level 1 sample content included)
- **Lesson player** — paged lesson sections: introduction, vocabulary, example
  sentences with word-by-word glosses, sentence breakdowns, grammar notes,
  "Why is it said this way?" explainers, short conversations, exercises, and
  summaries. Lessons save your position so you can stop and resume
- **Exercise engine** — multiple choice, arrange-the-words, fill-in-the-blank,
  and typed translation with immediate feedback
- **Flashcards + spaced repetition** — vocabulary encountered in lessons is
  automatically added to a review deck with an SM-2-style scheduler
  (Again / Hard / Good / Easy)
- **Gurmukhi section** — the full 35-letter alphabet with romanised sounds and
  example words
- **Script display preferences** — Gurmukhi + romanisation + English,
  Gurmukhi + English, romanisation + English, or Punjabi only
- **Progress tracking** — lessons completed, words in review, days studied,
  total study time
- **Light and dark mode**, Material 3 design, offline-first local persistence

## Roadmap

| Phase | Scope |
|---|---|
| 2 | Onboarding flow, home dashboard polish |
| 3 | Course/module/lesson navigation depth |
| 4 | Full exercise engine (match-pairs, listening, speaking) |
| 5–6 | Vocabulary browser, richer spaced repetition |
| 7 | Detailed progress tracking |
| 8 | Progressive Gurmukhi reading lessons |
| 9 | Native pronunciation audio, playback speed control |
| 10 | Offline content packs and sync |
| 11 | Optional accounts, cloud sync, multi-device |
| 12 | AI conversation tutor, pronunciation scoring |

The core learning app is designed to work fully without accounts, internet,
or AI — those are additions, not dependencies.

## Architecture

Feature-first with `domain` / `application` / `presentation` separation inside
each feature:

```
lib/
  app/            # root widget, go_router config, bottom-nav shell
  core/           # theme tokens, Drift database, audio service, prefs
  content/        # course models + JSON content repository
  shared/         # reusable widgets (PunjabiText, ...)
  features/       # learn, lessons, exercises, review, gurmukhi,
                  # progress, settings
assets/content/   # versioned course + Gurmukhi JSON
test/             # unit + widget tests mirroring lib/
```

Key decisions:

| Area | Choice |
|---|---|
| State management | Riverpod 3 (`flutter_riverpod`) |
| Navigation | `go_router` (`StatefulShellRoute` bottom nav) |
| Local storage | Drift (SQLite) + `shared_preferences` |
| Models | `freezed` + `json_serializable` (sealed unions for sections/exercises) |
| Content | Versioned JSON bundles — editable without touching Dart |

## Content review status

> **All Punjabi text in `assets/content/` is sample content marked
> `verificationStatus: "unverified"`.** It exists to develop the product and
> must be reviewed by a native Punjabi speaker before being treated as
> linguistically correct. The content schema keeps Gurmukhi, romanisation,
> translation, and grammar notes as separate fields so reviewers can correct
> each independently.

## Getting started

Requirements: Flutter 3.47+ (stable), Dart 3.11+.

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs  # codegen (freezed, drift, json)
flutter run
```

## Development

```bash
flutter analyze           # static analysis (strict lints enabled)
flutter test              # all tests
dart format .             # format code
dart run build_runner watch --delete-conflicting-outputs  # watch codegen
```

Editing a model in `lib/content/models/` or the database in
`lib/core/database/` requires re-running codegen.

## License

TBD — private repository.
