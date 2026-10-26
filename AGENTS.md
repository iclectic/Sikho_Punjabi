# Sikho Punjabi

A structured Punjabi language course (Flutter). Takes learners from absolute
beginner to intermediate via lessons, exercises, flashcards, and spaced
repetition.

## Stack decisions

- **State management**: Riverpod 3 (`flutter_riverpod`), hand-written providers.
  No codegen for Riverpod — `Provider`, `FutureProvider`, `NotifierProvider`.
- **Navigation**: `go_router` with a `StatefulShellRoute` bottom-nav shell
  (Learn / Review / Gurmukhi / Progress). Lesson player pushes outside the shell.
- **Persistence**: Drift (SQLite) for progress/flashcards/sessions;
  `shared_preferences` for settings. Repositories abstract storage.
- **Models**: freezed + json_serializable. Lesson/exercise models are
  `sealed` unions dispatched on a `type` JSON key.
- **Theme**: Material 3, light + dark. Design tokens live in
  `lib/core/theme/app_tokens.dart` — no ad-hoc spacing/radius values.

## Architecture

Feature-first, with `domain` / `application` / `presentation` separation inside
each feature. Shared content models live in `lib/content/` (they cross feature
boundaries). DB in `lib/core/database/`.

```
lib/
  app/            # root widget, router, shell
  core/           # theme tokens, database, audio service, prefs
  content/        # course models + AssetContentRepository (JSON loader)
  shared/         # reusable widgets (PunjabiText, ...)
  features/       # learn, lessons, exercises, review, gurmukhi, progress, settings
assets/content/   # versioned course JSON + gurmukhi table
```

## Content model

`Course → Level → Module → LessonRef → Lesson(JSON file) → LessonSection`.
Section types: `intro`, `vocabulary`, `examples`, `breakdown`, `grammar`,
`whyThisWay`, `conversation`, `exerciseSet`, `summary`.
Exercise types: `multipleChoice`, `arrangeWords`, `fillBlank`, `matchPairs`,
`listening` (audio prompt; transcript fallback until recordings exist),
`typeTranslation`.

**Every Punjabi string is unverified sample content** — marked
`verificationStatus: "unverified"` in JSON. Native-speaker review must clear
this flag before release. Never treat the bundled JSON as linguistically final.

## Commands

- Run tests: `flutter test`
- Analyze: `flutter analyze`
- Format: `dart format .`
- Regenerate code after editing models/DB: `dart run build_runner build --delete-conflicting-outputs`

## Offline & persistence

- The app is fully offline: all content is bundled JSON, all progress lives in
  Drift, no network imports exist in `lib/`. Keep it that way until Phase 11.
- DB is at schema v2. Migration tests construct an old-version DB with raw
  `sqlite3` (dev dep), set `PRAGMA user_version`, then open `AppDatabase` on
  `NativeDatabase.opened(raw)` — see `test/database/migration_test.dart`.
- Drift stream providers need an active `container.listen` before `.future`
  emits in unit tests. `ref.read` inside `dispose()` is unsafe — capture
  services in `initState`. `Duration.inDays` truncates toward zero and
  `subtract(Duration(days:))` is DST-unsafe — use calendar arithmetic.

## Not yet built (by design)

Real audio recordings (playback works when files land in `assets/audio/`),
accounts/sync, AI tutor, speaking/speech recognition. Do not present
placeholders as finished features.
