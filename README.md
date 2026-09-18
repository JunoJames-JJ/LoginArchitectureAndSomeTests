# Login Architecture & Tests

A demonstration of a clean, layered login architecture in Swift - built to be maintainable, testable, and scalable by keeping business logic, presentation, and analytics fully decoupled from each other.

## The Core Idea

When a login succeeds or fails, several things typically need to happen at once: update the UI, log an analytics event, and report to a crash/error tracker. A naive approach tangles all of that together in one place. This project solves it with the **Composite pattern**: the core login logic only knows about a single `LoginUseCaseOutput` protocol - it has no idea how many places are actually listening, or what they do with the result.

## Architecture Layers

**Business Logic**
- `LoginUseCase` - performs the actual login and reports the result through a single `LoginUseCaseOutput` protocol, with no knowledge of what happens next.

**Composition**
- `LoginUseCaseComposerDelegate` - implements the Composite pattern: it also conforms to `LoginUseCaseOutput`, but fans a single success/failure event out to a whole list of output handlers. This is what lets the business logic stay blissfully unaware that multiple things need to happen on login.

**Presentation**
- `LoginPresenter` - conforms to `LoginUseCaseOutput`, translating a raw success/failure result into a view model the UI can display.

**Analytics & Monitoring**
- `LoginFirebaseAnalyticsTracker` - conforms to `LoginUseCaseOutput`, logging login events to Firebase Analytics.
- `LoginCrashlyticsTracker` - conforms to `LoginUseCaseOutput`, reporting login events to Crashlytics.

**App Entry Point**
- `AppDelegate` / `SceneDelegate` - standard iOS app lifecycle setup.

## How It Fits Together

```swift
let composer = LoginUseCaseComposerDelegate([
    presenter,
    firebaseTracker,
    crashlyticsTracker
])

let useCase = LoginUseCase(loginOutput: composer)
```

When `useCase` reports a login success or failure, the composer automatically notifies the presenter, the analytics tracker, and the crash tracker - all from one call, with the core login logic never needing to know any of them exist.

## Testing

This project includes **real behavioral unit tests**, not just scaffolding - `LoginUseCaseOutputComposerTests` verifies that the composer correctly fans out events to every registered output, and that call counts match exactly what's expected for both success and failure cases.

## Tech Stack

- Swift
- UIKit
- XCTest

## Why This Architecture Matters

This structure follows the **Single Responsibility Principle** cleanly: the login logic doesn't know about analytics, and the analytics code doesn't know about the UI. Anything that needs to react to a login event just implements `LoginUseCaseOutput` and gets added to the composer - new tracking or presentation logic can be added without ever touching the core business logic.





![LoginArchitecture](https://github.com/JunoJames-JJ/LoginArchitectureAndSomeTests/assets/153018483/226dcf0b-2879-45dc-9895-2b881667104c)
