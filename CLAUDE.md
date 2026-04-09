# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Token Efficient Rules

1. Think before acting. Read existing files before writing code.
2. Be concise in output but thorough in reasoning.
3. Prefer editing over rewriting whole files.
4. Do not re-read files you have already read unless the file may have changed.
5. Test your code before declaring done.
6. No sycophantic openers or closing fluff.
7. Keep solutions simple and direct.
8. User instructions always override this file.

## Project

**Opus AI** — a SwiftUI iOS/macOS app. Currently a fresh project scaffold; features are yet to be implemented.

- **Bundle ID:** UNACH.Opus-AI
- **Deployment Target:** iOS 26.4+
- **Developer Team:** SKKT5AXL7G (Santiago Loya)

## Building & Running

Open the project in Xcode:
```
open "Opus AI/Opus AI.xcodeproj"
```

Build from the command line:
```bash
xcodebuild -scheme "Opus AI" -configuration Debug -destination 'platform=iOS Simulator,name=iPhone 16'
```

There are no test targets yet.

## Architecture

Minimal SwiftUI lifecycle app with two source files:

- `Opus_AIApp.swift` — `@main` entry point, creates a single `WindowGroup` with `ContentView`
- `ContentView.swift` — root view (currently a placeholder globe + "Hello, world!")

**Swift concurrency settings:** `SWIFT_DEFAULT_ACTOR_ISOLATION = MainActor` is set project-wide, so all views and code default to the main actor.

## Key Settings

- No external dependencies (no CocoaPods, no SPM packages)
- Code signing is automatic
- `ENABLE_PREVIEWS = YES` — SwiftUI canvas previews work out of the box
